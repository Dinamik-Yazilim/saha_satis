import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TaxesMigration extends Migration {
  @override
  int get version => 1; // Initial version for the Taxes table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'taxes' table in the local Sqflite database.
    await txn.execute(
      DatabaseHelper.createTableSql(
        autoIncrement: false,
        'taxes', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': int,
          'vatNo': int,
          'vatRate': String,
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
      ),
    );
    AppLogger.info('TaxesMigration: taxes table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'taxes' table.
    await txn.execute('DROP TABLE IF EXISTS taxes');
    AppLogger.info('TaxesMigration: taxes table dropped.');
  }
}
