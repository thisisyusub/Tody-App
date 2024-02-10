import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/presentation/dialogs/base/app_base_dialog.dart';
import 'package:tody_app/presentation/widgets/app_action_button.dart';
import 'package:http/http.dart' as http;

enum CreationState { success, failure }

class ListCreationDialog extends StatefulWidget {
  const ListCreationDialog({super.key});

  static Future<T?> show<T>(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (context) => const ListCreationDialog(),
    );
  }

  @override
  State<ListCreationDialog> createState() => _ListCreationDialogState();
}

class _ListCreationDialogState extends State<ListCreationDialog> {
  bool _loading = false;
  final _titleController = TextEditingController();

  Future<void> _createNewCategory(String title) async {
    setState(() {
      _loading = true;
    });

    final uri = Uri.http('localhost:8080', '/categories');

    const secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: AppKeys.token);

    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Basic $token',
      },
      body: jsonEncode({
        'title': title,
      }),
    );

    setState(() {
      _loading = false;
    });

    if (response.statusCode == 200 && mounted) {
      Navigator.of(context).pop(CreationState.success);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successful!'),
        ),
      );
    } else {
      final error = response.body;
      final parsedError = jsonDecode(error) as Map<String, dynamic>;

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(parsedError['message']),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseDialog(
      title: 'New List',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: context.colors.surfaceVariant,
                hintText: 'Enter list title',
                hintStyle: context.typography.bodyLarge.copyWith(
                  color: context.colors.onSurfaceLowBrush,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: context.colors.onSurfaceLowBrush,
                    width: 2,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: context.colors.onSurfaceLowBrush,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      action: _loading
          ? const CircularProgressIndicator()
          : AppActionButton(
              widthFactor: WidthFactor.sized,
              prefix: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: 'Create',
              onPressed: () {
                _createNewCategory(_titleController.text);
              },
            ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
