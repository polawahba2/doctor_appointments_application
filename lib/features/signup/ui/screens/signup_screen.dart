import 'package:doctor_appointments_application/core/helpers/spacing.dart';
import 'package:doctor_appointments_application/core/theming/text_styles.dart';
import 'package:doctor_appointments_application/core/widgets/app_text_button.dart';
import 'package:doctor_appointments_application/features/login/ui/widgets/terms_and_conditions.dart';
import 'package:doctor_appointments_application/features/signup/cubit/signup_cubit.dart';
import 'package:doctor_appointments_application/features/signup/ui/widgets/sign_up_bloc_listner.dart';
import 'package:doctor_appointments_application/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:doctor_appointments_application/features/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                const VerticalSpacing(6),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                const VerticalSpacing(20),
                Column(
                  children: [
                    const SignupForm(),
                    const VerticalSpacing(25),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    const VerticalSpacing(16),
                    const TermsAndConditionsText(),
                    const VerticalSpacing(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
