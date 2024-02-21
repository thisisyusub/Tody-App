import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/features/category/presentation/bloc/category_actions/category_actions_bloc.dart';
import 'package:tody_app/features/category/presentation/bloc/category_list/category_list_bloc.dart';
import 'package:tody_app/presentation/widgets/app_action_button.dart';
import 'package:tody_app/shared/widgets/app_base_dialog.dart';

class CategoryRemoveDialog extends StatelessWidget {
  const CategoryRemoveDialog({super.key});

  static Future<T?> show<T>(
    BuildContext context,
  ) {
    return showDialog<T>(
      context: context,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: context.read<CategoryActionsBloc>(),
          ),
          BlocProvider.value(
            value: context.read<CategoryListBloc>(),
          ),
        ],
        child: const CategoryRemoveDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryActionsBloc, CategoryActionsState>(
      listenWhen: (_, current) {
        return current is CategoryDeleteActionSuccess ||
            current is CategoryDeleteFailure;
      },
      listener: (context, state) {
        if (state is CategoryDeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is CategoryDeleteActionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Category deleted successfully!'),
            ),
          );

          Navigator.of(context).pop();
          Navigator.of(context).pop();

          context.read<CategoryListBloc>().add(CategoryListRequested());
        }
      },
      child: AppBaseDialog(
        title: 'Are you sure?',
        body: Text(
          'Task will be permanently deleted',
          style: context.typography.bodyLarge.copyWith(
            color: context.colors.onSurfaceLowBrush,
          ),
        ),
        action: BlocBuilder<CategoryActionsBloc, CategoryActionsState>(
          builder: (context, state) {
            if (state is CategoryDeleteAction) {
              return const CircularProgressIndicator.adaptive();
            }

            return AppActionButton(
              widthFactor: WidthFactor.sized,
              color: context.colors.error,
              title: 'Delete',
              onPressed: () {
                context
                    .read<CategoryActionsBloc>()
                    .add(CategoryDeleteRequested());
                // if (_titleController.text.trim().isNotEmpty) {
                //   context.read<ListCreationBloc>().add(
                //         NewListCreateRequested(_titleController.text),
                //       );
                // }
                // _createNewCategory(_titleController.text);
              },
            );
          },
        ),
      ),
    );
  }
}
