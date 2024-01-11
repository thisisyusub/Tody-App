import 'package:flutter/material.dart';

abstract class CatalogItem extends StatelessWidget {
  const CatalogItem({
    super.key,
    required this.title,
    this.onTap,
  });

  final Text title;
  final VoidCallback? onTap;
}
