import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tody_app/core/constants/responsive_builder.dart';
import 'package:tody_app/presentation/pages/home/widgets/home_view.dart';
import 'package:tody_app/features/category/presentation/bloc/category_list/category_list_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<CategoryListBloc>()
        ..add(
          CategoryListRequested(),
        ),
      child: ResponsiveBuilder(
        builder: (context, deviceType) {
          if (deviceType == DeviceType.desktop) {
            return Row(
              children: [
                const Expanded(child: HomeView()),
                Expanded(
                  flex: 4,
                  child: widget.child,
                ),
              ],
            );
          } else {
            return const HomeView();
          }
        },
      ),
    );
  }
}
