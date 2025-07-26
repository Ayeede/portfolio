enum AppRoute {
  // ---------------------------------------------------------------
  // ALL PAGES

  // Project Roots
  project(':projectId', parent: AppRoute.homeScreen),

  ///  Home Root. || Stays at the end ';'
  homeScreen('/portfolio');

  // ---------------------------------------------------------------
  // APP ROUTE

  const AppRoute(this.path, {this.parent});

  final String path;
  final AppRoute? parent;

  String get fullPath {
    if (parent != null) {
      return '${parent!.fullPath}/$path';
    }
    return path;
  }

  static AppRoute fromLocation(Uri uri) {
    for (final route in AppRoute.values) {
      if (uri.path == route.fullPath) {
        return route;
      }
    }
    return AppRoute.homeScreen;
  }
}
