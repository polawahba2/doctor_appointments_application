import 'package:doctor_appointments_application/core/di/dependincy_injection.dart';
import 'package:doctor_appointments_application/core/routing/app_routes.dart';
import 'package:doctor_appointments_application/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointments_application/features/login/ui/screens/login_screen.dart';
import 'package:doctor_appointments_application/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/Home/ui/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defient for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
