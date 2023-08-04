import 'package:flutter/material.dart';
import 'package:novasocial_admin/base/app_divider.dart';
import 'package:novasocial_admin/base/spacing_widget.dart';
import 'package:novasocial_admin/data/constants/app_text_styles.dart';
import 'package:novasocial_admin/routes/routes.dart';
import 'package:novasocial_admin/utils/extensions/size_extension.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxWithHeight(60),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Welcome Admin',
              style: AppTextStyles.text22w700,
            ),
          ),
          sizedBoxWithHeight(32),
          const AppDivider(),
          sizedBoxWithHeight(16),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(BaseRoute.homeScreen);
            },
            child: ListTile(
              title: Text(
                'Statistics',
                style: AppTextStyles.text16w700,
              ),
            ),
          ),
          sizedBoxWithHeight(16),
          const AppDivider(),
          sizedBoxWithHeight(16),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(BaseRoute.allProfilesScreen);
            },
            child: ListTile(
              title: Text(
                'All Profiles',
                style: AppTextStyles.text16w700,
              ),
            ),
          ),
          sizedBoxWithHeight(16),
          const AppDivider(),
          sizedBoxWithHeight(16),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(BaseRoute.filterProfileScreen);
            },
            child: ListTile(
              title: Text(
                'Filter Profile',
                style: AppTextStyles.text16w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
