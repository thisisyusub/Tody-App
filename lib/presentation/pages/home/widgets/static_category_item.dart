import 'package:flutter/material.dart';
import 'package:tody_app/presentation/pages/home/widgets/category_item.dart';
import 'package:tody_app/presentation/settings/Theme/theme_scope.dart';

class StaticCategoryItem extends CategoryItem {
  const StaticCategoryItem({
    super.key,
    required super.title,
    super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context)!.theme;
    final typo = ThemeScope.of(context)!.typo;
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
                    color: theme.primaryInverse,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: theme.onSurface,
                          fontSize: typo.bodyLarge.fontSize),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: theme.onSurfaceMediumBrush,
            )
          ],
        ),
      ),
    );
  }
}
