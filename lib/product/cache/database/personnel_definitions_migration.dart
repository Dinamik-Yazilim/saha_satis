import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class PersonnelDefinitionsMigration extends Migration {
  @override
  int get version => 1; // Initial version for the PersonnelDefinitions table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'CARI_PERSONEL_TANIMLARI' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        'CARI_PERSONEL_TANIMLARI', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to cari_per_Guid AS id (GUIDs stored as String)
          'personnelCode': String, // Corresponds to cari_per_kod AS personnelCode
          'firstName': String, // Corresponds to cari_per_adi AS firstName
          'lastName': String, // Corresponds to cari_per_soyadi AS lastName
          'type': String, // Corresponds to cari_per_tip AS type
          'currencyType': String, // Corresponds to cari_per_doviz_cinsi AS currencyType
          'userNo': String, // Corresponds to cari_per_userno AS userNo
          'warehouseNo': String, // Corresponds to cari_per_depono AS warehouseNo
          'mobilePhone': String, // Corresponds to cari_per_cepno AS mobilePhone
          'email': String, // Corresponds to cari_per_mail AS email
          'calendarCode': String, // Corresponds to cari_takvim_kodu AS calendarCode
          'identityNo': String, // Corresponds to cari_per_TcKimlikNo AS identityNo
          'createdBy': String, // Corresponds to cari_per_create_user AS createdBy
          'createdAt': String, // Corresponds to cari_per_create_date AS createdAt
          'updatedBy': String, // Corresponds to cari_per_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to cari_per_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info(
      'PersonnelDefinitionsMigration: CARI_PERSONEL_TANIMLARI table successfully created with aliased columns.',
    );
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'CARI_PERSONEL_TANIMLARI' table.
    await txn.execute('DROP TABLE IF EXISTS CARI_PERSONEL_TANIMLARI');
    AppLogger.info('PersonnelDefinitionsMigration: CARI_PERSONEL_TANIMLARI table dropped.');
  }
}
