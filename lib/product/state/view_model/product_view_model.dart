import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../cache/models/app_setting_model.dart'; // AppSettingModel'in yolu doğru olmalı
import '../base/base_cubit.dart';
import 'product_state.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  final GenericRepository<AppSettingModel> _appSettingRepository;

  ProductViewModel(this._appSettingRepository) : super(const ProductState()) {
    _loadInitialTheme(); // Constructor içinde başlangıç temasını yüklüyoruz
  }

  /// Tema modunu değiştirir ve veritabanına kaydeder.
  /// [themeMode] parametresi [ThemeMode.light], [ThemeMode.dark] veya [ThemeMode.system] olabilir.
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
    _saveThemeMode(themeMode);
  }

  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    try {
      AppSettingModel? settings = await _appSettingRepository.getById(1);
      if (settings == null) {
        AppLogger.warning('ID 1 was not found in the App Settings Table, the new default setting is created.');
        settings = AppSettingModel(id: 1);
      }

      settings.themeMode = themeMode.name;
      await _appSettingRepository.save(settings);
      AppLogger.info('Theme mode was recorded in the database: ${themeMode.name}');
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred when saving the theme mode: $e', e, stackTrace);
    }
  }

  /// Uygulama başladığında kaydedilmiş tema modunu yükler.
  Future<void> _loadInitialTheme() async {
    try {
      final settings = await _appSettingRepository.getById(1);
      if (settings != null && settings.themeMode != null) {
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
        emit(state.copyWith(themeMode: loadedThemeMode));
        AppLogger.info('Saved theme mode uploaded: ${loadedThemeMode.name}');
      } else {
        AppLogger.info(
          'Theme mode settings not found or Null, the assumed theme is used: ${state.themeMode.name}',
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error('Error occurred when uploading the start theme mode: $e', e, stackTrace);
    }
  }
  
}
