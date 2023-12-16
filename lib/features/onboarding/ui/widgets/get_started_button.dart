import 'package:doctor_appointments_application/core/helpers/extenssions.dart';
import 'package:doctor_appointments_application/core/routing/app_routes.dart';
import 'package:doctor_appointments_application/core/theming/app_colors.dart';
import 'package:doctor_appointments_application/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: TextButton(
        onPressed: () {
          context.pushNamed(AppRoutes.loginScreen);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.mainBlue,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(
            Size(double.infinity, 50.h),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Text('Get Started', style: TextStyles.font16WhtiteSemiBold),
      ),
    );
  }
}
