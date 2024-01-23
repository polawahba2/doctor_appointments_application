import 'package:doctor_appointments_application/core/networking/api_error_handler.dart';
import 'package:doctor_appointments_application/core/networking/api_result.dart';
import 'package:doctor_appointments_application/core/networking/api_service.dart';
import 'package:doctor_appointments_application/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointments_application/features/login/data/models/login_response.dart';

class LoginRepository {
  final ApiService apiService;

  LoginRepository(this.apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
