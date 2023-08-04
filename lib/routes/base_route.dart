part of 'routes.dart';

class BaseRoute {
  static const baseLeading = '/';
  static const baseScreen = baseLeading;
  static const homeScreen = '$baseLeading/home';
  static const allProfilesScreen = '$baseLeading/all-profiles';
  static const waitlistProfilesScreen = '$baseLeading/waitlisted-profiles';

  static const filterProfileScreen = '$baseLeading/filter-profile';
  static const userDetailsScreen = '$baseLeading/user-details';

  static final baseRoutes = <String>{baseScreen};

  static Widget getPage(String currentRoute, Object? args) {
    Widget child;
    switch (currentRoute) {
      case BaseRoute.baseScreen:
        child = const LoginScreen();
        break;
      case BaseRoute.homeScreen:
        child = const HomeScreen();
        break;
      case BaseRoute.allProfilesScreen:
        child = const AllProfilesView();
        break;
      case BaseRoute.waitlistProfilesScreen:
        child = const WaitlistProfilesView();
        break;
      case BaseRoute.filterProfileScreen:
        child = const FilterProfileView();
        break;
      case BaseRoute.userDetailsScreen:
        child = const UserDetailsView();
        break;
      default:
        child = const PageNotFoundScreen();
    }
    return child;
  }
}
