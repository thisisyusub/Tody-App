import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/theme_ext.dart';

class SettingsItem<T> {
  const SettingsItem({
    required this.title,
    required this.type,
    this.prefix,
  });

  final String title;
  final Widget? prefix;
  final T type;
}

typedef OnChipSelected<T> = void Function(T type);

class SettingsBar<T> extends StatefulWidget {
  const SettingsBar({
    super.key,
    required this.title,
    this.chips = const [],
    this.onChipSelected,
    this.defaultSelectedType,
  });

  final String title;
  final List<SettingsItem<T>> chips;
  final OnChipSelected<T>? onChipSelected;
  final T? defaultSelectedType;

  @override
  State<SettingsBar<T>> createState() => _SettingsBarState<T>();
}

class _SettingsBarState<T> extends State<SettingsBar<T>> {
  T? _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.defaultSelectedType;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: context.typography.bodySmall,
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: widget.chips.map(
              (chip) {
                return GestureDetector(
                  onTap: () {
                    if (_selectedType == chip.type) return;

                    setState(() {
                      _selectedType = chip.type;
                    });

                    widget.onChipSelected?.call(_selectedType as T);
                  },
                  child: _SettingsBarChip(
                    title: chip.title,
                    type: chip.type,
                    selected: _selectedType == chip.type,
                    prefix: chip.prefix,
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _SettingsBarChip<T> extends StatelessWidget {
  const _SettingsBarChip({
    super.key,
    required this.title,
    this.selected = false,
    this.prefix,
    required this.type,
  });

  final String title;
  final bool selected;
  final Widget? prefix;
  final T type;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6 + (selected ? 1 : 0),
        ),
        decoration: BoxDecoration(
          color: selected ? context.colors.secondaryContainer : null,
          borderRadius: BorderRadius.circular(8),
          border: selected
              ? null
              : Border.all(
                  width: 1.0,
                  color: context.colors.onSurfaceMediumBrush,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
        ),
        child: Row(
          children: [
            if (prefix != null) ...[
              prefix!,
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: context.typography.bodyMedium.copyWith(
                color: selected
                    ? context.colors.onPrimaryContainer
                    : context.colors.onSurfaceMediumBrush,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
