import 'package:flutter/material.dart';
import 'package:novasocial_admin/views/all_profiles/all_profiles_view.dart';
import 'package:novasocial_admin/views/filter_profile/filter_profile_view.dart';
import 'package:novasocial_admin/views/home/home_screen.dart';
import 'package:novasocial_admin/views/login/login_screen.dart';
import 'package:novasocial_admin/views/splash/splash_screen.dart';
import 'package:novasocial_admin/views/user_details/user_details_view.dart';
import 'package:novasocial_admin/views/waitlist_profiles/waitlist_profiles_view.dart';
part 'base_route.dart';

class Routes {
  static String splash = 'splash';
  static String currentRoute = BaseRoute.baseLeading;

  static final routes = <String>{
    currentRoute,
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    currentRoute = settings.name ?? '/';
    Widget child;
    if (currentRoute.startsWith(BaseRoute.baseLeading)) {
      child = BaseRoute.getPage(currentRoute, args);
    } else if (currentRoute.startsWith(splash)) {
      child = const SplashScreen();
    } else {
      child = const PageNotFoundScreen();
    }
    return MaterialPageRoute(
      builder: (_) => child,
      settings: settings,
    );
  }
}

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
