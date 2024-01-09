import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/core/utils/extensions/theme_ext.dart';

abstract class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  Widget buildTile(BuildContext context, Widget prefix) {
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
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).select(
                light: AppColors.onSurfaceMediumBrush,
                dark: DarkAppColors.onSurfaceMediumBrush,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
