import 'package:doctor_appointments_application/core/helpers/app_regex.dart';
import 'package:doctor_appointments_application/features/signup/cubit/signup_state.dart';
import 'package:doctor_appointments_application/features/signup/data/models/signup_requrest_body.dart';
import 'package:doctor_appointments_application/features/signup/data/models/signup_response.dart';
import 'package:doctor_appointments_application/features/signup/data/repos/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository signupRepository;
  SignupCubit(this.signupRepository) : super(const SignupState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.loading());
    final signupRequestBody = SignupRequestBody(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
      gender: 0,
    );
    final response = await signupRepository.signup(signupRequestBody);
    response.when(
      success: (SignupResponse signupResponse) {
        emit(SignupState.sucess(signupResponse));
      },
      failure: (error) {
        emit(SignupState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  dynamic nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
  }

  dynamic emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!AppRegex.isEmailValid(value)) {
      return 'Please enter a valid email';
    }
  }

  dynamic phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone';
    }
    if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Please enter a valid phone number';
    }
  }

  dynamic passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (!AppRegex.isPasswordValid(value)) {
      return 'Please enter a valid password';
    }
  }

  dynamic passwordConfirmationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password confirmation';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
  }
}
