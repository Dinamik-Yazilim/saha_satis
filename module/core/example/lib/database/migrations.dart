import 'package:sqflite/sqflite.dart';
import 'package:core/core.dart'; // For Migration, DatabaseHelper, and AppLogger

/// Database migration version 1.
/// Creates the 'users' table.
class MigrationV1 extends Migration {
  @override
  int get version => 1; // Version number of the migration

  @override
  Future<void> up(Transaction txn) async {
    await txn.execute(
      // Used 'txn' instead of 'db' for transaction
      DatabaseHelper.createTableSql(
        'users', // Table name
        {
          'id': int,
          'name': String,
          'age': int,
          'email': String,
          'isActive': bool, // We'll store boolean as INTEGER (0 or 1) in SQLite
        },
        'id', // Primary Key
        autoIncrement: true, // Auto-incrementing ID
      ),
    );
    AppLogger.info('MigrationV1: users table created.');
  }

  @override
  Future<void> down(Transaction txn) async {
    await txn.execute('DROP TABLE IF EXISTS users'); // Used 'txn' instead of 'db' for transaction
    AppLogger.info('MigrationV1: users table dropped.');
  }
}

/// Database migration version 2.
/// Adds the 'lastLogin' column to the 'users' table.
class MigrationV2 extends Migration {
  @override
  int get version => 2; // Version number of the migration

  @override
  Future<void> up(Transaction txn) async {
    await txn.execute(
      // Used 'txn' instead of 'db' for transaction
      DatabaseHelper.addColumnSql(
        'users',
        'lastLogin', // New column name
        String, // Column type (String for DateTime.now().toIso8601String())
        defaultValue: DateTime.now().toIso8601String(), // Default value
      ),
    );
    AppLogger.info('MigrationV2: lastLogin column added to users table.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // ALTER TABLE DROP COLUMN is not directly supported in SQLite.
    AppLogger.warning('MigrationV2: Dropping lastLogin column is not supported, manual intervention might be needed.');
  }
}

/// Database migration version 3.
/// Adds the 'gender' column to the 'users' table.
class MigrationV3 extends Migration {
  @override
  int get version => 3; // Version number of the migration

  @override
  Future<void> up(Transaction txn) async {
    await txn.execute(
      DatabaseHelper.addColumnSql(
        'users',
        'gender', // New column name
        String, // Column type
        defaultValue: 'unknown', // Default value
      ),
    );
    AppLogger.info('MigrationV3: gender column added to users table.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // ALTER TABLE DROP COLUMN is not directly supported in SQLite.
    AppLogger.warning('MigrationV3: Dropping gender column is not supported, manual intervention might be needed.');
  }
}
