import 'package:flutter/material.dart';

import 'catalog_item.dart';

class Catalog extends CatalogItem {
  const Catalog({
    super.key,
    required this.prefix,
    required super.title,
    this.onPrefix,
    this.suffix = const SizedBox(),
    super.onTap,
  });

  final Widget prefix;
  final Widget suffix;
  final VoidCallback? onPrefix;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 15,
          top: 8,
          bottom: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  InkWell(onTap: onPrefix, child: prefix),
                  const SizedBox(width: 16),
                  Expanded(
                    child: title,
                  ),
                ],
              ),
            ),
            suffix,
          ],
        ),
      ),
    );
  }
}
