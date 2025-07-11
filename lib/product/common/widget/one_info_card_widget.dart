import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class OneInfoCardWidget extends StatelessWidget {
  const OneInfoCardWidget({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.valueColor,
    this.trailingIcon,
  });
  final String label;
  final String value;
  final IconData? icon;
  final Widget? trailingIcon;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: context.general.colorScheme.primary.withValues(alpha: 0.02),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: context.general.colorScheme.primary.withValues(alpha: 0.8), size: 20),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: context.general.textTheme.bodyMedium),
                  Text(
                    value,
                    style: context.general.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: valueColor,
                    ),
                  ),
                ],
              ),
            ),
            trailingIcon ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
