import 'package:flutter/material.dart';

import '../../utility/project_border.dart';
import 'mixin/custom_button_size.dart';

class CustomLoadingButton extends StatefulWidget {
  const CustomLoadingButton({
    super.key,
    required this.title,
    required this.hasBorder,
    required this.onPressed,
    this.color,
    this.size = CustomButtonSize.medium,
    this.child,
  });

  final String title;
  final bool hasBorder;
  final Future<void> Function() onPressed;
  final Color? color;
  final CustomButtonSize size;
  final Widget? child;

  @override
  State<CustomLoadingButton> createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> {
  bool _isLoading = false;

  Future<void> _handleTap() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await widget.onPressed();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = widget.hasBorder ? Colors.transparent : widget.color ?? Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: _handleTap,
      child: Container(
        height: widget.size.height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: ProjectBorderRadius.large(),
          border: widget.hasBorder ? Border.all(color: Theme.of(context).primaryColor, width: 2) : null,
        ),
        child: Center(
          child:
              _isLoading
                  ? const SizedBox(width: 30, height: 30, child: CircularProgressIndicator())
                  : widget.child ?? Text(widget.title, style: widget.size.getTextStyle(context, widget.hasBorder)),
        ),
      ),
    );
  }
}
