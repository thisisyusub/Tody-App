import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/theme.dart';
import 'package:tody_app/presentation/pages/home/widgets/category_item.dart';

class DynamicCategoryItem extends CategoryItem {
  const DynamicCategoryItem({
    super.key,
    required super.title,
    super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return super.buildTile(
      context,
      Icon(
        Icons.list_outlined,
        color: context.colors.primaryInverse,
      ),
    );
  }
}
