import 'package:flutter/material.dart';
import 'package:novasocial_admin/base/app_divider.dart';
import 'package:novasocial_admin/base/app_drawer.dart';
import 'package:novasocial_admin/base/app_material_input_field.dart';
import 'package:novasocial_admin/base/spacing_widget.dart';
import 'package:novasocial_admin/data/constants/app_text_styles.dart';
import 'package:novasocial_admin/data/enums/enums.dart';
import 'package:novasocial_admin/notifiers/profile/profile_notifier.dart';
import 'package:novasocial_admin/routes/routes.dart';
import 'package:novasocial_admin/utils/extensions/size_extension.dart';
import 'package:novasocial_admin/utils/screen_config.dart';
import 'package:novasocial_admin/utils/theme_handler.dart';
import 'package:provider/provider.dart';

import '../../base/custom_button.dart';

class FilterProfileView extends StatefulWidget {
  const FilterProfileView({super.key});

  @override
  State<FilterProfileView> createState() => _FilterProfileViewState();
}

class _FilterProfileViewState extends State<FilterProfileView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final _nameTextEditingController = TextEditingController();
  final _usernamTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  final _startdateTextEditingController = TextEditingController();
  final _enddateTextEditingController = TextEditingController();

  DateTime? selectedDate;
  DateTime? selectedDate2;

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
                  'Filter Profile',
                  style: AppTextStyles.text22w500,
                ),
                sizedBoxWithHeight(16),
                Row(
                  children: [
                    Expanded(
                      child: AppMaterialInputField(
                        maxLines: 1,
                        label: 'Name',
                        hint: 'Anuj Tayal',
                        controller: _nameTextEditingController,
                        isRequired: false,
                        textInputAction: TextInputAction.go,
                        onSubmit: (value) {
                          if (value?.isNotEmpty ?? false) {
                            _usernamTextEditingController.text = '';
                            _emailTextEditingController.text = '';
                            _startdateTextEditingController.text = '';
                            _enddateTextEditingController.text = '';
                            profileNotifer.clearFilterUsers();
                            profileNotifer.fetchUserByFilter(
                                'name', value ?? '');
                          }
                        },
                      ),
                    ),
                    sizedBoxWithWidth(8),
                    Expanded(
                      child: AppMaterialInputField(
                        maxLines: 1,
                        label: 'Username',
                        hint: 'anuj.t21',
                        controller: _usernamTextEditingController,
                        isRequired: false,
                        textInputAction: TextInputAction.go,
                        onSubmit: (value) {
                          if (value?.isNotEmpty ?? false) {
                            _nameTextEditingController.text = '';
                            _emailTextEditingController.text = '';
                            _startdateTextEditingController.text = '';
                            _enddateTextEditingController.text = '';
                            profileNotifer.clearFilterUsers();
                            profileNotifer.fetchUserByFilter(
                                'username', value ?? '');
                          }
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxWithHeight(16),

                // My Code...

                AppMaterialInputField(
                  maxLines: 1,
                  label: 'Start Date',
                  hint: '01-01-2023',
                  controller: _startdateTextEditingController,
                  isRequired: false,
                  textInputAction: TextInputAction.go,
                  onSubmit: (value) async {
                    selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      _nameTextEditingController.text = '';
                      _usernamTextEditingController.text = '';
                      _emailTextEditingController.text = '';
                      profileNotifer.clearFilterUsers();

                      _startdateTextEditingController.text =
                          selectedDate.toString();

                      // profileNotifer.fetchUserByFilterDate(
                      //     'createdAt', selectedDate!, selectedDate2!);
                    }
                  },
                ),
                sizedBoxWithHeight(16),

                AppMaterialInputField(
                  maxLines: 1,
                  label: 'End Date',
                  hint: '01-01-2023',
                  controller: _enddateTextEditingController,
                  isRequired: false,
                  textInputAction: TextInputAction.go,
                  onSubmit: (value) async {
                    selectedDate2 = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate2 != null) {
                      _nameTextEditingController.text = '';
                      _usernamTextEditingController.text = '';
                      _emailTextEditingController.text = '';
                      profileNotifer.clearFilterUsers();

                      _enddateTextEditingController.text =
                          selectedDate2.toString();

                      // profileNotifer.fetchUserByFilterDate(
                      //     'createdAt', selectedDate!, selectedDate2!);
                    }
                  },
                ),
                sizedBoxWithHeight(16),

                SizedBox(
                  width: ScreenUtil.instance.screenWidth * 0.6,
                  child: CustomButton(
                    height: 32.h,
                    onPressed: () {
                      profileNotifer.fetchUserByFilterDate(
                          'createdAt', selectedDate, selectedDate2);
                    },
                    text: "Filter by Date",
                  ),
                ),

                sizedBoxWithHeight(16),

                AppMaterialInputField(
                  maxLines: 1,
                  label: 'Email',
                  hint: 'abc.01@gmail.com',
                  controller: _emailTextEditingController,
                  isRequired: false,
                  textInputAction: TextInputAction.go,
                  onSubmit: (value) {
                    if (value?.isNotEmpty ?? false) {
                      _nameTextEditingController.text = '';
                      _usernamTextEditingController.text = '';
                      profileNotifer.clearFilterUsers();

                      profileNotifer.fetchUserByFilter('email', value ?? '');
                    }
                  },
                ),
                sizedBoxWithHeight(16),
                const AppDivider(),
                sizedBoxWithHeight(16),
                if (profileNotifer.filterProfiles?.isNotEmpty ?? false) ...{
                  SizedBox(
                    height: ScreenUtil.instance.screenHeight * 0.5,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return sizedBoxWithHeight(16);
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            profileNotifer.currentUserProfile =
                                profileNotifer.filterProfiles?[index];
                            Navigator.of(context)
                                .pushNamed(BaseRoute.userDetailsScreen);
                          },
                          child: Text(
                            profileNotifer.filterProfiles?[index].name ?? '',
                            style: AppTextStyles.text16w600,
                          ),
                        );
                      },
                      itemCount: profileNotifer.filterProfiles?.length ?? 0,
                    ),
                  ),
                } else ...{
                  SizedBox(
                    height: ScreenUtil.instance.screenHeight * 0.5,
                    child: Center(
                      child: Text(
                        profileNotifer.fetchFilterProfileStatus ==
                                InitEnum.initializing
                            ? 'Filtering Profiles'
                            : 'No related profiles',
                        style: AppTextStyles.text16w500,
                      ),
                    ),
                  ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
