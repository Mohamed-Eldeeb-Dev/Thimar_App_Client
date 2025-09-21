import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/utils/app_spaces.dart';
import 'package:thimar_app/core/utils/app_theme.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
    required this.lebal,
    required this.subLebel,
    this.fontSize,
    this.phoneNumber,
    this.onChangePhoneNumber,
    this.textButton,
    this.isPhoneNumber = false,
  });
  final String lebal;
  final String subLebel;
  final double? fontSize;
  final String? phoneNumber;
  final VoidCallback? onChangePhoneNumber;
  final String? textButton;
  final bool? isPhoneNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 11, right: 11).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SvgPicture.asset(
              Assets.svgs.logo,
              width: 130.w,
              height: 126.h,
            ),
          ),
          AppSpaces.getVerticalSpace(21),
          Text(lebal, style: AppThemes.textLightTheme.labelLarge),
          AppSpaces.getVerticalSpace(10),
          Text(
            subLebel,
            style: AppThemes.textLightTheme.labelMedium?.copyWith(
              fontSize: fontSize,
            ),
          ),
          if (isPhoneNumber == true)
            Row(
              children: [
                Text(
                  phoneNumber ?? '',
                  style: AppThemes.textLightTheme.labelMedium,
                  textDirection: TextDirection.ltr,
                ),
                TextButton(
                  onPressed: onChangePhoneNumber,
                  child: Text(textButton ?? ''),
                ),
              ],
            )
          else
            SizedBox.shrink(),
        ],
      ),
    );
  }
}
