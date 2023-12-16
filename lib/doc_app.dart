import 'package:doctor_appointments_application/core/routing/app_router.dart';
import 'package:doctor_appointments_application/core/routing/app_routes.dart';
import 'package:doctor_appointments_application/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true, //adapt text
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.onBoardingScreen,
        theme: ThemeData(
          primaryColor: AppColors.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
