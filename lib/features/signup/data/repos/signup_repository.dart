import 'package:doctor_appointments_application/core/networking/api_error_handler.dart';
import 'package:doctor_appointments_application/core/networking/api_result.dart';
import 'package:doctor_appointments_application/core/networking/api_service.dart';
import 'package:doctor_appointments_application/features/signup/data/models/signup_requrest_body.dart';
import 'package:doctor_appointments_application/features/signup/data/models/signup_response.dart';

class SignupRepository {
  final ApiService apiService;
  const SignupRepository(this.apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
