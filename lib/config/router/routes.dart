import 'package:everlink_lottery_app/presentation/pages/aboutus.dart';
import 'package:everlink_lottery_app/presentation/pages/auth/login.dart';
import 'package:everlink_lottery_app/presentation/pages/auth/sign_up.dart';
import 'package:everlink_lottery_app/presentation/pages/edit_profile_page.dart';
import 'package:everlink_lottery_app/presentation/pages/home.dart';
import 'package:everlink_lottery_app/presentation/pages/homeold.dart';
import 'package:everlink_lottery_app/presentation/pages/info.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/end_page.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/middle_page.dart';
import 'package:everlink_lottery_app/presentation/pages/profile.dart';
import 'package:everlink_lottery_app/presentation/pages/shared/bottom_navigation_bar_scaffold.dart';
import 'package:everlink_lottery_app/presentation/pages/shared/transition_factory.dart';
import 'package:everlink_lottery_app/presentation/pages/ticketpage.dart';
import 'package:everlink_lottery_app/presentation/pages/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/start_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: '/onboarding_middle',
      builder: (context, state) => OnboardingMiddlePage(),
    ),
    GoRoute(
      path: '/onboarding_end',
      builder: (context, state) => OnboardingEndPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUp(),
    ),
    GoRoute(
      // parentNavigatorKey: _shellNavigatorKey,
      path: '/upcoming',
      builder: (context, state) => Upcoming(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return BottomNavigationBarScaffold(child: child);
      },
      pageBuilder: (context, state, child) => CustomTransitionPage(
        key: state.pageKey,
        child: BottomNavigationBarScaffold(child: child),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/home',
          builder: (context, state) => HomePage(),
          // pageBuilder: TransitionFactory.getSlidePageBuilder(
          //     child: HomeScreen(), leftToRight: false)),
          //     leftToRight: false)
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/ticket',
          builder: (context, state) => TicketPage(),
          // pageBuilder: TransitionFactory.getSlidePageBuilder(
          //     child: TicketScreen(), leftToRight: true)
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/info',
          builder: (context, state) => Aboutus(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/profile',
          builder: (context, state) => EditProfilePage(),
        ),
      ],
    ),
  ],
);
