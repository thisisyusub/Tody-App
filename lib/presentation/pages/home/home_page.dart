import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/core/utils/extensions/theme_ext.dart';
import 'package:tody_app/presentation/pages/home/widgets/dynamic_category_item.dart';
import 'package:tody_app/presentation/pages/home/widgets/static_category_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                StaticCategoryItem(
                  prefix: Icon(
                    Icons.star_rate,
                    color: Theme.of(context).select(
                      light: AppColors.error,
                      dark: DarkAppColors.error,
                    ),
                  ),
                  title: 'Important',
                  onTap: () {},
                ),
                StaticCategoryItem(
                  prefix: Icon(
                    Icons.house_siding,
                    color: Theme.of(context).select(
                      light: AppColors.primary,
                      dark: DarkAppColors.primary,
                    ),
                  ),
                  title: 'Tasks',
                ),
              ],
            ),
            const Divider(),
            Flexible(
              child: ListView(
                children: const [
                  DynamicCategoryItem(
                    title: 'Flutter List',
                  ),
                  DynamicCategoryItem(
                    title: 'Dart List',
                  ),

                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                  // CategoryItem(),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                  top: 10,
                  bottom: 10,
                  right: 36,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Theme.of(context).select(
                        light: AppColors.primary,
                        dark: DarkAppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'New List',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
