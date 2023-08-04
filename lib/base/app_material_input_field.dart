import 'package:flutter/material.dart';
// import 'package:month_year_picker/month_year_picker.dart';
import 'package:novasocial_admin/data/constants/app_colors.dart';
import 'package:novasocial_admin/data/constants/app_strings.dart';
import 'package:novasocial_admin/data/constants/app_text_styles.dart';
import 'package:novasocial_admin/utils/extensions/bool_extension.dart';
import 'package:novasocial_admin/utils/extensions/size_extension.dart';
import 'package:novasocial_admin/utils/extensions/text_style_extension.dart';
import 'package:novasocial_admin/utils/theme_handler.dart';

class AppMaterialInputField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextStyle? inputStyle;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool isRequired;
  final bool? isLinkTypeInput;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmit;
  final String? validateValueWith;
  final Function(DateTime?)? dateTimeCallBack;
  final List<DateTime>? firstLastDate;
  final bool? isSpecialCharInvalid;
  final TextInputAction? textInputAction;

  const AppMaterialInputField({
    super.key,
    this.label,
    this.hint,
    this.inputStyle,
    this.suffixIcon,
    required this.controller,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.isLinkTypeInput,
    required this.isRequired,
    this.onChanged,
    this.onSubmit,
    this.dateTimeCallBack,
    this.validateValueWith,
    this.firstLastDate,
    this.isSpecialCharInvalid,
    this.textInputAction,
  });

  @override
  State<AppMaterialInputField> createState() => _AppMaterialInputFieldState();
}

class _AppMaterialInputFieldState extends State<AppMaterialInputField> {
  final FocusNode _focusNode = FocusNode();
  Color _fillColor = AppColors.novaViolet.withOpacity(0.1);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _fillColor = ThemeHandler.backgroundColor();
        });
      } else {
        setState(() {
          _fillColor = AppColors.novaViolet.withOpacity(0.1);
        });
      }
    });
  }

  // Future<void> _selectDateTime(BuildContext context) async {
  //   DateTime? selectedDate = await showMonthYearPicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: widget.firstLastDate?.first ?? DateTime(1960),
  //     lastDate: widget.firstLastDate?.last ?? DateTime(2040),
  //   );
  //   widget.controller.text = selectedDate?.abrMMMyyyy ?? '';
  //   widget.dateTimeCallBack!(selectedDate);
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      style: widget.inputStyle ?? AppTextStyles.text14w400,
      keyboardType: widget.maxLines != null ? TextInputType.multiline : null,
      readOnly: widget.dateTimeCallBack != null,
      decoration: InputDecoration(
        filled: true,
        fillColor: _fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.novaDarkIndigo,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        labelText: (widget.label?.isEmpty ?? true)
            ? ''
            : '${widget.label}', // ${widget.isRequired ? '*' : ''}',
        counterStyle: AppTextStyles.text8w400.novaMuted,
        labelStyle: AppTextStyles.text14w400.novaMuted,
        alignLabelWithHint: true,
        floatingLabelStyle: AppTextStyles.text12w400,
        hintText: widget.hint,
        hintStyle: AppTextStyles.text14w400.novaMuted,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: ThemeHandler.novaMutedColor(),
        isDense: true,
      ),
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmit,
      onTap: () {
        // if (widget.dateTimeCallBack != null) {
        //   _selectDateTime(context);
        // }
      },
      validator: (s) {
        if ((widget.isSpecialCharInvalid ?? false) &&
            RegExp(r'^[a-zA-Z0-9_.]*$').hasMatch(s!).not) {
          return 'Only alphabets, numbers, underscore (/) and dot (.) are allowed';
        }
        if ((s?.isNotEmpty ?? false) && (widget.isLinkTypeInput ?? false)) {
          if ((Uri.tryParse(s ?? '')?.isAbsolute ?? false)) return null;
          return AppStrings.enterValidLink;
        }
        if (widget.isRequired && (s?.isEmpty ?? false)) {
          return AppStrings.inputRequired;
        }
        if ((widget.validateValueWith?.isNotEmpty ?? false) &&
            (widget.validateValueWith != s)) {
          return 'The input you provided doesn\'t match with the expected value';
        }
        return null;
      },
    );
  }
}
