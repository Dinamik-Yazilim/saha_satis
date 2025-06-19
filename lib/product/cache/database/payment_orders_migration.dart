import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class PaymentOrdersMigration extends Migration {
  @override
  int get version => 1; // Initial version for the PaymentOrders table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'ODEME_EMIRLERI' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        'ODEME_EMIRLERI', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to sck_Guid AS id (GUIDs stored as String)
          'companyNo': String, // Corresponds to sck_firmano AS companyNo
          'branchNo': String, // Corresponds to sck_subeno AS branchNo
          'type': String, // Corresponds to sck_tip AS type
          'referenceNo': String, // Corresponds to sck_refno AS referenceNo
          'bankNo': String, // Corresponds to sck_bankano AS bankNo
          'debtor': String, // Corresponds to sck_borclu AS debtor
          'dueDate': String, // Corresponds to sck_vade AS dueDate
          'amount': double, // Corresponds to sck_tutar AS amount
          'currency': String, // Corresponds to sck_doviz AS currency
          'paidAmount': double, // Corresponds to sck_odenen AS paidAmount
          'ownerAccountKind': String, // Corresponds to sck_sahip_cari_cins AS ownerAccountKind
          'ownerAccountCode': String, // Corresponds to sck_sahip_cari_kodu AS ownerAccountCode
          'ownerAccountGroupNo': String, // Corresponds to sck_sahip_cari_grupno AS ownerAccountGroupNo
          'locationAccountKind': String, // Corresponds to sck_nerede_cari_cins AS locationAccountKind
          'locationAccountCode': String, // Corresponds to sck_nerede_cari_kodu AS locationAccountCode
          'locationAccountGroupNo': String, // Corresponds to sck_nerede_cari_grupno AS locationAccountGroupNo
          'firstDocumentSerial': String, // Corresponds to sck_ilk_evrak_seri AS firstDocumentSerial
          'firstDocumentSequenceNo': String, // Corresponds to sck_ilk_evrak_sira_no AS firstDocumentSequenceNo
          'firstDocumentLineNo': int, // Corresponds to sck_ilk_evrak_satir_no AS firstDocumentLineNo
          'lastPosition': String, // Corresponds to sck_sonpoz AS lastPosition
          'createdBy': String, // Corresponds to sck_create_user AS createdBy
          'createdAt': String, // Corresponds to sck_create_date AS createdAt
          'updatedBy': String, // Corresponds to sck_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to sck_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('PaymentOrdersMigration: ODEME_EMIRLERI table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'ODEME_EMIRLERI' table.
    await txn.execute('DROP TABLE IF EXISTS ODEME_EMIRLERI');
    AppLogger.info('PaymentOrdersMigration: ODEME_EMIRLERI table dropped.');
  }
}
