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

class AllProfilesView extends StatefulWidget {
  const AllProfilesView({super.key});

  @override
  State<AllProfilesView> createState() => _AllProfilesViewState();
}

class _AllProfilesViewState extends State<AllProfilesView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfileNotifier>(context, listen: false).fetchAllProfiles();
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
                  'List of registered users',
                  style: AppTextStyles.text22w500,
                ),
                sizedBoxWithHeight(16),
                Text(
                  'Total profiles: ${profileNotifer.allProfiles?.length ?? 0}',
                  style: AppTextStyles.text14w300,
                ),
                sizedBoxWithHeight(16),
                const AppDivider(),
                sizedBoxWithHeight(16),
                SizedBox(
                  height: ScreenUtil.instance.screenHeight * 0.7,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return sizedBoxWithHeight(16);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          profileNotifer.currentUserProfile =
                              profileNotifer.allProfiles?[index];
                          Navigator.of(context)
                              .pushNamed(BaseRoute.userDetailsScreen);
                        },
                        child: Text(
                          profileNotifer.allProfiles?[index].name ?? '',
                          style: AppTextStyles.text16w600,
                        ),
                      );
                    },
                    itemCount: profileNotifer.allProfiles?.length ?? 0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
