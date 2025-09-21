import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/utils/app_theme.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class PhoneCountryPicker extends StatelessWidget {
  const PhoneCountryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppThemes.lightTheme.indicatorColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.svgs.sud),
          Text(
            '+966',
            style: AppThemes.textLightTheme.labelLarge,
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
