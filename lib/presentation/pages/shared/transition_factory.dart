import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransitionFactory {
  static CustomTransitionPage getSlideTransitionPage(
      {required BuildContext context,
      required GoRouterState state,
      required Widget child,
      required bool leftToRight}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: Offset(0.75, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOutCubic)),
              ),
              // textDirection:
              //    leftToRight ? TextDirection.ltr : TextDirection.rtl,
              child: child),
    );
  }

  static Page<dynamic> Function(BuildContext context, GoRouterState state)
      getSlidePageBuilder({required Widget child, required bool leftToRight}) {
    return (context, state) => TransitionFactory.getSlideTransitionPage(
        context: context, state: state, child: child, leftToRight: leftToRight);
  }
}
