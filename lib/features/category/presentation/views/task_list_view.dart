import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/features/category/presentation/bloc/category_actions/category_actions_bloc.dart';
import 'package:tody_app/features/category/presentation/views/category_remove_dialog.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryActionsBloc, CategoryActionsState>(
      buildWhen: (_, current) {
        return current is CategoryLaodingAction ||
            current is CategoryActionSuccess ||
            current is CategoryActionsFailure;
      },
      builder: (context, state) {
        final title = switch (state) {
          CategoryLaodingAction() => '...',
          CategoryActionSuccess(categoryEntity: var category) => category.title,
          _ => 'Failure!',
        };

        return Scaffold(
          backgroundColor: context.colors.primaryVariantLight,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: context.colors.primaryVariantLight,
            title: Text(
              title,
              style: context.typography.titleLarge.copyWith(
                color: context.colors.onPrimary,
              ),
            ),
            actions: [
              if (state is CategoryActionSuccess)
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.drive_file_rename_outline),
                ),
              if (state is CategoryActionSuccess)
                IconButton(
                  onPressed: () {
                    CategoryRemoveDialog.show(context);
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
            ],
          ),
        );
      },
    );
  }
}
