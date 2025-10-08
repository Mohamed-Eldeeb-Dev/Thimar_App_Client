import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SearchBar(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        ),
        hintText: 'ابحث عن ماتريد؟',
        hintStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.5),
            fontWeight: FontWeight.w500,
          ),
        ), 
        leading: SvgPicture.asset(
          Assets.svgs.search,
          height: 20.h,
          width: 20.w,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
            BlendMode.srcIn,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
        ),
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).primaryColor.withValues(alpha: 0.1),
        ),
        elevation: WidgetStatePropertyAll(0),
      ),
    );
  }
}
