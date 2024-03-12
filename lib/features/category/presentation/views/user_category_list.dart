import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tody_app/core/constants/routes.dart';
import 'package:tody_app/features/category/presentation/bloc/category_list/category_list_bloc.dart';
import 'package:tody_app/presentation/pages/home/widgets/dynamic_category_item.dart';

class UserCategoryList extends StatelessWidget {
  const UserCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CategoryListBloc, CategoryListState>(
        builder: (context, state) {
          return switch (state) {
            CategoryListInProgress() =>
              const CircularProgressIndicator.adaptive(),
            CategoryListFailure(:var message) => Text(
                message ?? 'Something went wrong!',
              ),
            CategoryListSuccess(:var categories) => ListView.builder(
                itemBuilder: (context, index) {
                  return DynamicCategoryItem(
                    title: categories[index].title,
                    onTap: () {
                      context.go('/categories/${categories[index].id}');
                      // Navigator.of(context).pushNamed(
                      //   Routes.taskList.path,
                      //   arguments: {
                      //     'categoryId': categories[index].id,
                      //     'categoriesBloc': context.read<CategoryListBloc>(),
                      //   },
                      // );
                    },
                  );
                },
                itemCount: categories.length,
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
