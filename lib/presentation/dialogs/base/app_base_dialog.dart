import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/theme_ext.dart';

class AppBaseDialog extends StatelessWidget {
  const AppBaseDialog({
    super.key,
    required this.title,
    this.body,
    required this.action,
  });

  final String title;
  final Widget? body;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Material(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.typography.titleLarge.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
              if (body != null) body!,
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text(
                        'Cancel',
                        style: context.typography.labelLarge.copyWith(
                          color: context.colors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    action,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
