import 'package:core/core.dart';
import 'package:dinamik10_pos/product/cache/database/bank_migration.dart';
import 'package:dinamik10_pos/product/cache/database/barcodes_migration.dart';
import 'package:dinamik10_pos/product/cache/database/cashboxes_migration.dart';
import 'package:dinamik10_pos/product/cache/database/customer_account_movements_migration.dart';
import 'package:dinamik10_pos/product/cache/database/customer_accounts_migration.dart';
import 'package:dinamik10_pos/product/cache/database/customer_addresses_migration.dart';
import 'package:dinamik10_pos/product/cache/database/orders_migration.dart';
import 'package:dinamik10_pos/product/cache/database/payment_orders_migration.dart';
import 'package:dinamik10_pos/product/cache/database/payment_plans_migration.dart';
import 'package:dinamik10_pos/product/cache/database/personnel_definitions_migration.dart';
import 'package:dinamik10_pos/product/cache/database/projects_migration.dart';
import 'package:dinamik10_pos/product/cache/database/responsibility_centers_migration.dart';
import 'package:dinamik10_pos/product/cache/database/stock_movements_migration.dart';
import 'package:dinamik10_pos/product/cache/database/stock_sale_price_lists_migration.dart';
import 'package:dinamik10_pos/product/cache/database/stock_sales_prices_migration.dart';
import 'package:dinamik10_pos/product/cache/database/stocks_migration.dart';
import 'package:dinamik10_pos/product/cache/database/warehouses_migration.dart';

import '../../cache/database/app_setting_migration.dart';

class DatabaseInitializer {
  Future<void> initializeDatabase() async {
    AppLogger.info('The database starting process begins ...');

    /// Define [MigrationManager] here with the entire migration list
    final MigrationManager migrationManager = MigrationManager(
      migrations: [
        // Add all future migrations here!
        AppSettingMigration(),
        BanksMigration(),
        BarcodesMigration(),
        CashboxesMigration(),
        CustomerAccountMovementsMigration(),
        CustomerAccountsMigration(),
        CustomerAddressesMigration(),
        OrdersMigration(),
        PaymentOrdersMigration(),
        PaymentPlansMigration(),
        PersonnelDefinitionsMigration(),
        ProjectsMigration(),
        ResponsibilityCentersMigration(),
        StockMovementsMigration(),
        StockSalePriceListsMigration(),
        StockSalesPricesMigration(),
        StocksMigration(),
        WarehousesMigration(),
      ],
    );

    final DatabaseProvider databaseProvider = DatabaseProvider(migrationManager: migrationManager);

    try {
      await databaseProvider.database;
      AppLogger.info('The database was successfully started and migrations were applied.');
    } catch (e, stackTrace) {
      AppLogger.fatal('Database error when starting the application: $e', e, stackTrace);
      // exit(1);
    }
  }
}
