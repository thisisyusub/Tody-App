import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/theme.dart';
import 'package:tody_app/presentation/pages/home/widgets/dynamic_category_item.dart';
import 'package:tody_app/presentation/pages/home/widgets/static_category_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 10,
                    left: 20,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: context.colors.primary,
                    child: Text(
                      'AB',
                      style: context.typography.bodyMedium,
                    ),
                  ),
                  title: Text(
                    'Antonio Bonilla',
                    style: context.typography.titleMedium,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                    color: context.colors.primary,
                  ),
                ),
                StaticCategoryItem(
                  prefix: Icon(
                    Icons.star_rate,
                    color: context.colors.error,
                  ),
                  title: 'Important',
                  onTap: () {},
                ),
                StaticCategoryItem(
                  prefix: Icon(
                    Icons.house_siding,
                    color: context.colors.primary,
                  ),
                  title: 'Tasks',
                ),
              ],
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
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
              onTap: () {
                // showDialog(
                //     context: context,
                //     builder: (context) => AlertDialog(
                //           title: const Text('New list'),
                //           content: TextField(
                //             decoration: InputDecoration(
                //               labelText: "Enter list title",
                //               labelStyle: TextStyle(
                //                   color: Theme.of(context).select(
                //                 light: AppColors.onSurface.withOpacity(0.38),
                //                 dark: AppColors.onSurface.withOpacity(0.38),
                //               )),
                //               enabledBorder: UnderlineInputBorder(
                //                 borderSide: BorderSide(
                //                   color: Theme.of(context).select(
                //                     light:
                //                         AppColors.onSurface.withOpacity(0.38),
                //                     dark: AppColors.onSurface.withOpacity(0.38),
                //                   ),
                //                   width: 2.0,
                //                 ),
                //               ),
                //               focusedBorder: UnderlineInputBorder(
                //                 borderSide: BorderSide(
                //                   color: Theme.of(context).select(
                //                     light:
                //                         AppColors.onSurface.withOpacity(0.38),
                //                     dark: AppColors.onSurface.withOpacity(0.38),
                //                   ),
                //                   width: 2.0,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           actions: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.end,
                //               children: [
                //                 TextButton(
                //                     onPressed: () {
                //                       Navigator.of(context).pop();
                //                     },
                //                     child: Text(
                //                       'Cancel',
                //                       style: TextStyle(
                //                           color: Theme.of(context).select(
                //                         light: AppColors.primary,
                //                         dark: AppColors.primary,
                //                       )),
                //                     )),
                //                 TextButton(
                //                   onPressed: null,
                //                   style: TextButton.styleFrom(
                //                     backgroundColor: Theme.of(context).select(
                //                       light: AppColors.primary,
                //                       dark: DarkAppColors.primary,
                //                     ),
                //                   ),
                //                   child: Row(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     children: [
                //                       Icon(
                //                         Icons.add,
                //                         color: Theme.of(context).select(
                //                           light: AppColors.onPrimary,
                //                           dark: DarkAppColors.onPrimary,
                //                         ),
                //                       ),
                //                       const SizedBox(width: 8),
                //                       Text(
                //                         "Create",
                //                         style: TextStyle(
                //                           color: Theme.of(context).select(
                //                             light: AppColors.onPrimary,
                //                             dark: DarkAppColors.onPrimary,
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             )
                //           ],
                //         ));
              },
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
                      color: context.colors.primary,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'New List',
                      style: context.typography.labelLarge,
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
