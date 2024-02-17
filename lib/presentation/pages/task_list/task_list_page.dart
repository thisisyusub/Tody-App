import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/features/category/domain/entity/category_entity.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({
    super.key,
    required this.category,
  });

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primaryVariantLight,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: context.colors.primaryVariantLight,
        title: Text(
          category.title,
          style: context.typography.titleLarge.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.drive_file_rename_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
