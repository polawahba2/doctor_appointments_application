import 'package:doctor_appointments_application/features/onboarding/ui/widgets/doc_image_and_text.dart';
import 'package:doctor_appointments_application/features/onboarding/ui/widgets/doc_logo_and_name.dart';
import 'package:doctor_appointments_application/features/onboarding/ui/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DocLogoAndName(),
                SizedBox(
                  height: 20.h,
                ),
                const DocImageAndText(),
                SizedBox(height: 30.h),
                const GetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
