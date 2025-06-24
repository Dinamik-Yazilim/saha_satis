import 'package:core/core.dart';

class AppSettingModel extends BaseModel {
  String? themeMode;
  bool? notificationsEnabled;
  String? preferredLanguage;
  String? lastSyncDate; // (ISO8601 string)
  String? userId;
  bool? onboardingCompleted;
  bool? isGuestUser;
  // Identification token Information
  String? authToken;
  String? refreshToken;
  String? authTokenType;
  int? expiresIn;
  String? appLayout;

  AppSettingModel({
    super.id,
    this.themeMode = 'system',
    this.notificationsEnabled = true,
    this.preferredLanguage = 'en',
    this.lastSyncDate,
    this.userId,
    this.onboardingCompleted = false,
    this.authToken,
    this.refreshToken,
    this.authTokenType,
    this.expiresIn,
    this.isGuestUser = false,
    this.appLayout = 'grid',
  });

  /// Map'ten AppSettingModel oluşturur.
  factory AppSettingModel.fromMap(Map<String, dynamic> map) {
    return AppSettingModel(
      id: map['id'] as int?,
      themeMode: map['themeMode'] as String?,
      notificationsEnabled: (map['notificationsEnabled'] as int?) == 1,
      preferredLanguage: map['preferredLanguage'] as String?,
      lastSyncDate: map['lastSyncDate'] as String?,
      userId: map['userId'] as String?,
      onboardingCompleted: (map['onboardingCompleted'] as int?) == 1,
      authToken: map['authToken'] as String?,
      refreshToken: map['refreshToken'] as String?,
      authTokenType: map['authTokenType'] as String?,
      expiresIn: map['expiresIn'] as int?,
      isGuestUser: (map['isGuestUser'] as int?) == 1,
      appLayout: map['appLayout'] as String? ?? 'grid',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'themeMode': themeMode,
      'notificationsEnabled': notificationsEnabled! ? 1 : 0,
      'preferredLanguage': preferredLanguage,
      'lastSyncDate': lastSyncDate,
      'userId': userId,
      'onboardingCompleted': onboardingCompleted! ? 1 : 0,
      'authToken': authToken,
      'refreshToken': refreshToken,
      'authTokenType': authTokenType,
      'expiresIn': expiresIn,
      'isGuestUser': isGuestUser! ? 1 : 0,
      'appLayout': appLayout ?? 'grid ',
    };
  }

  static String get staticTableName => 'app_settings';

  @override
  String get tableName => staticTableName;

  @override
  AppSettingModel fromMap(Map<String, dynamic> map) {
    return AppSettingModel.fromMap(map);
  }
}
