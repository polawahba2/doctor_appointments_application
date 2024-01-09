import 'package:doctor_appointments_application/core/images_manager/images_manager.dart';
import 'package:doctor_appointments_application/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.65,
      child: Stack(
        children: [
          Positioned(
            left: -50,
            child: SvgPicture.asset(
              ImagesManager.docLogoLowObacity,
            ),
          ),
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.14, 0.4],
              ),
            ),
            child: Image.asset(
              ImagesManager.onBoardingDoctor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 43.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Best Doctor\nAppointment App',
                  textAlign: TextAlign.center,
                  style: TextStyles.font32BlueBold.copyWith(height: 1.5.h),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                  textAlign: TextAlign.center,
                  style: TextStyles.font13GrayRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
