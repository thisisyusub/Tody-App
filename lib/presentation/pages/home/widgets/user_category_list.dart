import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/bloc/category_list/category_list_bloc.dart';
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
            CategoryListFailure(:var message) => Text(message),
            CategoryListSuccess(:var categories) => ListView.builder(
                itemBuilder: (context, index) {
                  return DynamicCategoryItem(
                    title: categories[index],
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
