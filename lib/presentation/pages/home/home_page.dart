import 'package:flutter/material.dart';
import 'widgets/catalog.dart';
import '../../settings/Theme/theme_ext.dart';

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
   
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(children: [
              Catalog(
                prefix: CircleAvatar(
                  backgroundColor: context.color.primary,
                  child: Text('PH',
                      style: TextStyle(
                        color: context.color.surface,
                      )),
                ),
                title: Text(
                  'Parviz Hashimi',
                  style: TextStyle(
                      color: context.color.onSurface,
                      fontSize: context.typo.titleMedium.fontSize),
                ),
                suffix: IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Container(),
                    ),
                  ),
                  icon: Icon(Icons.search, color: context.color.primary),
                ),
                onPrefix: () {
                  print("onPrefix");
                },
              ),

              ///Importants
              DynamicCategoryItem(
                prefix: Icon(
                  Icons.star_rate,
                  color: context.color.error,
                ),
                title: 'Importants',
                onTap: () {},
              ),
              DynamicCategoryItem(
                prefix: Icon(
                  Icons.house_siding_outlined,
                  color: context.color.primary,
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
                const StaticCategoryItem(
                  title: 'Task List',
                )
              ]),
            ),
            Catalog(
              prefix: Icon(Icons.add, color: context.color.primary),
              title: Text(
                'New List',
                style: TextStyle(color: context.color.primary),
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
