import 'dart:convert'; 
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  

import '../../cache/models/app_setting_model.dart';
import '../base/base_cubit.dart';
import '../layout_menu/model/app_layout_enum.dart';
import 'product_state.dart';

/// ViewModel responsible for managing product-specific state, including theme, authentication, and sync dates.
final class ProductViewModel extends BaseCubit<ProductState> {
  /// Repository for interacting with application settings in the database.
  final GenericRepository<AppSettingModel> _appSettingRepository;

  /// Constructor for ProductViewModel.
  /// It requires a [GenericRepository] for [AppSettingModel] to manage settings persistence.
  ProductViewModel(this._appSettingRepository) : super(const ProductState()) {
    _loadInitialSettings(); // Load all initial settings when the ViewModel is created
  }

  /// Changes the application's theme mode and persists it to the database.
  /// [themeMode] can be [ThemeMode.light], [ThemeMode.dark], or [ThemeMode.system].
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode)); // Update the state immediately
    _saveSettings((settings) => settings.themeMode = themeMode.name, 'Theme mode');
  }

  /// Changes the authentication token and persists it to the database.
  /// [token] is the new authentication token.
  void changeToken(String token) {
    emit(state.copyWith(authToken: token)); // Update the state immediately
    _saveSettings((settings) => settings.authToken = token, 'Auth Token');
  }

  /// Changes the application layout and persists it to the database.
  /// [appLayout] is the new application layout, represented by [AppLayouts] enum.
  void changeAppLayout(AppLayouts appLayout) {
    emit(state.copyWith(appLayout: appLayout.toShortString()));
    _saveSettings((settings) => settings.appLayout = appLayout.toShortString(), 'App Layout');
  }

  /// Loads all saved application settings (theme, token, etc.) from the database on app startup.
  Future<void> _loadInitialSettings() async {
    try {
      final settings = await _appSettingRepository.getById(1);
      if (settings != null) {
        ThemeMode loadedThemeMode;
        switch (settings.themeMode) {
          case 'light':
            loadedThemeMode = ThemeMode.light;
            break;
          case 'dark':
            loadedThemeMode = ThemeMode.dark;
            break;
          case 'system':
          default:
            loadedThemeMode = ThemeMode.system;
            break;
        }

        final loadedAuthToken = settings.authToken ?? '';
        final loadedAppLayout = settings.appLayout ?? AppLayouts.grid.toShortString();

        emit(state.copyWith(themeMode: loadedThemeMode, authToken: loadedAuthToken, appLayout: loadedAppLayout));
        AppLogger.info(
          'Saved initial settings loaded. Theme: ${loadedThemeMode.name}, Token: ${loadedAuthToken.isNotEmpty ? 'Loaded' : 'Not found'}, App Layout: $loadedAppLayout',
        );
      } else {
        AppLogger.info('App settings not found or null, default values are being used.');
      }
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred when loading initial settings: $e', e, stackTrace);
    }
  }

  /// A generic helper method to update a specific field in the [AppSettingModel]
  /// and persist the changes to the database.
  ///
  /// [updateFunction] is a callback that takes an [AppSettingModel] instance
  /// and applies the desired modifications to it.
  /// [logMessagePrefix] is a descriptive string used in log messages for clarity.
  Future<void> _saveSettings(Function(AppSettingModel settings) updateFunction, String logMessagePrefix) async {
    try {
      AppSettingModel? settings = await _appSettingRepository.getById(1);
      if (settings == null) {
        AppLogger.warning('ID 1 was not found in the App Settings Table, creating a new default setting.');
        settings = AppSettingModel(id: 1);
      }

      updateFunction(settings);
      await _appSettingRepository.save(settings);

      String savedValue = '';
      if (logMessagePrefix == 'Theme mode') {
        savedValue = settings.themeMode ?? 'N/A';
      } else if (logMessagePrefix == 'Auth Token') {
        savedValue = settings.authToken?.isNotEmpty == true ? 'Saved' : 'Cleared';
      } else if (logMessagePrefix == 'App Layout') {
        savedValue = settings.appLayout ?? 'N/A';
      } else {
        savedValue = 'Value updated';
      }
      AppLogger.info('$logMessagePrefix saved to database: $savedValue');
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred when saving $logMessagePrefix: $e', e, stackTrace);
    }
  }

  /// Retrieves the last sync date for a specific key from AppSettings.
  /// Returns '1900-01-01 00:00:00.000' if not found or on error.
  Future<String> getLastSyncDateFor(String syncKey) async {
    try {
      final settings = await _appSettingRepository.getById(1); // Assume ID 1 for settings
      if (settings != null && settings.lastSyncDate != null && settings.lastSyncDate!.isNotEmpty) {
        try {
          final syncDates = jsonDecode(settings.lastSyncDate!) as Map<String, dynamic>;
          final storedDate = syncDates[syncKey] as String?;
          if (storedDate != null && storedDate.isNotEmpty) {
            return storedDate;
          }
        } catch (e) {
          AppLogger.warning(
            'ProductViewModel: Failed to decode existing lastSyncDate JSON string for $syncKey. Error: $e',
          );
        }
      }
    } catch (e, st) {
      AppLogger.error('ProductViewModel: Error reading last sync date for $syncKey: $e', e, st);
    }
    return '1900-01-01 00:00:00.000'; // Fallback to full sync date
  }

  /// Updates the last sync date for a specific key within the AppSettingModel's lastSyncDate JSON string.
  Future<void> updateLastSyncDateFor(String syncKey) async {
    try {
      final now = DateTime.now();
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
      final formattedDate = formatter.format(now);

      AppSettingModel? settings = await _appSettingRepository.getById(1);
      Map<String, dynamic> syncDates = {};

      if (settings != null && settings.lastSyncDate != null && settings.lastSyncDate!.isNotEmpty) {
        try {
          syncDates = jsonDecode(settings.lastSyncDate!) as Map<String, dynamic>;
        } catch (e) {
          AppLogger.warning(
            'ProductViewModel: Failed to decode existing lastSyncDate JSON string for update for $syncKey. Error: $e',
          );
          syncDates = {};
        }
      } else {
        settings = AppSettingModel(id: 1);
        AppLogger.info(
          'ProductViewModel: AppSettingModel with ID 1 not found or lastSyncDate is empty. Creating new entry.',
        );
      }

      syncDates[syncKey] = formattedDate;
      settings.lastSyncDate = jsonEncode(syncDates);

      await _appSettingRepository.save(settings);
      AppLogger.info('ProductViewModel: $syncKey last sync date updated to $formattedDate.');
    } catch (e, st) {
      AppLogger.error('ProductViewModel: Error updating last sync date for $syncKey: $e', e, st);
    }
  }
}
