import 'package:flutter/material.dart';
import 'package:novasocial_admin/utils/app_environment.dart';
import 'package:novasocial_admin/data/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
part 'dark_theme.dart';

ThemeData get themeData =>
    AppEnvironment.isDark ? _DarkTheme.darkThemeData : _DarkTheme.darkThemeData;
