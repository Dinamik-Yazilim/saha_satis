import 'package:core/src/utils/exceptions.dart';
import 'package:sqflite/sqflite.dart' hide DatabaseException;
import 'package:core/core.dart'; // For AppLogger and CustomDatabaseException

/// An abstract class that manages database migrations.
/// Every migration class must implement this interface.
abstract class Migration {
  int get version; // The version number of the migration
  Future<void> up(Transaction txn); // Applies the migration (forward)
  Future<void> down(Transaction txn); // Reverts the migration (backward)
}

/// A class that manages the database schema.
/// It contains all migrations and ensures they are applied in the correct order.
class MigrationManager {
  // Singleton instance
  static final MigrationManager _instance = MigrationManager._internal();

  // The list of migrations to be provided externally via the constructor
  final List<Migration> _migrations;

  // Factory constructor for singleton access
  factory MigrationManager({required List<Migration> migrations}) {
    if (_instance._migrations.isEmpty) {
      _instance._migrations.addAll(
        migrations.toList()..sort((a, b) => a.version.compareTo(b.version)),
      ); // Sort by version
    } else if (_instance._migrations.length != migrations.length ||
        _instance._migrations.any((m) => !migrations.contains(m))) {
      // If the migration list changes, we can log a warning.
      AppLogger.warning('MigrationManager re-initialized with a different migration list.');
    }
    return _instance;
  }

  // Private constructor
  MigrationManager._internal() : _migrations = [];

  /// Returns the highest version number among the registered migrations.
  int get latestVersion {
    if (_migrations.isEmpty) {
      return 0; // If there are no migrations, the version is 0
    }
    return _migrations.last.version; // Since migrations are sorted, the last one has the highest version.
  }

  /// Runs when the database is created for the first time.
  /// Applies all migrations in version order.
  Future<void> onCreate(Database db, int version) async {
    AppLogger.info('Database is being created, version: $version');
    try {
      // Apply all migrations sequentially
      for (var migration in _migrations) {
        if (migration.version <= version) {
          // Apply only relevant versions
          await db.transaction((txn) async {
            await migration.up(txn);
            AppLogger.info('Migration v${migration.version} UP applied.');
          });
        }
      }
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred during database onCreate: $e', e, stackTrace);
      throw DatabaseException('Error occurred while creating the database: $e');
    }
  }

  /// Runs when the database version is upgraded.
  /// Applies necessary migrations for transitioning from the old version to the new version.
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    AppLogger.info('Database is being upgraded: $oldVersion -> $newVersion');
    try {
      for (var migration in _migrations) {
        // Apply migrations that are greater than the old version and less than or equal to the new version.
        if (migration.version > oldVersion && migration.version <= newVersion) {
          await db.transaction((txn) async {
            await migration.up(txn);
            AppLogger.info('Migration v${migration.version} UP applied.');
          });
        }
      }
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred during database onUpgrade: $e', e, stackTrace);
      throw DatabaseException('Error occurred while upgrading the database: $e');
    }
  }

  /// Runs when the database version is downgraded (optional).
  Future<void> onDowngrade(Database db, int oldVersion, int newVersion) async {
    AppLogger.warning('Database is being downgraded: $oldVersion -> $newVersion (Normally not recommended)');
    try {
      // Revert migrations in reverse order
      for (var migration in _migrations.reversed) {
        if (migration.version > newVersion && migration.version <= oldVersion) {
          await db.transaction((txn) async {
            await migration.down(txn);
            AppLogger.info('Migration v${migration.version} DOWN applied.');
          });
        }
      }
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred during database onDowngrade: $e', e, stackTrace);
      throw DatabaseException('Error occurred while downgrading the database: $e');
    }
  }

  /// Runs when the database is opened (on each opening).
  Future<void> onOpen(Database db) async {
    AppLogger.info('Database opened.');
    // Additional startup operations can be performed here.
  }
}
