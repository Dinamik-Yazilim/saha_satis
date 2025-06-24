import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class CustomerAccountMovementsMigration extends Migration {
  @override
  int get version => 1; // Initial version for the CustomerAccountMovements table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'customer_account_movements' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
         autoIncrement: false,
        'customer_account_movements', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to cha_Guid AS id (GUIDs stored as String)
          'companyNo': String, // Corresponds to cha_firmano AS companyNo
          'branchNo': String, // Corresponds to cha_subeno AS branchNo
          'documentType': String, // Corresponds to cha_evrak_tip AS documentType
          'documentSerialNo': String, // Corresponds to cha_evrakno_seri AS documentSerialNo
          'documentSequenceNo': String, // Corresponds to cha_evrakno_sira AS documentSequenceNo
          'documentLineNo': int, // Corresponds to cha_satir_no AS documentLineNo
          'type': String, // Corresponds to cha_tip AS type
          'kind': String, // Corresponds to cha_cinsi AS kind
          'documentNo': String, // Corresponds to cha_belge_no AS documentNo
          'documentDate': String, // Corresponds to cha_belge_tarih AS documentDate
          'description': String, // Corresponds to cha_aciklama AS description
          'vendorCode': String, // Corresponds to cha_satici_kodu AS vendorCode
          'accountKind': String, // Corresponds to cha_cari_cins AS accountKind
          'code': String, // Corresponds to cha_kod AS code
          'turnoverAccountCode': String, // Corresponds to cha_ciro_cari_kodu AS turnoverAccountCode
          'exchangeRate': double, // Corresponds to cha_altd_kur AS exchangeRate
          'responsibilityCenterCode': String, // Corresponds to cha_srmrkkodu AS responsibilityCenterCode
          'cashServiceCode': String, // Corresponds to cha_kasa_hizkod AS cashServiceCode
          'quantity': double, // Corresponds to cha_miktari AS quantity
          'amount': double, // Corresponds to cha_meblag AS amount
          'subtotal': double, // Corresponds to cha_aratoplam AS subtotal
          'dueDate': String, // Corresponds to cha_vade AS dueDate
          'invoiceDiscount1': double, // Corresponds to cha_ft_iskonto1 AS invoiceDiscount1
          'invoiceDiscount2': double, // Corresponds to cha_ft_iskonto2 AS invoiceDiscount2
          'invoiceDiscount3': double, // Corresponds to cha_ft_iskonto3 AS invoiceDiscount3
          'invoiceDiscount4': double, // Corresponds to cha_ft_iskonto4 AS invoiceDiscount4
          'invoiceDiscount5': double, // Corresponds to cha_ft_iskonto5 AS invoiceDiscount5
          'invoiceDiscount6': double, // Corresponds to cha_ft_iskonto6 AS invoiceDiscount6
          'invoiceExpense1': double, // Corresponds to cha_ft_masraf1 AS invoiceExpense1
          'invoiceExpense2': double, // Corresponds to cha_ft_masraf2 AS invoiceExpense2
          'invoiceExpense3': double, // Corresponds to cha_ft_masraf3 AS invoiceExpense3
          'invoiceExpense4': double, // Corresponds to cha_ft_masraf4 AS invoiceExpense4
          'tax1': double, // Corresponds to cha_vergi1 AS tax1
          'tax2': double, // Corresponds to cha_vergi2 AS tax2
          'tax3': double, // Corresponds to cha_vergi3 AS tax3
          'tax4': double, // Corresponds to cha_vergi4 AS tax4
          'tax5': double, // Corresponds to cha_vergi5 AS tax5
          'tax6': double, // Corresponds to cha_vergi6 AS tax6
          'tax7': double, // Corresponds to cha_vergi7 AS tax7
          'tax8': double, // Corresponds to cha_vergi8 AS tax8
          'tax9': double, // Corresponds to cha_vergi9 AS tax9
          'tax10': double, // Corresponds to cha_vergi10 AS tax10
          'tax11': double, // Corresponds to cha_vergi11 AS tax11
          'tax12': double, // Corresponds to cha_vergi12 AS tax12
          'tax13': double, // Corresponds to cha_vergi13 AS tax13
          'tax14': double, // Corresponds to cha_vergi14 AS tax14
          'tax15': double, // Corresponds to cha_vergi15 AS tax15
          'tax16': double, // Corresponds to cha_vergi16 AS tax16
          'tax17': double, // Corresponds to cha_vergi17 AS tax17
          'tax18': double, // Corresponds to cha_vergi18 AS tax18
          'tax19': double, // Corresponds to cha_vergi19 AS tax19
          'tax20': double, // Corresponds to cha_vergi20 AS tax20
          'createdBy': String, // Corresponds to cha_create_user AS createdBy
          'createdAt': String, // Corresponds to cha_create_date AS createdAt
          'updatedBy': String, // Corresponds to cha_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to cha_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info(
      'CustomerAccountMovementsMigration: customer_account_movements table successfully created with aliased columns.',
    );
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'customer_account_movements' table.
    await txn.execute('DROP TABLE IF EXISTS customer_account_movements');
    AppLogger.info('CustomerAccountMovementsMigration: customer_account_movements table dropped.');
  }
}
