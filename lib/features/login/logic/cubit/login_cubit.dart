import 'package:doctor_appointments_application/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointments_application/features/login/data/models/login_response.dart';
import 'package:doctor_appointments_application/features/login/data/repos/login_repository.dart';
import 'package:doctor_appointments_application/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  LoginCubit(this.loginRepository) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await loginRepository.login(loginRequestBody);
    response.when(
      success: (LoginResponse loginResponse) {
        emit(LoginState.sucess(loginResponse));
      },
      failure: (error) {
        LoginState.error(error: error.apiErrorModel.message ?? '');
      },
    );
  }
}
