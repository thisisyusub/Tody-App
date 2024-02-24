import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/features/category/presentation/bloc/category_actions/category_actions_bloc.dart';
import 'package:tody_app/features/category/presentation/bloc/category_list/category_list_bloc.dart';
import 'package:tody_app/presentation/widgets/app_action_button.dart';
import 'package:tody_app/shared/widgets/app_base_dialog.dart';

class CategoryRenamingDialog extends StatefulWidget {
  const CategoryRenamingDialog({super.key});

  static Future<T?> show<T>(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: context.read<CategoryListBloc>(),
          ),
          BlocProvider.value(
            value: context.read<CategoryActionsBloc>(),
          ),
        ],
        child: const CategoryRenamingDialog(),
      ),
    );
  }

  @override
  State<CategoryRenamingDialog> createState() => _CategoryRenamingDialogState();
}

class _CategoryRenamingDialogState extends State<CategoryRenamingDialog> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryActionsBloc, CategoryActionsState>(
      listener: (context, state) {
        if (state is CategoryActionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Renaming completed successfully!'),
            ),
          );

          context.read<CategoryListBloc>().add(CategoryListRequested());
          Navigator.of(context).pop();
        }
      },
      child: AppBaseDialog(
        title: 'Rename List',
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: context.colors.surfaceVariant,
                  hintText: 'renaming list',
                  hintStyle: context.typography.bodyLarge.copyWith(
                    color: context.colors.onSurfaceLowBrush,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: context.colors.onSurfaceLowBrush,
                      width: 2,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: context.colors.onSurfaceLowBrush,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoryActionsBloc, CategoryActionsState>(
              builder: (context, state) {
                if (state is CategoryActionsFailure) {
                  return Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        state.message,
                        style: context.typography.bodyMedium.copyWith(
                          color: context.colors.error,
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        action: BlocBuilder<CategoryActionsBloc, CategoryActionsState>(
          builder: (context, state) {
            if (state is CategoryLaodingAction) {
              return const CircularProgressIndicator.adaptive();
            }

            return AppActionButton(
              widthFactor: WidthFactor.sized,
              prefix: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: 'Rename',
              onPressed: () {
                if (_titleController.text.trim().isNotEmpty) {
                  context.read<CategoryActionsBloc>().add(
                        CategoryUpdateRequested(_titleController.text),
                      );
                }
                // _createNewCategory(_titleController.text);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
