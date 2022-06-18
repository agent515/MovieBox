import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_box/presentation/pages/error/error_page.dart';
import 'package:movie_box/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:movie_box/presentation/pages/home/home_page.dart';
import 'package:movie_box/presentation/pages/sign_in/sign_in_page.dart';
import 'package:movie_box/presentation/pages/sign_up/sign_up_page.dart';
import 'package:movie_box/presentation/pages/splash/splash_page.dart';
import 'package:movie_box/presentation/providers/authentication_provider.dart';

class Routes {
  static String homeRoute = '/';
  static String splashRoute = '/splash';
  static String forgotPasswordRoute = 'forgotPassword';
  static bool _isInitialised = false;

  static late final GoRouter _router;

  static initialise(WidgetRef ref) {
    final _authProvider = ref.read(authenticationProvider);
    if (_isInitialised) return;
    _router = GoRouter(
      initialLocation: splashRoute,
      routes: [
        GoRoute(
          path: splashRoute,
          builder: (context, _) => const SplashPage(),
        ),
        GoRoute(
          path: homeRoute,
          routes: [
            GoRoute(
              path: forgotPasswordRoute,
              builder: (context, _) => const ForgotPasswordPage(),
            ),
          ],
          builder: (context, _) {
            if (_authProvider.isLoggedIn) {
              return const HomePage();
            }
            if (_authProvider.showSignInPage) {
              return const SignInPage();
            }
            return const SignUpPage();
          },
          pageBuilder: (_, state) {
            if (_authProvider.isLoggedIn) {
              return _slideTransitionPageBuilder(const HomePage(), state);
            }
            if (_authProvider.showSignInPage) {
              return _slideTransitionPageBuilder(const SignInPage(), state);
            }
            return _slideTransitionPageBuilder(const SignUpPage(), state);
          },
        ),
      ],
      errorBuilder: (_, __) => const ErrorPage(
        message: 'Page not found',
      ),
      refreshListenable: ref.watch(authenticationProvider),
    );
    _isInitialised = true;
  }

  static RouterDelegate<Object> routerDelegate() => _router.routerDelegate;

  static RouteInformationParser<Object> routeInformationParser() =>
      _router.routeInformationParser;

  static Page<void> _slideTransitionPageBuilder(
          Widget page, GoRouterState state) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        ),
      );
}
