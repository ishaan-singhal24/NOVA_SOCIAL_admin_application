import 'package:flutter/material.dart';
import 'package:novasocial_admin/utils/theme_handler.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ThemeHandler.mutedPlusColor(),
      height: 0.5,
    );
  }
}
