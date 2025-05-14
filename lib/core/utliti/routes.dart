
import 'package:clean_bookly_code/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: '/HomeView',
        builder: (BuildContext context, GoRouterState state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: '/BookDetailsView',
        builder: (BuildContext context, GoRouterState state) {
          return BookDetailsView();
        },
      ),

    ],
 );
}
