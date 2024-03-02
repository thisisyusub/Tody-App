import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/theme_ext.dart';

enum WidthFactor { full, sized }

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.prefix,
    this.widthFactor = WidthFactor.full,
    this.color,
  });

  final String title;
  final VoidCallback? onPressed;
  final Widget? prefix;
  final WidthFactor widthFactor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final mainAxisSize = switch (widthFactor) {
      WidthFactor.full => MainAxisSize.max,
      WidthFactor.sized => MainAxisSize.min,
    };

    final leftPadding = prefix != null ? 16.0 : 24.0;

    return Material(
      color: color ?? context.colors.primary,
      borderRadius: BorderRadius.circular(20),
      elevation: 4.0,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: leftPadding,
            right: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: mainAxisSize,
            children: [
              if (prefix != null) ...[
                prefix!,
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: context.typography.labelLarge.copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
