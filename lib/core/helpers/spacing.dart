import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpacing extends StatelessWidget {
  final double height;
  const VerticalSpacing(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  final double width;
  const HorizontalSpacing(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}
