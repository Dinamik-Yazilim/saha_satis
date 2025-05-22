import 'package:core/src/utils/exceptions.dart';
import 'package:sqflite/sqflite.dart' hide DatabaseException;
import 'package:path/path.dart' as path;
import 'package:core/core.dart'; // For AppLogger and DatabaseException

/// A singleton class that manages database operations.
/// It provides a single database connection throughout the application.
class DatabaseProvider {
  // Singleton instance
  static DatabaseProvider? _instance;
  static const String _databaseName = 'mobile_database.db';

  Database? _database;
  final MigrationManager _migrationManager;
  final int _databaseVersion; // The database version number, obtained from MigrationManager

  /// Returns the singleton instance of DatabaseProvider.
  /// Providing a MigrationManager in the constructor is mandatory.
  factory DatabaseProvider({required MigrationManager migrationManager}) {
    // If _instance bash't been created yet, create a new one and assign it to _instance.
    // Otherwise, return the existing _instance.
    _instance ??= DatabaseProvider._internal(
      migrationManager,
      migrationManager.latestVersion, // We get the latest version from MigrationManager
    );
    return _instance!;
  }

  /// A static getter for external access to the singleton instance.
  static DatabaseProvider get instance {
    if (_instance == null) {
      // If the instance hasn't been initialized and this getter is called,
      // it's an error because the DatabaseProvider's factory constructor
      // should have been called in main().
      throw StateError(
        'DatabaseProvider has not been initialized. '
        'Ensure DatabaseProvider is instantiated in main() before calling DatabaseProvider.instance.',
      );
    }
    return _instance!;
  }

  /// Private internal constructor (used for the singleton pattern).
  DatabaseProvider._internal(this._migrationManager, this._databaseVersion);

  /// Opens and returns the database connection.
  /// If the connection isn't open, it establishes a new one.
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  /// Initializes the database.
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final dbPath = path.join(databasePath, _databaseName);

    AppLogger.info('Database path: $dbPath');

    return await openDatabase(
      dbPath,
      version: _databaseVersion, // The version now comes from MigrationManager
      onCreate: (db, version) async {
        AppLogger.info('Database onCreate triggered.');
        try {
          await _migrationManager.onCreate(db, version);
        } catch (e, stackTrace) {
          AppLogger.error('Database onCreate error: $e', e, stackTrace);
          throw DatabaseException('Error occurred while creating the database: $e');
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        AppLogger.info('Database onUpgrade triggered: $oldVersion -> $newVersion');
        try {
          await _migrationManager.onUpgrade(db, oldVersion, newVersion);
        } catch (e, stackTrace) {
          AppLogger.error('Database onUpgrade error: $e', e, stackTrace);
          throw DatabaseException('Error occurred while upgrading the database: $e');
        }
      },
      onDowngrade: (db, oldVersion, newVersion) async {
        AppLogger.warning('Database onDowngrade triggered: $oldVersion -> $newVersion (Normally not recommended)');
        try {
          await _migrationManager.onDowngrade(db, oldVersion, newVersion);
        } catch (e, stackTrace) {
          AppLogger.error('Database onDowngrade error: $e', e, stackTrace);
          throw DatabaseException('Error occurred while downgrading the database: $e');
        }
      },
      onOpen: (db) async {
        AppLogger.info('Database onOpen triggered.');
        await _migrationManager.onOpen(db);
      },
    );
  }

  /// Closes the current database connection.
  Future<void> close() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
      AppLogger.info('Database connection closed.');
    }
  }

  /// Deletes the database file.
  Future<void> deleteDatabaseFile() async {
    final databasePath = await getDatabasesPath();
    final dbPath = path.join(databasePath, _databaseName);
    try {
      await deleteDatabase(dbPath);
      _database = null; // Reset the connection
      AppLogger.warning('Database file deleted: $dbPath');
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred while deleting the database file: $e', e, stackTrace);
      throw DatabaseException('Could not delete the database file: $e');
    }
  }
}
