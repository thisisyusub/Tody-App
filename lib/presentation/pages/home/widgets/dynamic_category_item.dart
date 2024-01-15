import 'package:flutter/material.dart';
import 'category_item.dart';
import '../../../settings/Theme/theme_ext.dart';

class DynamicCategoryItem extends CategoryItem {
  const DynamicCategoryItem({
    super.key,
    required this.prefix,
    required super.title,
    super.onTap,
  });

  final Widget prefix;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 15,
          top: 8,
          bottom: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  prefix,
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: context.color.onSurface,
                          fontSize: context.typo.bodyLarge.fontSize),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: context.color.onSurfaceMediumBrush,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
