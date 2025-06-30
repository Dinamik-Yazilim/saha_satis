import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/synchronization/view_model/synchronization_view_model.dart';
import '../state/container/product_state_items.dart';
import '../state/view_model/product_view_model.dart';

final class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>(create: (context) => ProductStateItems.productViewModel),
        BlocProvider<SynchronizationViewModel>(create: (context) => ProductStateItems.synchronizationViewModel),
      ],
      child: child,
    );
  }
}
