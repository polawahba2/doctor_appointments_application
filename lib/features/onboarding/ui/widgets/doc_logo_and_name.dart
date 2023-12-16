import 'package:doctor_appointments_application/core/images_manager/images_manager.dart';
import 'package:doctor_appointments_application/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImagesManager.docLogo,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'Doctor',
          style: TextStyles.font24Black700Weight,
        ),
      ],
    );
  }
}
