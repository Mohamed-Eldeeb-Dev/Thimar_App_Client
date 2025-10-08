import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/models/category_model.dart';



class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.list});

final List<CategoryModel> list;
  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              "الأقسام",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  _CategoryItem(model: widget.list[index]),
              itemCount: widget.list.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              separatorBuilder: (context, index) =>
                  SizedBox(width: 18.w),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.model});

  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 75.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 75.w,
            height: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.shade200,
            ),
            child: Center(child: Image.network(model.media, fit: BoxFit.fill)),
          ),
          SizedBox(height: 5.h),
          Text(
            model.name,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
