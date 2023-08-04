import 'package:flutter/material.dart';
import 'package:novasocial_admin/utils/theme_handler.dart';

class LoadingView extends StatelessWidget {
  final Color? color;
  const LoadingView({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: color,
          ),
        ),
      ),
    );
  }
}
