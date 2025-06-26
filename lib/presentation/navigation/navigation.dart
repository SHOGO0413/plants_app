import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plants_app/main.dart';
import 'package:plants_app/presentation/calendar/calendar_screen.dart';
import 'package:plants_app/presentation/plants_list_screen/plants_list_screen.dart';
import 'package:plants_app/presentation/test_screen/test_screen.dart';
import 'package:plants_app/presentation/title_screen/title_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      name: 'initial',
      pageBuilder: (context, state) {
        return MaterialPage(key: state.pageKey, child: const PlantsListScreen(title: "タイトル"));
      },
    ),
    GoRoute(
      path: '/calendar',
      name: 'calendar',
      pageBuilder: (context, state) {
        return MaterialPage(key: state.pageKey, child: const CalendarScreen());
      },
    ),
  ],
);
