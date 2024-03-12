import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tody_app/bloc/auth/auth_notifier.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/bloc/user/user_notifier.dart';
import 'package:tody_app/core/constants/routes.dart';
import 'package:tody_app/features/category/presentation/bloc/category_actions/category_actions_bloc.dart';
import 'package:tody_app/features/category/presentation/bloc/category_list/category_list_bloc.dart';
import 'package:tody_app/features/category/presentation/views/task_list_page.dart';
import 'package:tody_app/presentation/pages/home/home_page.dart';
import 'package:tody_app/presentation/pages/login/login_page.dart';
import 'package:tody_app/presentation/pages/onboarding/onboarding_page.dart';
import 'package:tody_app/presentation/pages/splash/splash_page.dart';

final _appRouterKey = GlobalKey<NavigatorState>();
final _shellRouteKey = GlobalKey<NavigatorState>();

/// / - empty screen
/// /important-tasks - list of importants (undone)
/// /tasks - total list of undone todos
/// /categories/:id - category with id 5 will be visible within its items

final class AppRouter {
  AppRouter({
    required AuthNotifier authNotifier,
  }) {
    _appRouter = GoRouter(
      navigatorKey: _appRouterKey,
      refreshListenable: authNotifier,
      redirect: (context, state) {
        final authState = authNotifier.authState;

        if (authState == AuthState.onboarding) {
          if (state.matchedLocation == Routes.onboarding.path) {
            return null;
          }

          return Routes.onboarding.path;
        } else if (authState == AuthState.unauthenticated) {
          if (state.matchedLocation == Routes.login.path) {
            return null;
          }

          return Routes.login.path;
        }

        return state.matchedLocation;
      },
      routes: [
        GoRoute(
          path: Routes.splash.path,
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: Routes.onboarding.path,
          builder: (context, state) {
            return const OnBoardingPage();
          },
        ),
        GoRoute(
          path: Routes.login.path,
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (context) => GetIt.instance<LoginNotifier>(),
              child: const LoginPage(),
            );
          },
        ),
        ShellRoute(
          navigatorKey: _shellRouteKey,
          builder: (context, shell, child) {
            return ChangeNotifierProvider(
              lazy: true,
              create: (context) => UserNotifier()..fetchUser(),
              child: HomePage(child: child),
            );
          },
          routes: [
            /// 0
            GoRoute(
              parentNavigatorKey: _shellRouteKey,
              path: Routes.home.path,
              builder: (context, state) {
                return const Center(
                  child: SizedBox.shrink(),
                );
              },
            ),
            GoRoute(
              parentNavigatorKey: _shellRouteKey,
              path: Routes.importantTasks.path,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: Scaffold(
                    backgroundColor: Colors.black,
                    body: Center(
                      child: Text('Important Tasks'),
                    ),
                  ),
                );
              },
            ),
            GoRoute(
              parentNavigatorKey: _shellRouteKey,
              path: Routes.categoriesById.path,
              pageBuilder: (context, state) {
                final id = state.pathParameters['id'];
                final parsedId = int.parse(id!);

                return NoTransitionPage(
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: context.read<CategoryListBloc>(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            GetIt.instance.get<CategoryActionsBloc>(),
                      ),
                    ],
                    child: TaskListPage(categoryId: parsedId),
                  ),
                );
              },
            ),
          ],
        ),
        // ShellRoute(
        //   builder: (context, state, child) {
        //     return ChangeNotifierProvider(
        //       lazy: true,
        //       create: (context) => UserNotifier()..fetchUser(),
        //       child: HomePage(child: child),
        //     );
        //   },
        //   routes: [
        //     GoRoute(
        //       path: Routes.home.path,
        //       builder: (context, state) {
        //         return const Center(
        //           child: Text('Important'),
        //         );
        //       },
        //     ),
        //     GoRoute(
        //       path: '${Routes.taskList.path}/:id',
        //       builder: (context, state) {
        //         return MultiBlocProvider(
        //           providers: [
        //             BlocProvider.value(
        //               value: context.read<CategoryListBloc>(),
        //             ),
        //             BlocProvider(
        //               create: (context) => GetIt.instance<CategoryActionsBloc>()
        //                 ..add(const CategoryDetailsRequested(67)),
        //             ),
        //           ],
        //           child: const TaskListPage(),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }

  GoRouter get instance => _appRouter;

  late final GoRouter _appRouter;
}
