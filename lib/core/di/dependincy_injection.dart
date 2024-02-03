import 'package:dio/dio.dart';
import 'package:doctor_appointments_application/core/networking/api_service.dart';
import 'package:doctor_appointments_application/core/networking/dio_factory.dart';
import 'package:doctor_appointments_application/features/login/data/repos/login_repository.dart';
import 'package:doctor_appointments_application/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointments_application/features/signup/cubit/signup_cubit.dart';
import 'package:doctor_appointments_application/features/signup/data/repos/signup_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.asNewInstance();

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt
      .registerLazySingleton<SignupRepository>(() => SignupRepository(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
