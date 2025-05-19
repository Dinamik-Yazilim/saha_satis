import 'package:get_it/get_it.dart';

import '../../service/manager/product_service_manager.dart';

final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;
  static void setup() {
    GetIt.I.registerSingleton(ProductNetworkManager.base());
  }

 /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
