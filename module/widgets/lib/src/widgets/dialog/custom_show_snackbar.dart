import 'package:flutter/material.dart';

void customShowSnackBar(BuildContext context, {required String message, dismissDirection}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  DismissDirection? dismissDirection;

  final SnackBar snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.surface),
        ),
        Icon(Icons.info, color: colorScheme.onPrimary),
      ],
    ),
    backgroundColor: colorScheme.primary,
    dismissDirection: dismissDirection,
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
