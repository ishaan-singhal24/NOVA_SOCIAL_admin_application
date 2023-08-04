import 'package:flutter/material.dart';
import 'package:novasocial_admin/base/app_divider.dart';
import 'package:novasocial_admin/base/app_drawer.dart';
import 'package:novasocial_admin/base/spacing_widget.dart';
import 'package:novasocial_admin/data/constants/app_text_styles.dart';
import 'package:novasocial_admin/notifiers/profile/profile_notifier.dart';
import 'package:novasocial_admin/routes/routes.dart';
import 'package:novasocial_admin/utils/extensions/size_extension.dart';
import 'package:novasocial_admin/utils/screen_config.dart';
import 'package:novasocial_admin/utils/theme_handler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfileNotifier>(context, listen: false).countTotalProfiles();
    Provider.of<ProfileNotifier>(context, listen: false).countOnboardedUsers();
    Provider.of<ProfileNotifier>(context, listen: false).countUsersInWaitlist();
  }

  @override
  Widget build(BuildContext context) {
    final profileNotifer = Provider.of<ProfileNotifier>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sizedBoxWithHeight(32),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        size: 16.r,
                        color: ThemeHandler.widgetColor(),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Nova Social Admin Panel',
                          style: AppTextStyles.text24w500,
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxWithHeight(32),
                Text(
                  'Statistics',
                  style: AppTextStyles.text22w600,
                ),
                sizedBoxWithHeight(32),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(BaseRoute.allProfilesScreen);
                  },
                  child: Text(
                    'Total profiles: ${profileNotifer.totalProfilesCounter ?? 0}',
                    style: AppTextStyles.text18w600,
                  ),
                ),
                sizedBoxWithHeight(16),
                const AppDivider(),
                sizedBoxWithHeight(16),
                Text(
                  'Completed onboarding: ${profileNotifer.onboardedCounter ?? 0}',
                  style: AppTextStyles.text18w400,
                ),
                sizedBoxWithHeight(16),
                const AppDivider(),
                sizedBoxWithHeight(16),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(BaseRoute.waitlistProfilesScreen);
                  },
                  child: Text(
                    'In waitlist: ${profileNotifer.waitlistCounter ?? 0}',
                    style: AppTextStyles.text18w400,
                  ),
                ),
                sizedBoxWithHeight(16),
                const AppDivider(),
                sizedBoxWithHeight(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
