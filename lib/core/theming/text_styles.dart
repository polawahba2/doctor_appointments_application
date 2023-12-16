import 'package:doctor_appointments_application/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static final TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static final TextStyle font33BlueBlod = TextStyle(
    fontSize: 33.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.mainBlue,
  );
  static final TextStyle font10GreyReqular = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.mainGrey,
  );
  static final TextStyle font16WhtiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );
}
