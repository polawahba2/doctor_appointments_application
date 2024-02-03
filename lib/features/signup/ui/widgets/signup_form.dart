import 'package:doctor_appointments_application/core/helpers/app_regex.dart';
import 'package:doctor_appointments_application/core/helpers/spacing.dart';
import 'package:doctor_appointments_application/core/widgets/app_text_form_field.dart';
import 'package:doctor_appointments_application/features/login/ui/widgets/password_validation.dart';
import 'package:doctor_appointments_application/features/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = context.read<SignupCubit>().passwordController;
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: context.read<SignupCubit>().nameValidator,
            controller: context.read<SignupCubit>().nameController,
          ),
          const VerticalSpacing(18),
          AppTextFormField(
            hintText: 'Email',
            validator: context.read<SignupCubit>().emailValidator,
            controller: context.read<SignupCubit>().emailController,
          ),
          const VerticalSpacing(18),
          AppTextFormField(
            hintText: 'Phone',
            validator: context.read<SignupCubit>().phoneValidator,
            controller: context.read<SignupCubit>().phoneController,
          ),
          const VerticalSpacing(18),
          AppTextFormField(
            hintText: 'Password',
            validator: context.read<SignupCubit>().passwordValidator,
            controller: context.read<SignupCubit>().passwordController,
          ),
          const VerticalSpacing(18),
          AppTextFormField(
            hintText: 'Confirm Password',
            validator:
                context.read<SignupCubit>().passwordConfirmationValidator,
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
          ),
          const VerticalSpacing(25),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
