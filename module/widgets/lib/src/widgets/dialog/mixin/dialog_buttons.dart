import 'package:flutter/material.dart';
import 'package:widgets/src/widgets/button/custom_loading_button.dart';
import 'package:widgets/src/widgets/button/mixin/custom_button_size.dart';

Widget buildDialogButton(String title, Future<void> Function() onPressed, {bool hasBorder = false}) {
  return Expanded(
    child: CustomLoadingButton(title: title, hasBorder: hasBorder, size: CustomButtonSize.small, onPressed: onPressed),
  );
}
