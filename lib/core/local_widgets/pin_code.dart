import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_app/core/utils/app_theme.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        animationCurve: Curves.easeIn,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        backgroundColor: Colors.white,
        keyboardType: TextInputType.number,
        appContext: context,
        length: 4,
        controller: controller,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(18.r),
          fieldHeight: 60.h,
          fieldWidth: 71.w,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          activeColor: AppThemes.lightTheme.primaryColor,
          inactiveColor: AppThemes.lightTheme.disabledColor,
          selectedColor: AppThemes.lightTheme.primaryColor,
        ),
      ),
    );
  }
}
