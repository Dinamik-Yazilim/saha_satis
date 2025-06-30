import '../../../feature/synchronization/view_model/synchronization_view_model.dart';
import 'product_state_container.dart';

import '../../service/manager/product_service_manager.dart';
import '../view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();
  static ProductNetworkManager get productNetworkManager => ProductContainer.read<ProductNetworkManager>();
  static ProductViewModel get productViewModel => ProductContainer.read<ProductViewModel>();
  static SynchronizationViewModel get synchronizationViewModel => ProductContainer.read<SynchronizationViewModel>();
}
