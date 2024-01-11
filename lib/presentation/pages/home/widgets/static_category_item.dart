import 'package:flutter/material.dart';
import 'package:tody_app/presentation/pages/home/widgets/category_item.dart';

class StaticCategoryItem extends CategoryItem {
  const StaticCategoryItem({
    super.key,
    required this.prefix,
    required super.title,
    super.onTap,
  });

  final Widget prefix;

  @override
  Widget build(BuildContext context) {
    return super.buildTile(context, prefix);
  }
}
