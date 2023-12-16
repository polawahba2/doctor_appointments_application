import 'package:doctor_appointments_application/core/routing/app_routes.dart';
import 'package:doctor_appointments_application/features/login/ui/screens/login_screen.dart';
import 'package:doctor_appointments_application/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
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
