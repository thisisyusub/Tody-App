import 'package:flutter/material.dart';

enum _StateScopeAspect { color, value }

class StateScope extends InheritedModel<_StateScopeAspect> {
  const StateScope({
    super.key,
    required super.child,
    required this.value,
    required this.color,
  });

  final int value;
  final Color color;

  static StateScope? colorOf(BuildContext context) {
    return InheritedModel.inheritFrom<StateScope>(
      context,
      aspect: _StateScopeAspect.color,
    );
  }

  static StateScope? valueOf(BuildContext context) {
    return InheritedModel.inheritFrom<StateScope>(
      context,
      aspect: _StateScopeAspect.value,
    );
  }

  @override
  bool updateShouldNotify(StateScope oldWidget) {
    return value != oldWidget.value || color != oldWidget.color;
  }

  @override
  bool updateShouldNotifyDependent(
    StateScope oldWidget,
    Set<_StateScopeAspect> dependencies,
  ) {
    if (dependencies.contains(_StateScopeAspect.color) &&
        color != oldWidget.color) {
      return true;
    }

    if (dependencies.contains(_StateScopeAspect.value) &&
        value != oldWidget.value) {
      return true;
    }

    return false;
  }
}

class StateScopeWidget extends StatefulWidget {
  const StateScopeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  static StateScopeWidgetState? of(BuildContext context) {
    return context.findAncestorStateOfType<StateScopeWidgetState>();
  }

  @override
  State<StateScopeWidget> createState() => StateScopeWidgetState();
}

class StateScopeWidgetState extends State<StateScopeWidget> {
  int _currentIndex = 0;
  int _value = 0;
  final _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.brown,
  ];

  void changeColor() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _colors.length;
    });
  }

  void increaseNumber() {
    setState(() {
      _value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateScope(
      value: _value,
      color: _colors[_currentIndex],
      child: widget.child,
    );
  }
}
