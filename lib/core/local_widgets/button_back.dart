import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/routes/app_routes_fun.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutesFunc.pop();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16, top: 11, bottom: 11),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(11.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.svgs.arrowRight,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
