import 'package:flutter/material.dart';
import 'package:novasocial_admin/base/app_divider.dart';
import 'package:novasocial_admin/base/app_drawer.dart';
import 'package:novasocial_admin/base/custom_button.dart';
import 'package:novasocial_admin/base/spacing_widget.dart';
import 'package:novasocial_admin/data/constants/app_text_styles.dart';
import 'package:novasocial_admin/data/models/user/export.dart';
import 'package:novasocial_admin/notifiers/profile/profile_notifier.dart';
import 'package:novasocial_admin/utils/extensions/bool_extension.dart';
import 'package:novasocial_admin/utils/extensions/size_extension.dart';
import 'package:novasocial_admin/utils/screen_config.dart';
import 'package:novasocial_admin/utils/theme_handler.dart';
import 'package:provider/provider.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _buildRowDisplayTile({
    required String head,
    required String subHead,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            '$head : ',
            style: AppTextStyles.text14w600,
            textAlign: TextAlign.right,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        sizedBoxWithWidth(4),
        Expanded(
          child: Text(
            subHead,
            style: AppTextStyles.text14w500,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileNotifer = Provider.of<ProfileNotifier>(context);
    if (profileNotifer.currentUserProfile == null) {
      return const Placeholder();
    }
    UserModel selectedUserProfile = profileNotifer.currentUserProfile!;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedBoxWithHeight(32),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
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
                'Selected User Details',
                style: AppTextStyles.text22w500,
              ),
              sizedBoxWithHeight(16),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRowDisplayTile(
                        head: 'Name',
                        subHead: selectedUserProfile.name ?? 'NA',
                      ),
                      sizedBoxWithHeight(8),
                      _buildRowDisplayTile(
                        head: 'Email',
                        subHead: selectedUserProfile.email ?? 'NA',
                      ),
                      sizedBoxWithHeight(8),
                      _buildRowDisplayTile(
                        head: 'Username',
                        subHead: '@${selectedUserProfile.username ?? 'NA'}',
                      ),
                      sizedBoxWithHeight(8),
                      _buildRowDisplayTile(
                        head: 'Tagline',
                        subHead: selectedUserProfile.tagline ?? 'NA',
                      ),
                      sizedBoxWithHeight(8),
                      _buildRowDisplayTile(
                        head: 'Location',
                        subHead: selectedUserProfile.location?.city ?? 'NA',
                      ),
                      sizedBoxWithHeight(8),
                      _buildRowDisplayTile(
                        head: 'School',
                        subHead: selectedUserProfile.educations?.first.school ??
                            'NA',
                      ),
                      sizedBoxWithHeight(8),
                      _buildRowDisplayTile(
                        head: 'About',
                        subHead: selectedUserProfile.about ?? 'NA',
                      ),
                      sizedBoxWithHeight(8),

                      // My Code...

                      _buildRowDisplayTile(
                        head: 'Created At',
                        subHead: selectedUserProfile.createdAt
                                ?.toLocal()
                                .toString() ??
                            'NA',
                      ),
                      sizedBoxWithHeight(8),
                    ],
                  ),
                ),
              ),
              sizedBoxWithHeight(16),
              Container(
                width: ScreenUtil.instance.screenWidth * 0.8,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                decoration: BoxDecoration(
                  color: ThemeHandler.mutedPlusColor(nonInverse: false),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Waitlist Status : ',
                          style: AppTextStyles.text16w600,
                        ),
                        Text(
                          selectedUserProfile.inTheWaitlist == null
                              ? 'Not Onboarded'
                              : (selectedUserProfile.inTheWaitlist ?? false)
                                  ? 'In The Waitlist'
                                  : 'Waitlist Passed',
                          style: AppTextStyles.text16w500,
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(8),
                    if (selectedUserProfile.inTheWaitlist != null) ...{
                      SizedBox(
                        width: ScreenUtil.instance.screenWidth * 0.6,
                        child: CustomButton(
                          height: 32.h,
                          onPressed: () {
                            final waitlistStatus =
                                selectedUserProfile.inTheWaitlist;

                            selectedUserProfile = selectedUserProfile.copyWith(
                              inTheWaitlist: waitlistStatus!.not,
                            );

                            profileNotifer.saveProfile(selectedUserProfile);
                          },
                          text: (selectedUserProfile.inTheWaitlist ?? false)
                              ? 'Remove from Waitlist'
                              : 'Move to Waitlist',
                        ),
                      ),
                    },
                  ],
                ),
              ),
              sizedBoxWithHeight(16),
            ],
          ),
        ),
      ),
    );
  }
}
