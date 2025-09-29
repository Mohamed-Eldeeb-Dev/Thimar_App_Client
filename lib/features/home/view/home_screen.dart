import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/utils/app_spaces.dart';
import 'package:thimar_app/features/home/widgets/search_field/search_field.dart';
import 'package:thimar_app/features/home/widgets/sliders/slider_item.dart';
import 'package:thimar_app/gen/assets.gen.dart';

import '../widgets/categories/category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'التوصيل إلى',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "شارع الملك فهد - جدة",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              height: 33.h,
              width: 32.w,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  Assets.svgs.bag,
                  height: 19.h,
                  width: 17.w,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        leadingWidth: 90.w,
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.svgs.logo, height: 20.h, width: 20.w),
              SizedBox(width: 3.w),
              Text(
                "سلة ثمار",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchField(),
          SliderItem(),
          AppSpaces.getVerticalSpace(29),
          CategoryItem(),
        ],
      ),
    );
  }
}
