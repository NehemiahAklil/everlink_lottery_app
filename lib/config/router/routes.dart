import 'package:everlink_lottery_app/presentation/pages/aboutus.dart';
import 'package:everlink_lottery_app/presentation/pages/auth/login.dart';
import 'package:everlink_lottery_app/presentation/pages/auth/sign_up.dart';
import 'package:everlink_lottery_app/presentation/pages/edit_profile_page.dart';
import 'package:everlink_lottery_app/presentation/pages/home.dart';
import 'package:everlink_lottery_app/presentation/pages/homepage.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/end_page.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/middle_page.dart';
import 'package:everlink_lottery_app/presentation/pages/check_out_page.dart';
import 'package:everlink_lottery_app/presentation/pages/profile.dart';
import 'package:everlink_lottery_app/presentation/pages/settings/settings.dart';
import 'package:everlink_lottery_app/presentation/pages/shared/bottom_navigation_bar_scaffold.dart';
import 'package:everlink_lottery_app/presentation/pages/ticketnum.dart';
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
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/onboarding_middle',
      builder: (context, state) => const OnboardingMiddlePage(),
    ),
    GoRoute(
      path: '/onboarding_end',
      builder: (context, state) => const OnboardingEndPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: '/upcoming',
      builder: (context, state) => const Upcoming(),
    ),
    GoRoute(
        path: '/ticketnum',
        builder: (context, state) {
          final id = state.uri.queryParameters["id"];
          final participants = state.uri.queryParameters["participants"];
          return TicketNumber(
            lotteryId: id ?? "",
            lotteryLimit: int.tryParse(participants!) ?? 0,
          );
        }),
    GoRoute(
        path: '/payment',
        builder: (context, state) {
          final lotteryId = state.uri.queryParameters["lotteryId"];
          final selectedNumber = state.uri.queryParameters["selectedNumber"];
          return CheckOutPage(
            lotteryId: lotteryId,
            selectedNumber: int.tryParse(selectedNumber!),
          );
        }),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const Settings(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => Profile(),
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
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/ticket',
          builder: (context, state) => const TicketPage(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/info',
          builder: (context, state) => const Aboutus(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/settings',
          builder: (context, state) => const Settings(),
        ),
      ],
    ),
  ],
);
