import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class CashboxesMigration extends Migration {
  @override
  int get version => 1; // Initial version for the Cashboxes table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'cash_boxes' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
         autoIncrement: false,
        'cash_boxes', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to kas_Guid AS id (GUIDs stored as String)
          'code': String, // Corresponds to kas_kod AS code
          'name': String, // Corresponds to kas_isim AS name
          'type': String, // Corresponds to kas_tip AS type
          'createdBy': String, // Corresponds to kas_create_user AS createdBy
          'createdAt': String, // Corresponds to kas_create_date AS createdAt
          'updatedBy': String, // Corresponds to kas_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to kas_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('CashboxesMigration: cash_boxes table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'cash_boxes' table.
    await txn.execute('DROP TABLE IF EXISTS cash_boxes');
    AppLogger.info('CashboxesMigration: cash_boxes table dropped.');
  }
}
