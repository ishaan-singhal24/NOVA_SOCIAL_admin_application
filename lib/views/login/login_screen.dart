import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:novasocial_admin/base/spacing_widget.dart';
import 'package:novasocial_admin/routes/routes.dart';
import 'package:novasocial_admin/utils/app_environment.dart';
import 'package:novasocial_admin/data/constants/app_text_styles.dart';
import 'package:novasocial_admin/utils/screen_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ScreenLock(
            title: const LockScreenTitle(),
            correctString: '1234',
            onUnlocked: () {
              AppEnvironment.navigator.pushNamed(BaseRoute.homeScreen);
            },
          ),
        ),
      ),
    );
  }
}

class LockScreenTitle extends StatelessWidget {
  const LockScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enter Passcode',
          style: AppTextStyles.text22w500,
        ),
        sizedBoxWithHeight(8),
        Text(
          'To Visit The',
          style: AppTextStyles.text22w500,
        ),
        sizedBoxWithHeight(8),
        Text(
          'Nova Social Admin Panel',
          style: AppTextStyles.text22w500,
        ),
      ],
    );
  }
}
