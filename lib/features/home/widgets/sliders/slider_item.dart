import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/features/home/widgets/sliders/cubit/sliders_cubit.dart';

class SliderItem extends StatefulWidget {
  const SliderItem({super.key});

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SlidersCubit>(
      create: (context) => SlidersCubit()..getData(),
      child: BlocBuilder<SlidersCubit, SlidersState>(
        builder: (context, state) {
          if (state is SlidersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SlidersSuccess) {
            return Stack(
              children: [
                SizedBox(
                  height: 180.h,
                  width: double.infinity,
                  child: CarouselSlider(
                    items: List.generate(
                      state.list.length,
                      (index) => _SliderItem(model: state.list[index]),
                    ),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      autoPlay: true,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      state.list.length,
                      (index) => Container(
                        width: 8.w,
                        height: 8.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == selectedIndex
                              ? Colors.white
                              : Colors.grey.shade100.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 180.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).primaryColor.withValues(alpha: 0.2),
                  ),
                  child: Center(
                    child: Text(
                      "عروض دائمه",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}

class _SliderItem extends StatelessWidget {
  const _SliderItem({super.key, required this.model});

  final SliderModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(model.media, fit: BoxFit.fill),
    );
  }
}
