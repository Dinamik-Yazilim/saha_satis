import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class StockMovementsMigration extends Migration {
  @override
  int get version => 1; // Initial version for the StockMovements table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'STOK_HAREKETLERI' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        'STOK_HAREKETLERI', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to sth_Guid AS id (GUIDs stored as String)
          'type': String, // Corresponds to sth_tip AS type
          'kind': String, // Corresponds to sth_cins AS kind
          'documentType': String, // Corresponds to sth_evraktip AS documentType
          'documentSerialNo': String, // Corresponds to sth_evrakno_seri AS documentSerialNo
          'documentSequenceNo': String, // Corresponds to sth_evrakno_sira AS documentSequenceNo
          'documentLineNo': int, // Corresponds to sth_satirno AS documentLineNo
          'documentNo': String, // Corresponds to sth_belge_no AS documentNo
          'documentDate': String, // Corresponds to sth_belge_tarih AS documentDate
          'stockCode': String, // Corresponds to sth_stok_kod AS stockCode
          'accountCode': String, // Corresponds to sth_cari_kodu AS accountCode
          'salespersonCode': String, // Corresponds to sth_plasiyer_kodu AS salespersonCode
          'exchangeRate': double, // Corresponds to sth_alt_doviz_kuru AS exchangeRate
          'quantity': double, // Corresponds to sth_miktar AS quantity
          'quantity2': double, // Corresponds to sth_miktar2 AS quantity2
          'unitPointer': String, // Corresponds to sth_birim_pntr AS unitPointer
          'amount': double, // Corresponds to sth_tutar AS amount
          'discount1': double, // Corresponds to sth_iskonto1 AS discount1
          'discount2': double, // Corresponds to sth_iskonto2 AS discount2
          'discount3': double, // Corresponds to sth_iskonto3 AS discount3
          'discount4': double, // Corresponds to sth_iskonto4 AS discount4
          'discount5': double, // Corresponds to sth_iskonto5 AS discount5
          'discount6': double, // Corresponds to sth_iskonto6 AS discount6
          'expense1': double, // Corresponds to sth_masraf1 AS expense1
          'expense2': double, // Corresponds to sth_masraf2 AS expense2
          'expense3': double, // Corresponds to sth_masraf3 AS expense3
          'expense4': double, // Corresponds to sth_masraf4 AS expense4
          'taxPointer': String, // Corresponds to sth_vergi_pntr AS taxPointer
          'taxAmount': double, // Corresponds to sth_vergi AS taxAmount
          'description': String, // Corresponds to sth_aciklama AS description
          'orderUid': String, // Corresponds to sth_sip_uid AS orderUid
          'invoiceUid': String, // Corresponds to sth_fat_uid AS invoiceUid
          'entryWarehouseNo': String, // Corresponds to sth_giris_depo_no AS entryWarehouseNo
          'exitWarehouseNo': String, // Corresponds to sth_cikis_depo_no AS exitWarehouseNo
          'goodsReceiptShipmentDate': String, // Corresponds to sth_malkbl_sevk_tarihi AS goodsReceiptShipmentDate
          'accountResponsibilityCenter': String, // Corresponds to sth_cari_srm_merkezi AS accountResponsibilityCenter
          'costMain': double, // Corresponds to sth_maliyet_ana AS costMain
          'costAlternative': double, // Corresponds to sth_maliyet_alternatif AS costAlternative
          'costOriginal': double, // Corresponds to sth_maliyet_orjinal AS costOriginal
          'createdBy': String, // Corresponds to sth_create_user AS createdBy
          'createdAt': String, // Corresponds to sth_create_date AS createdAt
          'updatedBy': String, // Corresponds to sth_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to sth_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('StockMovementsMigration: STOK_HAREKETLERI table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'STOK_HAREKETLERI' table.
    await txn.execute('DROP TABLE IF EXISTS STOK_HAREKETLERI');
    AppLogger.info('StockMovementsMigration: STOK_HAREKETLERI table dropped.');
  }
}
