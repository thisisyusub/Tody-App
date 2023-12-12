import 'package:flutter/material.dart';

import 'state_scope.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const StateScopeWidget(
      child: Scaffold(
        body: ViewOfMyPage(),
      ),
    );
  }
}

class ViewOfMyPage extends StatelessWidget {
  const ViewOfMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('ViewOfMyPage build');
    MediaQuery.sizeOf(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ListenableColorView(),
        const SizedBox(height: 10),
        const ListenableNumberView(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: StateScopeWidget.of(context)!.changeColor,
              child: const Text('Change Color'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: StateScopeWidget.of(context)!.increaseNumber,
              child: const Text('Increase number'),
            )
          ],
        ),
      ],
    );
  }
}

class ListenableNumberView extends StatelessWidget {
  const ListenableNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final stateScope = StateScope.valueOf(context)!;
    print('ListenableNumberView build');

    return Text(
      stateScope.value.toString(),
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}

class ListenableColorView extends StatelessWidget {
  const ListenableColorView({super.key});

  @override
  Widget build(BuildContext context) {
    final stateScope = StateScope.colorOf(context)!;
    print('ListenableColorView build');

    return Container(
      color: stateScope.color,
      width: 100,
      height: 100,
    );
  }
}
