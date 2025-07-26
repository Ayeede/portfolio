import 'package:ayden_davis_portfolio_website/config/route_config.dart';
import 'package:ayden_davis_portfolio_website/projects/project_details_screen.dart';
import 'package:ayden_davis_portfolio_website/screens/portfolio_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// Route Configuartion
final GoRouter router = GoRouter(
  initialLocation: AppRoute.homeScreen.fullPath,
  routes: <RouteBase>[
    // Home route
    GoRoute(path: AppRoute.homeScreen.fullPath, builder: (context, state) => PortfolioScreen()),

    // project routes
    GoRoute(
      path: AppRoute.project.fullPath,
      name: AppRoute.project.name,
      builder: (context, state) {
        final String? projectId = state.pathParameters['projectId'];
        if (projectId == null) debugPrint('Error: Project ID missing!');
        return ProjectDetailPage(projectId: projectId!);
      },
    ),
  ],
);
