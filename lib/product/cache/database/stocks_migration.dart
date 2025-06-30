import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class StocksMigration extends Migration {
  @override
  int get version => 1; // Initial version for the Stocks table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'stocks' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        autoIncrement: false,
        'stocks', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to sto_Guid AS id (GUIDs stored as String)
          'code': String, // Corresponds to sto_kod AS code
          'name': String, // Corresponds to sto_isim AS name
          'shortName': String, // Corresponds to sto_kisa_ismi AS shortName
          'foreignName': String, // Corresponds to sto_yabanci_isim AS foreignName
          'vendorCode': String, // Corresponds to sto_sat_cari_kod AS vendorCode
          'unit1Name': String, // Corresponds to sto_birim1_ad AS unit1Name
          'unit1Multiplier': double, // Corresponds to sto_birim1_katsayi AS unit1Multiplier
          'unit2Name': String, // Corresponds to sto_birim2_ad AS unit2Name
          'unit2Multiplier': double, // Corresponds to sto_birim2_katsayi AS unit2Multiplier
          'unit3Name': String, // Corresponds to sto_birim3_ad AS unit3Name
          'unit3Multiplier': double, // Corresponds to sto_birim3_katsayi AS unit3Multiplier
          'unit4Name': String, // Corresponds to sto_birim4_ad AS unit4Name
          'unit4Multiplier': double, // Corresponds to sto_birim4_katsayi AS unit4Multiplier
          'retailTax': int, // Corresponds to sto_parakende_vergi AS retailTax
          'wholesaleTax': int, // Corresponds to sto_toptan_vergi AS wholesaleTax
          'salesBlocked': int, // Corresponds to sto_satis_dursun AS salesBlocked (boolean/int 0 or 1)
          'orderBlocked': int, // Corresponds to sto_siparis_dursun AS orderBlocked (boolean/int 0 or 1)
          'goodsReceiptBlocked': int, // Corresponds to sto_malkabul_dursun AS goodsReceiptBlocked (boolean/int 0 or 1)
          'categoryCode': String, // Corresponds to sto_kategori_kodu AS categoryCode
          'brandCode': String, // Corresponds to sto_marka_kodu AS brandCode
          'sizeCode': String, // Corresponds to sto_beden_kodu AS sizeCode
          'colorCode': String, // Corresponds to sto_renk_kodu AS colorCode
          'modelCode': String, // Corresponds to sto_model_kodu AS modelCode
          'seasonCode': String, // Corresponds to sto_sezon_kodu AS seasonCode
          'origin': String, // Corresponds to sto_mensei AS origin
          'mainGroupCode': String, // Corresponds to sto_anagrup_kod AS mainGroupCode
          'detailTracking': int, // Corresponds to sto_detay_takip AS detailTracking (boolean/int 0 or 1)
          'createdBy': int, // Corresponds to sto_create_user AS createdBy
          'createdAt': String, // Corresponds to sto_create_date AS createdAt
          'updatedBy': int, // Corresponds to sto_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to sto_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('StocksMigration: stocks table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'stocks' table.
    await txn.execute('DROP TABLE IF EXISTS stocks');
    AppLogger.info('StocksMigration: stocks table dropped.');
  }
}
