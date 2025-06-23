import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plants_app/main.dart';
import 'package:plants_app/presentation/test_screen/test_screen.dart';
import 'package:plants_app/presentation/title_screen/title_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      name: 'initial',
      pageBuilder: (context, state) {
        return MaterialPage(key: state.pageKey, child: const TitleScreen());
      },
    ),
    GoRoute(
      path: '/test',
      name: 'test',
      pageBuilder: (context, state) {
        return MaterialPage(key: state.pageKey, child: const TestScreen());
      },
    ),
  ],
);
