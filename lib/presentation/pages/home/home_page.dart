import 'package:flutter/material.dart';
import 'package:tody_app/presentation/pages/home/widgets/catalog.dart';

import '../../settings/Theme/theme_scope.dart';
import 'widgets/dynamic_category_item.dart';
import 'widgets/static_category_item.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageMain> {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context)!.theme;
    final typo = ThemeScope.of(context)!.typo;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(children: [
              Catalog(
                prefix: CircleAvatar(
                  backgroundColor: theme.primary,
                  child: Text('PH',
                      style: TextStyle(
                        color: theme.surface,
                      )),
                ),
                title: Text(
                  'Parviz Hashimi',
                  style: TextStyle(
                      color: theme.onSurface,
                      fontSize: typo.titleMedium.fontSize),
                ),
                suffix: IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Container(),
                    ),
                  ),
                  icon: Icon(Icons.search, color: theme.primary),
                ),
                onPrefix: () {
                  print("onPrefix");
                },
              ),

              ///Importants
              DynamicCategoryItem(
                prefix: Icon(
                  Icons.star_rate,
                  color: theme.error,
                ),
                title: 'Importants',
                onTap: () {},
              ),
              DynamicCategoryItem(
                prefix: Icon(
                  Icons.house_siding_outlined,
                  color: theme.primary,
                ),
                title: 'Tasks',
                onTap: () {},
              ),
            ]),
            const Divider(),
            Flexible(
              child: ListView(children: [
                StaticCategoryItem(
                  title: 'Task List',
                  onTap: () {},
                ),
                StaticCategoryItem(
                  title: 'House List',
                  onTap: () {},
                ),
                StaticCategoryItem(
                  title: 'Important List',
                  onTap: () {},
                ),
                StaticCategoryItem(
                  title: 'Task List',
                )
              ]),
            ),
            Catalog(
              prefix: Icon(Icons.add, color: theme.primary),
              title: Text(
                'New List',
                style: TextStyle(color: theme.primary),
              ),
              onTap: () {
                print("onTap");
              },
            ),
          ],
        ),
      ),
    );
  }
}
