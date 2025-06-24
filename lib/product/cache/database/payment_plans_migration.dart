import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class PaymentPlansMigration extends Migration {
  @override
  int get version => 1; // Initial version for the PaymentPlans table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'payment_plans' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
         autoIncrement: false,
        'payment_plans', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to odp_Guid AS id (GUIDs stored as String)
          'no': String, // Corresponds to odp_no AS no
          'code': String, // Corresponds to odp_kodu AS code
          'name': String, // Corresponds to odp_adi AS name
          'subtotal': double, // Corresponds to odp_aratop AS subtotal (assuming numeric type for monetary values)
          'createdBy': String, // Corresponds to odp_create_user AS createdBy
          'createdAt': String, // Corresponds to odp_create_date AS createdAt
          'updatedBy': String, // Corresponds to odp_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to odp_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('PaymentPlansMigration: payment_plans table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'payment_plans' table.
    await txn.execute('DROP TABLE IF EXISTS payment_plans');
    AppLogger.info('PaymentPlansMigration: payment_plans table dropped.');
  }
}
