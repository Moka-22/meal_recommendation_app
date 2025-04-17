import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meals_recommendation/core/services/firebase_services.dart';
import 'package:meals_recommendation/features/auth/otp/data/data_source/otp_remote_data_source.dart';
import 'package:meals_recommendation/features/auth/otp/data/repo/otp_repo_impl.dart';
import 'package:meals_recommendation/features/auth/otp/domain/repo/otp_repo.dart';
import 'package:meals_recommendation/features/auth/otp/domain/use_cases/send_otp_use_case.dart';
import 'package:meals_recommendation/features/auth/otp/domain/use_cases/verify_otp_use_case.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/controller/bloc/otp_bloc.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/data/repo/auth_repo_impl.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/data/sources/auth_remote_data_source.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/repo/auth_repo.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/use_cases/rest_password_use_case.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/use_cases/sign_in_user_use_case.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/use_cases/sign_up_user_use_case.dart';

import 'package:shared_preferences/shared_preferences.dart';



final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);
  //! Features - OTP
  //  Data Source
  sl.registerLazySingleton<OtpRemoteDataSource>(
    () => OtpReoteDataSourceImpl(),
  );


  //  Repository
  sl.registerLazySingleton<OtpRepo>(
    () => OtpRepoImpl(otpRemoteDataSource: sl<OtpRemoteDataSource>()),
  );

  //  Use Cases
  sl.registerLazySingleton(() => SendOtpUseCase(otpRepo: sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(otpRepo: sl()));

  //  Bloc
  sl.registerFactory(() => OtpBloc(sl(), sl()));
  // sl.registerFactory(() => SettingBloc(SettingRepoImp(SettingRemoteFirebase())));

  //! Features - Auth

  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService(sl(), sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(sl<AuthRemoteDataSource>()));
  sl.registerLazySingleton(() => SignUpUserUseCase(sl<AuthRepo>()));
  sl.registerLazySingleton(() => SignInUserUseCase(sl<AuthRepo>()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl<AuthRepo>()));

  //! Feature Gemini chat
  //  Fav Data Source
  // sl.registerLazySingleton<FavoritesDataSource>(
  //       () => FavoritesDataSource(),
  // );
  // // Fav Repo
  // sl.registerLazySingleton<FavoritesRepo>(
  //       () => FavoritesRepoImpl(favoritesDataSource: sl()),
  // );
  // // Fav Use Cases
  // sl.registerLazySingleton(() => SaveFavoritesUseCase(favouriteRepo: sl()));
  // sl.registerLazySingleton(() => DeleteFavoritesUseCase(favouriteRepo: sl()));
  // sl.registerLazySingleton(() => GetAllFavoritesUseCase(favouriteRepo: sl()));
  // // Fav Bloc
  // sl.registerFactory(() => FavoritesBloc(
  //   saveFavoriteUseCase: sl(),
  //   deleteFavoriteUseCase: sl(),
  //   getAllFavoritesUseCase: sl(),
  // ));



//   // Register RecipeRemoteDataSource correctly
//   sl.registerLazySingleton<RecipeRemoteDataSource>(
//       () => RecipeRemoteDataSource());

// // Register BaseRecipeRemoteDataSource to return the same instance
//   sl.registerLazySingleton<BaseRecipeRemoteDataSource>(
//     () => sl<RecipeRemoteDataSource>(),
//   );

// // Register Repository
//   sl.registerLazySingleton<BaseGeminiChatRepository>(
//     () => RecipeRepositoryImpl(
//       recipeRemoteDataSource: sl<BaseRecipeRemoteDataSource>(),
//     ),
//   );

// // Register Use Case
//   sl.registerLazySingleton(
//     () => GenerateRecipeUseCase(geminiChatRepository: sl()),
//   );
//   sl.registerLazySingleton(
//     () => GetMainDishImageUseCase(baseGeminiChatRepository: sl()),
//   );
//   sl.registerLazySingleton(
//     () => GetIngredientImagesUseCase(repository: sl()),
//   );

// // Register Bloc
//   sl.registerFactory(() => GeminiChatBloc(
//       generateRecipeUseCase: sl(),
//       getMainDishImageUseCase: sl(),
//       getIngredientImagesUseCase: sl()));
}