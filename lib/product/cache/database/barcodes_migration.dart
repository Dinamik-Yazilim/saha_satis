import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class BarcodesMigration extends Migration {
  @override
  int get version => 1; // Initial version for the Barcodes table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'barcodes' table in the local Sqflite database.
    // The column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
         autoIncrement: false,
        'barcodes', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String,
          'code': String,
          'stockCode': String,
          'barcodeType': int,
          'content': int,
          'unitPointer': int,
          'sizePointer': int,
          'colorPointer': int,
          'createdBy': int,
          'createdAt': String,
          'updatedBy': int,
          'updatedAt': String,
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('BarcodesMigration: barcodes table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'barcodes' table.
    await txn.execute('DROP TABLE IF EXISTS barcodes');
    AppLogger.info('BarcodesMigration: barcodes table dropped.');
  }
}
