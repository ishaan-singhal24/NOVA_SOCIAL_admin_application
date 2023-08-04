import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:novasocial_admin/notifiers/profile/profile_notifier.dart';
import 'package:novasocial_admin/routes/routes.dart';
import 'package:novasocial_admin/utils/app_environment.dart';
import 'package:novasocial_admin/data/constants/app_colors.dart';
import 'package:novasocial_admin/utils/extensions/bool_extension.dart';
import 'package:novasocial_admin/utils/themes/dark/themes.dart';
import 'package:novasocial_admin/views/loading/loading_view.dart';
import 'package:provider/provider.dart';

class NovaSocialAdminApp extends StatefulWidget {
  const NovaSocialAdminApp({Key? key}) : super(key: key);

  @override
  State<NovaSocialAdminApp> createState() => _NovaSocialAdminAppState();
}

class _NovaSocialAdminAppState extends State<NovaSocialAdminApp>
    with WidgetsBindingObserver {
  final getIt = GetIt.I;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIt.allReady(timeout: const Duration(seconds: 3)),
        builder: (context, snap) {
          if (snap.hasData.not) {
            return MaterialApp(
              builder: (context, child) => const LoadingView(),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ProfileNotifier>(
                create: (_) => getIt<ProfileNotifier>(),
              ),
            ],
            child: ValueListenableBuilder(
              valueListenable: AppEnvironment.appTheme,
              builder: (_, __, ___) {
                return ValueListenableBuilder(
                  valueListenable: AppEnvironment.swipeWidth,
                  builder: (_, double swipeWidth, ___) {
                    return BackGestureWidthTheme(
                      backGestureWidth: BackGestureWidth.fraction(swipeWidth),
                      child: MaterialApp(
                        color: AppColors.isDark
                            ? AppColors.darkBackground
                            : AppColors.lightBackground,
                        builder: (context, child) {
                          final mediaQueryData = MediaQuery.of(context);
                          var ch = MediaQuery(
                            // Set the default textScaleFactor to 1.0 for
                            // the whole subtree.
                            data: mediaQueryData.copyWith(textScaleFactor: 1.0),
                            child: child!,
                          );
                          return ScrollConfiguration(
                            behavior: const ScrollBehavior(),
                            child: ch,
                          );
                        },
                        debugShowCheckedModeBanner: false,
                        onGenerateRoute: Routes.onGenerateRoute,
                        navigatorKey: AppEnvironment.rootNavigationKey,
                        navigatorObservers: [
                          AppEnvironment.routeObserver,
                        ],
                        theme: themeData,
                        initialRoute: BaseRoute.baseScreen,
                      ),
                    );
                  },
                );
              },
            ),
          );
        });
  }
}
