import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class AppSettingMigration extends Migration {
  @override
  int get version => 1;

  @override
  Future<void> up(Transaction txn) async {
    await txn.execute(
      DatabaseHelper.createTableSql(
        'app_settings',
        {
          'id': int,
          'themeMode': String,
          'notificationsEnabled': bool,
          'preferredLanguage': String,
          'lastSyncDate': String,
          'userId': String,
          'onboardingCompleted': bool,
          'authToken': String,
          'refreshToken': String,
          'authTokenType': String,
          'expiresIn': int,
          'isGuestUser': bool,
          'appLayout': String,
        },
        'id',
        autoIncrement: true,
      ),
    );
    AppLogger.info('AppSettingMigration: app_settings The table was created.');

    await txn.insert('app_settings', {
      'id': 1,
      'themeMode': 'system',
      'notificationsEnabled': 1,
      'preferredLanguage': 'en',
      'lastSyncDate': null,
      'userId': null,
      'onboardingCompleted': 0,
      'authToken': null,
      'refreshToken': null,
      'authTokenType': null,
      'expiresIn': null,
      'isGuestUser': 0,
      'appLayout': 'grid',
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    AppLogger.info('AppSettingMigration: app_settingsThe default record was added to the table.');
  }

  @override
  Future<void> down(Transaction txn) async {
    await txn.execute('DROP TABLE IF EXISTS app_settings');
    AppLogger.info('MigrationV4: app_settings tablosu silindi.');
  }
}
