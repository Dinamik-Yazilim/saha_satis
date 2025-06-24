import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class WarehousesMigration extends Migration {
  @override
  int get version => 1; // Initial version for the Warehouses table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'warehouses' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        autoIncrement: false,
        'warehouses', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to dep_Guid AS id (GUIDs stored as String)
          'no': String, // Corresponds to dep_no AS no
          'name': String, // Corresponds to dep_adi AS name
          'type': String, // Corresponds to dep_tipi AS type
          'createdBy': String, // Corresponds to dep_create_user AS createdBy
          'createdAt': String, // Corresponds to dep_create_date AS createdAt
          'updatedBy': String, // Corresponds to dep_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to dep_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('WarehousesMigration: warehouses table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'warehouses' table.
    await txn.execute('DROP TABLE IF EXISTS warehouses');
    AppLogger.info('WarehousesMigration: warehouses table dropped.');
  }
}
