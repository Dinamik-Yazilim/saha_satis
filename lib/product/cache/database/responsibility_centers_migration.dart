import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ResponsibilityCentersMigration extends Migration {
  @override
  int get version => 1; // Initial version for the ResponsibilityCenters table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'responsibility_centers' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
         autoIncrement: false,
        'responsibility_centers', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to som_Guid AS id (GUIDs stored as String)
          'code': String, // Corresponds to som_kod AS code
          'name': String, // Corresponds to som_isim AS name
          'type': String, // Corresponds to som_tipi AS type
          'createdBy': String, // Corresponds to som_create_user AS createdBy
          'createdAt': String, // Corresponds to som_create_date AS createdAt
          'updatedBy': String, // Corresponds to som_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to som_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info(
      'ResponsibilityCentersMigration: responsibility_centers table successfully created with aliased columns.',
    );
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'responsibility_centers' table.
    await txn.execute('DROP TABLE IF EXISTS responsibility_centers');
    AppLogger.info('ResponsibilityCentersMigration: responsibility_centers table dropped.');
  }
}
