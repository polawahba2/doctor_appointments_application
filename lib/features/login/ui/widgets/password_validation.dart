import 'package:doctor_appointments_application/core/helpers/spacing.dart';
import 'package:doctor_appointments_application/core/theming/app_colors.dart';
import 'package:doctor_appointments_application/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        const VerticalSpacing(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        const VerticalSpacing(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        const VerticalSpacing(2),
        buildValidationRow('At least 1 number', hasNumber),
        const VerticalSpacing(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.gray,
        ),
        const HorizontalSpacing(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.gray : AppColors.darkBlue,
          ),
        )
      ],
    );
  }
}
