import 'package:flutter/material.dart';
import 'package:novasocial_admin/base/spacing_widget.dart';
import 'package:novasocial_admin/data/constants/app_colors.dart';
import 'package:novasocial_admin/data/constants/app_text_styles.dart';
import 'package:novasocial_admin/utils/theme_handler.dart';

class AllProfilesNavBar extends StatefulWidget {
  final Function(int) updateIndex;
  const AllProfilesNavBar({super.key, required this.updateIndex});

  @override
  State<AllProfilesNavBar> createState() => _AllProfilesNavBarState();
}

class _AllProfilesNavBarState extends State<AllProfilesNavBar> {
  int _index = 0;

  Widget _buildTile(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _index = index;
            widget.updateIndex(_index);
          });
        },
        child: SizedBox(
          width: double.maxFinite,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: _index == index
                      ? AppColors.novaDarkIndigo
                      : ThemeHandler.backgroundColor(),
                ),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: _index == index
                      ? AppTextStyles.text16w800
                      : AppTextStyles.text16w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTile('Total', 0),
            sizedBoxWithWidth(8),
            _buildTile('Last week', 1),
            sizedBoxWithWidth(8),
            _buildTile('Last month', 2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTile('This week', 3),
            sizedBoxWithWidth(8),
            _buildTile('This month', 4),
            sizedBoxWithWidth(8),
            _buildTile('This year', 5),
          ],
        ),
      ],
    );
  }
}
