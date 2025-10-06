import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/local_widgets/rating_stars.dart';
import 'package:thimar_app/core/utils/extensions.dart';
import 'package:thimar_app/features/product_details/widgets/rates/cubit/rate_cubit.dart';

class RateItem extends StatefulWidget {
  const RateItem({super.key, required this.model});
  final List<Data> model;
  @override
  State<RateItem> createState() => _RateItemState();
}

class _RateItemState extends State<RateItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            "التقييمات",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
            ),
          ).toStart,
          SizedBox(height: 8.h),
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return _rateItem(model: widget.model[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.w);
              },
              itemCount: widget.model.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class _rateItem extends StatelessWidget {
  _rateItem({Key? key, required this.model}) : super(key: key);
  final Data model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      width: 270.w,
      height: 87.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model.clientName,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  RatingStars(value: model.value, size: 15.sp),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                model.comment,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 14.sp,
                  color: Colors.grey.shade900,
                ),
                maxLines: 1,
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: NetworkImage(model.clientImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
