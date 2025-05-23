import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

import '../../cache/models/app_setting_model.dart';
import '../../service/manager/product_service_manager.dart';
import '../view_model/product_view_model.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<GenericRepository<AppSettingModel>>(
        () => GenericRepository<AppSettingModel>(
          tableName: AppSettingModel.staticTableName,
          fromMapFactory: AppSettingModel.fromMap,
        ),
      )
      ..registerLazySingleton<ProductViewModel>(() => ProductViewModel(_getIt<GenericRepository<AppSettingModel>>()));
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
