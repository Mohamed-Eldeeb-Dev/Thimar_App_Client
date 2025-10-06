import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/utils/app_spaces.dart';
import 'package:thimar_app/core/utils/extensions.dart';

import 'cubit/details_cubit.dart';

class DetailsItem extends StatefulWidget {
  const DetailsItem({super.key, required this.model});
  final Data model;
  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: widget.model.id,

          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 5),
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(widget.model.mainImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 1),
                      Colors.white.withValues(alpha: .5),
                      Colors.white.withValues(alpha: .01),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
        AppSpaces.getVerticalSpace(14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "${widget.model.title}",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${(widget.model.discount * 100).toInt()}%",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 13.sp,
                      color: Colors.redAccent,
                    ),
                  ),
                  AppSpaces.getHorizontalSpace(4),
                  Text(
                    "${widget.model.price} ر.س",
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(fontSize: 17.sp),
                  ),
                  AppSpaces.getHorizontalSpace(4),
                  Text(
                    "${widget.model.priceBeforeDiscount} ر.س",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              AppSpaces.getVerticalSpace(8),
              Row(
                children: [
                  Text(
                    "السعر / 1 ${widget.model.unit.name}",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 19.sp,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    width: 109.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 29.w,
                            height: 29.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Text(
                          "1",
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(fontSize: 17.sp),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 29.w,
                            height: 29.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 20.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppSpaces.getVerticalSpace(10),
              Divider(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                thickness: 1,
              ),
              AppSpaces.getVerticalSpace(10),
              Text(
                "كود المنتج : ${widget.model.code}",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).toStart,
              AppSpaces.getVerticalSpace(10),
              Divider(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                thickness: 1,
              ),
              AppSpaces.getVerticalSpace(10),
              Text(
                "تفاصيل المنتج",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).toStart,
              AppSpaces.getVerticalSpace(10),
              Text(
                "${widget.model.description}",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ).toStart,
            ],
          ),
        ),
      ],
    );
  }
}
