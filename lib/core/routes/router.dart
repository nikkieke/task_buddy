import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:task_buddy/core/routes/routes.dart';

import '../../features/auth/presentation/screens/get_started_screen.dart';
import '../../features/auth/presentation/screens/onboarding.dart';
import '../../features/auth/presentation/screens/splashscreen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes:[
    GoRoute(
      path: '/',
      name: Routes.SPLASHSCREEN,
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: Routes.ONBOARDING,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.GETSTARTED,
      builder: (context, state) => const GetStartedScreen(),
    ),
]
);