import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/sidebar_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
