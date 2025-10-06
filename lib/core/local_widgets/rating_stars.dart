import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int value; 
  final double size; 

  const RatingStars({
    super.key,
    required this.value,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: size,
        );
      }),
    );
  }
}
