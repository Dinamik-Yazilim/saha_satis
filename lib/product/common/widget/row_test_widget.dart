import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: context.general.textTheme.bodySmall, textAlign: TextAlign.center),
        SizedBox(width: 5),
        Text(
          description,
          style: context.general.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.general.colorScheme.primary,
          ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
