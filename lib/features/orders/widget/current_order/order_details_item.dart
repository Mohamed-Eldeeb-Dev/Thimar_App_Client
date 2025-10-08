import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/features/orders/widget/current_order/cubit/client_order_cubit.dart';

class OrderDetailsItem extends StatefulWidget {
  const OrderDetailsItem({super.key, required this.status});
  final String status;
  @override
  State<OrderDetailsItem> createState() => _OrderDetailsItemState();
}

class _OrderDetailsItemState extends State<OrderDetailsItem> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientOrderCubit()..getCurrentOrder(widget.status),
      child: BlocBuilder<ClientOrderCubit, ClientOrderState>(
        builder: (context, state) {
          if (state is ClientOrderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ClientOrderFailure) {
            return Center(child: Text(state.error));
          } else if (state is ClientOrderSuccess) {
            if (state.list.isEmpty) {
              return Center(child: Text('لا يوجد طلبات'));
            } else {
              return Padding(
                padding: EdgeInsets.all(16.h),
                child: SizedBox(
                 height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return _item(model: state.list[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: state.list.length,
                  ),
                ),
              );
            }
          } else {
            return const Center(child: Text('لا يوجد طلبات'));
          }
        },
      ),
    );
  }
}

class _item extends StatelessWidget {
  const _item({super.key, required this.model});
  final OrderModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
      width: 342.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "طلب رقم: ${model.id}",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: model.status == "current"
                      ? Colors.green.withValues(alpha: 0.1)
                      : Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  model.status == "current" ? "جاري التوصيل" : "مكتمل",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: model.status == "current"
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            "${model.date} - ${model.time}",
            style: TextStyle(fontSize: 12.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              ...List.generate(
                model.products.length > 3 ? 3 : model.products.length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                  child: Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(7.r),
                      image: DecorationImage(
                        image: NetworkImage(model.products[index].url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              if (model.products.length > 3)
                Container(
                  width: 25.w,
                  height: 25.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).primaryColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Text(
                    "+${model.products.length - 3}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              const Spacer(),
              Text(
                "${model.orderPrice} ر.س",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
