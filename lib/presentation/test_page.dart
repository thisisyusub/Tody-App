import 'package:flutter/material.dart';
import 'package:tody_app/main.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.devicePixelRatioOf(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana sehife'),
      ),
      body: Column(
        children: [
          const Text(
            'Hello World',
            style: TextStyle(
              fontSize: 10,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const MyPage(),
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
