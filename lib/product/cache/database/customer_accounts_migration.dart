import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class CustomerAccountsMigration extends Migration {
  @override
  int get version => 1; // Initial version for the CustomerAccounts table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'CARI_HESAPLAR' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        'CARI_HESAPLAR', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to cari_Guid AS id (GUIDs stored as String)
          'code': String, // Corresponds to cari_kod AS code
          'title1': String, // Corresponds to cari_unvan1 AS title1
          'title2': String, // Corresponds to cari_unvan2 AS title2
          'taxOfficeName': String, // Corresponds to cari_vdaire_adi AS taxOfficeName
          'taxOfficeNo': String, // Corresponds to cari_vdaire_no AS taxOfficeNo
          'representativeCode': String, // Corresponds to cari_temsilci_kodu AS representativeCode
          'email': String, // Corresponds to cari_EMail AS email
          'mobilePhone': String, // Corresponds to cari_CepTel AS mobilePhone
          'taxOfficeCode': String, // Corresponds to cari_vergidairekodu AS taxOfficeCode
          'naceCode1': String, // Corresponds to cari_nacekodu_1 AS naceCode1
          'naceCode2': String, // Corresponds to cari_nacekodu_2 AS naceCode2
          'companyType': String, // Corresponds to cari_sirket_turu AS companyType
          'createdBy': int, // Corresponds to cari_create_user AS createdBy
          'createdAt': String, // Corresponds to cari_create_date AS createdAt
          'updatedBy': int, // Corresponds to cari_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to cari_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('CustomerAccountsMigration: CARI_HESAPLAR table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'CARI_HESAPLAR' table.
    await txn.execute('DROP TABLE IF EXISTS CARI_HESAPLAR');
    AppLogger.info('CustomerAccountsMigration: CARI_HESAPLAR table dropped.');
  }
}
