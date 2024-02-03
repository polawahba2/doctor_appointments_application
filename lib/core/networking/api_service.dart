import 'package:dio/dio.dart';
import 'package:doctor_appointments_application/core/networking/api_constants.dart';
import 'package:doctor_appointments_application/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointments_application/features/login/data/models/login_response.dart';
import 'package:doctor_appointments_application/features/signup/data/models/signup_requrest_body.dart';
import 'package:doctor_appointments_application/features/signup/data/models/signup_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  //! why don't i use normal constructor ??
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}
