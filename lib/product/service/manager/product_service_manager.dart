import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../init/config/app_environment.dart';

/// Product network manager
final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base() : super(options: BaseOptions(baseUrl: AppEnvironmentItems.baseUrl.value));

  /// Handle error
  /// [onErrorStatus] is error status code [HttStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}
