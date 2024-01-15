import 'package:flutter/material.dart';
import 'category_item.dart';
import '../../../settings/Theme/theme_ext.dart';

class StaticCategoryItem extends CategoryItem {
  const StaticCategoryItem({
    super.key,
    required super.title,
    super.onTap,
  });

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
                  Icon(
                    Icons.list_sharp,
                    color: context.color.primaryInverse,
                  ),
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
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: context.color.onSurfaceMediumBrush,
            )
          ],
        ),
      ),
    );
  }
}
