import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/features/category/presentation/bloc/category_creation/list_creation_bloc.dart';
import 'package:tody_app/features/category/presentation/bloc/category_list/category_list_bloc.dart';
import 'package:tody_app/initialization.dart';
import 'package:tody_app/shared/widgets/app_base_dialog.dart';
import 'package:tody_app/presentation/widgets/app_action_button.dart';

class ListCreationDialog extends StatefulWidget {
  const ListCreationDialog({super.key});

  static Future<T?> show<T>(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<CategoryListBloc>(),
        child: BlocProvider(
          create: (context) => getIt.get<CategoryCreationBloc>(),
          child: const ListCreationDialog(),
        ),
      ),
    );
  }

  @override
  State<ListCreationDialog> createState() => _ListCreationDialogState();
}

class _ListCreationDialogState extends State<ListCreationDialog> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCreationBloc, ListCreationState>(
      listener: (context, state) {
        if (state is ListCreationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('New list created successfully!'),
            ),
          );

          context.read<CategoryListBloc>().add(CategoryListRequested());
          Navigator.of(context).pop();
        }
      },
      child: AppBaseDialog(
        title: 'New List',
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: context.colors.surfaceVariant,
                  hintText: 'Enter list title',
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
            BlocBuilder<CategoryCreationBloc, ListCreationState>(
              builder: (context, state) {
                if (state is ListCreationFailure) {
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
        action: BlocBuilder<CategoryCreationBloc, ListCreationState>(
          builder: (context, state) {
            if (state is ListCreationInProgress) {
              return const CircularProgressIndicator.adaptive();
            }

            return AppActionButton(
              widthFactor: WidthFactor.sized,
              prefix: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: 'Create',
              onPressed: () {
                if (_titleController.text.trim().isNotEmpty) {
                  context.read<CategoryCreationBloc>().add(
                        NewListCreateRequested(_titleController.text),
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
