import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/local_widgets/button_back.dart';
import 'package:thimar_app/features/product_details/widgets/details/cubit/details_cubit.dart';
import 'package:thimar_app/features/product_details/widgets/details/details_item.dart';
import 'package:thimar_app/features/product_details/widgets/rates/cubit/rate_cubit.dart';
import 'package:thimar_app/gen/assets.gen.dart';

import '../widgets/rates/rate_item.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final int id;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              DetailsCubit()..getData(id: widget.id.toString()),
        ),
        BlocProvider(
          create: (context) => RateCubit()..getData(id: widget.id.toString()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 46.w,
          leading: ButtonBack(),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 16.w),
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.svgs.heartEmpty,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<DetailsCubit, DetailsState>(
                builder: (context, state) {
                  if (state is DetailsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DetailsFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  } else if (state is DetailsSuccess) {
                    return DetailsItem(model: state.list.first);
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 24.h),
              BlocBuilder<RateCubit, RateState>(
                builder: (context, state) {
                  if (state is RateLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RateFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  } else if (state is RateSuccess) {
                    return RateItem(model: state.list);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
