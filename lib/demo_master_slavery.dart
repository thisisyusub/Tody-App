import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({
    super.key,
    required this.shell,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: NavigationRail(
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text(
                  'Page A',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.abc),
                label: Text(
                  'Page B',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            selectedIndex: shell.currentIndex,
            onDestinationSelected: (index) {
              shell.goBranch(index);
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: shell,
        ),
      ],
    );
  }
}
