import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recommendation/bloc_observer.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/core/di/services_locator.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/firebase_options.dart';
import 'package:meals_recommendation/meals_app_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  final token = sl<SharedPreferences>().getString(AppString.userToken);
  final initialRoute =
      token != null && token.isNotEmpty
          ? Routes.navigationBarView
          : Routes.onBoardingView;
  runApp(MealsAppMain(initialRoute: initialRoute));
}
