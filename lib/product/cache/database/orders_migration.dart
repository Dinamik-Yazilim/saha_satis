import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class OrdersMigration extends Migration {
  @override
  int get version => 1; // Initial version for the Orders table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'SIPARISLER' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        'SIPARISLER', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to sip_Guid AS id (GUIDs stored as String)
          'kind': String, // Corresponds to sip_cins AS kind
          'type': String, // Corresponds to sip_tip AS type
          'documentSerialNo': String, // Corresponds to sip_evrakno_seri AS documentSerialNo
          'documentSequenceNo': String, // Corresponds to sip_evrakno_sira AS documentSequenceNo
          'documentLineNo': int, // Corresponds to sip_satirno AS documentLineNo
          'vendorCode': String, // Corresponds to sip_satici_kod AS vendorCode
          'unitPrice': double, // Corresponds to sip_b_fiyat AS unitPrice
          'quantity': double, // Corresponds to sip_miktar AS quantity
          'unitPointer': String, // Corresponds to sip_birim_pntr AS unitPointer
          'deliveredQuantity': double, // Corresponds to sip_teslim_miktar AS deliveredQuantity
          'amount': double, // Corresponds to sip_tutar AS amount
          'discount1': double, // Corresponds to sip_iskonto1 AS discount1
          'discount2': double, // Corresponds to sip_iskonto2 AS discount2
          'discount3': double, // Corresponds to sip_iskonto3 AS discount3
          'discount4': double, // Corresponds to sip_iskonto4 AS discount4
          'discount5': double, // Corresponds to sip_iskonto5 AS discount5
          'discount6': double, // Corresponds to sip_iskonto6 AS discount6
          'expense1': double, // Corresponds to sip_masraf1 AS expense1
          'expense2': double, // Corresponds to sip_masraf2 AS expense2
          'expense3': double, // Corresponds to sip_masraf3 AS expense3
          'expense4': double, // Corresponds to sip_masraf4 AS expense4
          'taxPointer': String, // Corresponds to sip_vergi_pntr AS taxPointer
          'taxAmount': double, // Corresponds to sip_vergi AS taxAmount
          'description': String, // Corresponds to sip_aciklama AS description
          'description2': String, // Corresponds to sip_aciklama2 AS description2
          'warehouseNo': String, // Corresponds to sip_depono AS warehouseNo
          'currencyRate': double, // Corresponds to sip_doviz_kuru AS currencyRate
          'exchangeRate': double, // Corresponds to sip_alt_doviz_kuru AS exchangeRate
          'createdBy': String, // Corresponds to sip_create_user AS createdBy
          'createdAt': String, // Corresponds to sip_create_date AS createdAt
          'updatedBy': String, // Corresponds to sip_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to sip_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('OrdersMigration: SIPARISLER table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'SIPARISLER' table.
    await txn.execute('DROP TABLE IF EXISTS SIPARISLER');
    AppLogger.info('OrdersMigration: SIPARISLER table dropped.');
  }
}
