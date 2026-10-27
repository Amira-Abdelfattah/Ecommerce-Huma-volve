import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/screens/login_screen.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/screens/sign_up_screen.dart';
import 'package:ecommerce_app_huma_volve/features/details/presentation/view/product_details_screen.dart';
import 'package:ecommerce_app_huma_volve/features/home/presentation/view/home_screen.dart';
import 'package:ecommerce_app_huma_volve/features/splash/screens/splash_screen.dart';

final GoRouter appRoutes = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: '/products/:id',
      builder: (BuildContext context, GoRouterState state) {
        final productId = state.pathParameters['id']!;
        return ProductDetailsScreen.route(productId: int.parse(productId));
      },
    ),
  ],
);
