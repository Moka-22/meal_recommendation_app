import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/firebase_options.dart';
import 'package:meals_recommendation/meals_app_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final initialRoute = Routes.onBoardingView;
  runApp(MealsAppMain(initialRoute: initialRoute));
}
