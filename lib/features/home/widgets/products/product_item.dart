import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/routes/app_routes_fun.dart';
import 'package:thimar_app/core/routes/routes.dart';
import 'cubit/product_cubit.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit()..getData(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              "الأصناف",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductSuccess) {
                return GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 0.7,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  children: List.generate(
                    state.list.length,
                    (index) => _ProductItem(model: state.list[index]),
                  ),
                );
              } else {
                return const Center(child: Text('No Data'));
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  _ProductItem({Key? key, required this.model}) : super(key: key);

  final Data model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutesFunc.push(NamedRoutes.productDetails, arg: {'id': model.id});
      },
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Hero(
                  tag: model.id,
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 120.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.network(
                            model.mainImage,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.r),
                            topLeft: Radius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          '${(model.discount * 100).toInt()}%',
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              model.title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'السعر/ 1${model.unit.name}',
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  '${model.price} ر.س',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  "${model.priceBeforeDiscount}ر.س",
                  style: TextStyle(
                    fontSize: 12.sp,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.grey,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.add, color: Colors.white, size: 20.sp),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // SizedBox(
    //   width: double.infinity,
    //   child: model.images.isNotEmpty
    //       ? Image.network(
    //           model.images.first.url,
    //           fit: BoxFit.cover,
    //         )
    //       : const SizedBox.shrink(),
    // );
  }
}
