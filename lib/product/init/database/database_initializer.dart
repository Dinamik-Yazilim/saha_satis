import 'package:core/core.dart';

import '../../cache/database/app_setting_migration.dart';

class DatabaseInitializer {
  Future<void> initializeDatabase() async {
    AppLogger.info('The database starting process begins ...');

    /// Define [MigrationManager] here with the entire migration list
    final MigrationManager migrationManager = MigrationManager(
      migrations: [
        // Add all future migrations here!
        AppSettingMigration(),
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
