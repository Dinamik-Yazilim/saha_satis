import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class PersonnelDefinitionsMigration extends Migration {
  @override
  int get version => 1; // Initial version for the PersonnelDefinitions table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'personnel_definitions' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
         autoIncrement: false,
        'personnel_definitions', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to cari_per_Guid AS id (GUIDs stored as String)
          'personnelCode': String, // Corresponds to cari_per_kod AS personnelCode
          'firstName': String, // Corresponds to cari_per_adi AS firstName
          'lastName': String, // Corresponds to cari_per_soyadi AS lastName
          'type': int, // Corresponds to cari_per_tip AS type
          'currencyType': int, // Corresponds to cari_per_doviz_cinsi AS currencyType
          'userNo': int, // Corresponds to cari_per_userno AS userNo
          'warehouseNo': int, // Corresponds to cari_per_depono AS warehouseNo
          'mobilePhone': String, // Corresponds to cari_per_cepno AS mobilePhone
          'email': String, // Corresponds to cari_per_mail AS email
          'calendarCode': String, // Corresponds to cari_takvim_kodu AS calendarCode
          'identityNo': String, // Corresponds to cari_per_TcKimlikNo AS identityNo
          'createdBy': int, // Corresponds to cari_per_create_user AS createdBy
          'createdAt': String, // Corresponds to cari_per_create_date AS createdAt
          'updatedBy': int, // Corresponds to cari_per_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to cari_per_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info(
      'PersonnelDefinitionsMigration: personnel_definitions table successfully created with aliased columns.',
    );
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'personnel_definitions' table.
    await txn.execute('DROP TABLE IF EXISTS personnel_definitions');
    AppLogger.info('PersonnelDefinitionsMigration: personnel_definitions table dropped.');
  }
}
