import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';

class MealsAppMain extends StatelessWidget {
  const MealsAppMain({super.key, required this.initialRoute});
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.getRouter(initialRoute: initialRoute),
        title: 'Meals App',
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
