import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveWidgetBuilder = Widget Function(
  BuildContext context,
  DeviceType type,
);

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  final ResponsiveWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1024) {
      return builder(context, DeviceType.desktop);
    } else if (width >= 768) {
      return builder(context, DeviceType.tablet);
    } else {
      return builder(context, DeviceType.mobile);
    }
  }
}
