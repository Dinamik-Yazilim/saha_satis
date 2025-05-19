import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:widgets/widgets.dart';

/// Manage your network error with screen
final class ProductNetworkErrorManager {
  ProductNetworkErrorManager(this.context);
  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.unauthorized) {
      customShowDialogGeneric(context, alertEnum: AlertEnum.error, subTitle: 'Bir hata olustu, lutfen tekrar deneyin');
    }
    if (value == HttpStatus.notFound) {
      customShowDialogGeneric(
        context,
        alertEnum: AlertEnum.error,
        subTitle: 'Lutfen internet baglantinizi kontrol edin',
      );
    }
  }
}
