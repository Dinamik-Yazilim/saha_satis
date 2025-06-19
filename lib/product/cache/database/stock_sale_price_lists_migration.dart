import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class StockSalePriceListsMigration extends Migration {
  @override
  int get version => 1; // Initial version for the StockSalePriceLists table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'STOK_SATIS_FIYAT_LISTE_TANIMLARI' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        'STOK_SATIS_FIYAT_LISTE_TANIMLARI', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to sfl_Guid AS id (GUIDs stored as String)
          'sequenceNo': String, // Corresponds to sfl_sirano AS sequenceNo
          'description': String, // Corresponds to sfl_aciklama AS description
          'vatIncluded': bool, // Corresponds to sfl_kdvdahil AS vatIncluded (boolean)
          'startDate': String, // Corresponds to sfl_ilktarih AS startDate (Dates stored as ISO 8601 Strings)
          'endDate': String, // Corresponds to sfl_sontarih AS endDate (Dates stored as ISO 8601 Strings)
          'appliedPrice': String, // Corresponds to sfl_yerineuygulanacakfiyat AS appliedPrice
          'createdBy': String, // Corresponds to sfl_create_user AS createdBy
          'createdAt': String, // Corresponds to sfl_create_date AS createdAt
          'updatedBy': String, // Corresponds to sfl_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to sfl_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info(
      'StockSalePriceListsMigration: STOK_SATIS_FIYAT_LISTE_TANIMLARI table successfully created with aliased columns.',
    );
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'STOK_SATIS_FIYAT_LISTE_TANIMLARI' table.
    await txn.execute('DROP TABLE IF EXISTS STOK_SATIS_FIYAT_LISTE_TANIMLARI');
    AppLogger.info('StockSalePriceListsMigration: STOK_SATIS_FIYAT_LISTE_TANIMLARI table dropped.');
  }
}
