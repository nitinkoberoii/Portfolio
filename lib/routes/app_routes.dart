import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/screens/AboutScreen/about_screen.dart';
import 'package:portfolio/screens/ProjectsScreen/all_projects_screen.dart';
import 'package:portfolio/screens/ProjectsScreen/projects_screen.dart';
import 'package:portfolio/screens/sidebar_screen.dart';
import 'package:portfolio/screens/skills/skills_screen.dart';
import '../screens/ContactScreen/contact_screen.dart';
import '../screens/HomeScreen/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return SidebarScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) => '/home',
        ),
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AboutScreen()),
        ),
        GoRoute(
          path: '/skills',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SkillsScreen()),
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProjectsScreen()),
        ),
        GoRoute(
          path: '/more-projects',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AllProjectsScreen()),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ContactScreen()),
        ),
      ],
    )
  ],
);
