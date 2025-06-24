import 'package:core/core.dart'; // Core library for AppLogger and GenericRepository
import 'package:flutter/material.dart';

import '../../cache/models/app_setting_model.dart'; // Ensure correct path to AppSettingModel
import '../base/base_cubit.dart';
import '../layout_menu/model/app_layout_enum.dart';
import 'product_state.dart';

/// ViewModel responsible for managing product-specific state, including theme and authentication.
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
        // Determine the theme mode from loaded settings
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

        // Load token (default to empty string if null)
        final loadedAuthToken = settings.authToken ?? '';

        // Load app layout (default to 'grid' if null or unrecognized)
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
      // Attempt to retrieve the existing settings by ID (assuming ID 1 for app settings)
      AppSettingModel? settings = await _appSettingRepository.getById(1);
      if (settings == null) {
        // If no settings record exists, create a new one with ID 1
        AppLogger.warning('ID 1 was not found in the App Settings Table, creating a new default setting.');
        settings = AppSettingModel(id: 1);
      }

      // Apply the specific update logic using the provided function
      updateFunction(settings);

      // Save the updated settings back to the database
      await _appSettingRepository.save(settings);

      // Log the successful save operation
      String savedValue = '';
      if (logMessagePrefix == 'Theme mode') {
        savedValue = settings.themeMode ?? 'N/A';
      } else if (logMessagePrefix == 'Auth Token') {
        savedValue = settings.authToken?.isNotEmpty == true ? 'Saved' : 'Cleared';
      } else if (logMessagePrefix == 'App Layout') {
        savedValue = settings.appLayout ?? 'N/A';
      } else {
        savedValue = 'Value updated'; // Generic fallback for other potential updates
      }
      AppLogger.info('$logMessagePrefix saved to database: $savedValue');
    } catch (e, stackTrace) {
      // Log any errors that occur during the save operation
      AppLogger.error('Error occurred when saving $logMessagePrefix: $e', e, stackTrace);
    }
  }
}
