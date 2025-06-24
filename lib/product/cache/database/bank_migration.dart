import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class BanksMigration extends Migration {
  @override
  int get version => 1; // Initial version for the Banks table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'banks' table in the local Sqflite database.
    // The column names are now aligned with the aliases used in your SQL SELECT query.
    await txn.execute(
      DatabaseHelper.createTableSql(
        autoIncrement: false,
        'banks', // The name of the table to be created
        {
          // Column definitions using the preferred aliased names for consistency
          'id': String,
          'code': String,
          'name': String,
          'createdBy': int,
          'createdAt': String,
          'updatedBy': int,
          'updatedAt': String,
        },
        'id', // 'id' column is now the PRIMARY KEY
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('BanksMigration: banks table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'banks' table.
    await txn.execute('DROP TABLE IF EXISTS banks');
    AppLogger.info('BanksMigration: banks table dropped.');
  }
}
