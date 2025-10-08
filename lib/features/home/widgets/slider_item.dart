import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/models/sliders_model.dart';

class SliderItem extends StatefulWidget {
  const SliderItem({super.key, required this.list});
  final List<SliderModel> list;
  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180.h,
          width: double.infinity,
          child: CarouselSlider(
            items: List.generate(
              widget.list.length,
              (index) => _SliderItem(model: widget.list[index]),
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
              widget.list.length,
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
            color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
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
  }
}

class _SliderItem extends StatelessWidget {
  const _SliderItem({Key? key, required this.model}) : super(key: key);

  final SliderModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(model.media, fit: BoxFit.fill),
    );
  }
}
