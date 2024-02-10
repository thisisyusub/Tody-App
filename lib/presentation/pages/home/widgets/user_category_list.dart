import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/presentation/pages/home/widgets/dynamic_category_item.dart';
import 'package:http/http.dart' as http;

class UserCategoryList extends StatefulWidget {
  const UserCategoryList({super.key});

  @override
  State<UserCategoryList> createState() => _UserCategoryListState();
}

class _UserCategoryListState extends State<UserCategoryList> {
  bool _loading = false;
  List<String>? _categories;

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  void didUpdateWidget(UserCategoryList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getCategories();
  }

  Future<void> _getCategories() async {
    setState(() {
      _loading = true;
    });

    final uri = Uri.http('localhost:8080', '/categories');

    const secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: AppKeys.token);

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Basic $token',
      },
    );

    setState(() {
      _loading = false;
    });

    if (response.statusCode == 200 && mounted) {
      final parsedBody = jsonDecode(response.body) as Map<String, dynamic>;
      final categoriesJson = parsedBody['data'] as List<dynamic>;

      setState(() {
        _categories = [];
        for (var categoryJson in categoriesJson) {
          _categories!.add(categoryJson['title']);
        }
      });
    } else {
      print(response.body);
      // final error = response.body;
      // final parsedError = jsonDecode(error) as Map<String, dynamic>;

      // if (mounted) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(parsedError['message']),
      //     ),
      //   );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const CircularProgressIndicator();
    }

    if (_categories != null) {
      return Flexible(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return DynamicCategoryItem(
              title: _categories![index],
            );
          },
          itemCount: _categories!.length,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
