import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class CustomerAddressesMigration extends Migration {
  @override
  int get version => 1; // Initial version for the CustomerAddresses table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'CARI_HESAP_ADRESLERI' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        'CARI_HESAP_ADRESLERI', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to adr_Guid AS id (GUIDs stored as String)
          'accountCode': String, // Corresponds to adr_cari_kod AS accountCode
          'addressNo': int, // Corresponds to adr_adres_no AS addressNo
          'street': String, // Corresponds to adr_cadde AS street
          'neighborhood': String, // Corresponds to adr_mahalle AS neighborhood
          'avenue': String, // Corresponds to adr_sokak AS avenue
          'district': String, // Corresponds to adr_semt AS district
          'apartmentNo': String, // Corresponds to adr_Apt_No AS apartmentNo
          'zipCode': String, // Corresponds to adr_posta_kodu AS zipCode
          'county': String, // Corresponds to adr_ilce AS county
          'city': String, // Corresponds to adr_il AS city
          'addressCode': String, // Corresponds to adr_Adres_kodu AS addressCode
          'phoneCountryCode': String, // Corresponds to adr_tel_ulke_kodu AS phoneCountryCode
          'phoneAreaCode': String, // Corresponds to adr_tel_bolge_kodu AS phoneAreaCode
          'phoneNo1': String, // Corresponds to adr_tel_no1 AS phoneNo1
          'phoneNo2': String, // Corresponds to adr_tel_no2 AS phoneNo2
          'representativeCode': String, // Corresponds to adr_temsilci_kodu AS representativeCode
          'specialNote': String, // Corresponds to adr_ozel_not AS specialNote
          'visitDay': double, // Corresponds to adr_ziyaret_gunu AS visitDay
          'gpsLatitude': double,
          // Corresponds to adr_gps_enlem AS gpsLatitude (store as String, convert to double in Dart if needed)
          'gpsLongitude': double,
          // Corresponds to adr_gps_boylam AS gpsLongitude (store as String, convert to double in Dart if needed)
          'visitWeek': int, // Corresponds to adr_ziyarethaftasi AS visitWeek
          'visitDay2_1': int, // Corresponds to adr_ziygunu2_1 AS visitDay2_1
          'visitDay2_2': int, // Corresponds to adr_ziygunu2_2 AS visitDay2_2
          'visitDay2_3': int, // Corresponds to adr_ziygunu2_3 AS visitDay2_3
          'visitDay2_4': int, // Corresponds to adr_ziygunu2_4 AS visitDay2_4
          'visitDay2_5': int, // Corresponds to adr_ziygunu2_5 AS visitDay2_5
          'visitDay2_6': int, // Corresponds to adr_ziygunu2_6 AS visitDay2_6
          'visitDay2_7': int, // Corresponds to adr_ziygunu2_7 AS visitDay2_7
          'eInvoiceAlias': String, // Corresponds to adr_efatura_alias AS eInvoiceAlias
          'createdBy': int, // Corresponds to adr_create_user AS createdBy
          'createdAt': String, // Corresponds to adr_create_date AS createdAt
          'updatedBy': int, // Corresponds to adr_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to adr_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('CustomerAddressesMigration: CARI_HESAP_ADRESLERI table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'CARI_HESAP_ADRESLERI' table.
    await txn.execute('DROP TABLE IF EXISTS CARI_HESAP_ADRESLERI');
    AppLogger.info('CustomerAddressesMigration: CARI_HESAP_ADRESLERI table dropped.');
  }
}
