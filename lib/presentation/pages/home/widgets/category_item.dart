import 'package:flutter/material.dart';

abstract class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;
}
