import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class StockSalesPricesMigration extends Migration {
  @override
  int get version => 1; // Initial version for the StockSalesPrices table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'stock_sales_prices' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
         autoIncrement: false,
        'stock_sales_prices', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to sfiyat_Guid AS id (GUIDs stored as String)
          'stockCode': String, // Corresponds to sfiyat_stokkod AS stockCode
          'listSequenceNo': int, // Corresponds to sfiyat_listesirano AS listSequenceNo
          'warehouseSequenceNo': int, // Corresponds to sfiyat_deposirano AS warehouseSequenceNo
          'paymentPlan': int, // Corresponds to sfiyat_odemeplan AS paymentPlan
          'unitPointer': int, // Corresponds to sfiyat_birim_pntr AS unitPointer
          'price': double, // Corresponds to sfiyat_fiyati AS price (numeric value)
          'currency': int, // Corresponds to sfiyat_doviz AS currency
          'discountCode': String, // Corresponds to sfiyat_iskontokod AS discountCode
          'createdBy': int, // Corresponds to sfiyat_create_user AS createdBy
          'createdAt': String, // Corresponds to sfiyat_create_date AS createdAt
          'updatedBy': int, // Corresponds to sfiyat_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to sfiyat_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info(
      'StockSalesPricesMigration: stock_sales_prices table successfully created with aliased columns.',
    );
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'stock_sales_prices' table.
    await txn.execute('DROP TABLE IF EXISTS stock_sales_prices');
    AppLogger.info('StockSalesPricesMigration: stock_sales_prices table dropped.');
  }
}
