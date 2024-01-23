import 'package:doctor_appointments_application/core/di/dependincy_injection.dart';
import 'package:doctor_appointments_application/core/routing/app_router.dart';
import 'package:doctor_appointments_application/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
