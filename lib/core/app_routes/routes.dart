import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_recommendation/core/di/services_locator.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/controller/bloc/otp_bloc.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/views/otp_view.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/views/send_email_view.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/controller/auth_cubit/cubit/auth_cubit.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/views/forget_password_view.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/views/sign_in_view.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/views/sign_up_view.dart';
import 'package:meals_recommendation/features/home/presentation/views/navigation_bar_view.dart';
import 'package:meals_recommendation/features/onboarding/presentation/views/on_boarding_view.dart';

class Routes {
  static const String onBoardingView = '/';
  static const String signInView = '/signInView';
  static const String signUpView = '/signUpView';
  static const String sendEmailView = '/sendEmailView';
  static const String mealDetailsScreen = '/mealDetailsScreen';
  static const String otpView = '/otpView';
  static const String homeScreen = '/home';
  static const String favoriteScreen = '/favourite';

  static const String setting = '/setting';
  static const String forgetPasswordView = '/forgetPasswordView';

  static const String testImageScreen = '/testImageScreen';
  static const String navigationBarView = '/navigationBarView';

  static const String addMealScreen = '/addMealScreen';
  static const String testDetails = '/testDetails';
  static const String geminiChat = '/geminiChat';
  static const String geminiChatTest = '/geminiChatTest';
  static const String imagesScreenTest = '/imagesScreen';

  static const String profile = '/profile';

  static GoRouter getRouter({required String initialRoute}) {
    return GoRouter(
      initialLocation: initialRoute,
      routes: [
        GoRoute(
          path: Routes.onBoardingView,
          builder: (context, state) => const OnBoardingView(),
        ),
        // GoRoute(
        //     path: Routes.homeScreen,
        //     builder: (context, state) => const HomeScreen()),

        // GoRoute(
        //   path: Routes.favoriteScreen,
        //   builder: (context, state) => BlocProvider(
        //     create: (context) => FavoritesBloc(
        //       saveFavoriteUseCase: sl(),
        //       deleteFavoriteUseCase: sl(),
        //       getAllFavoritesUseCase: sl(),
        //     )..add(GetAllFavoritesEvent()),
        //     child: const FavouriteScreen(),
        //   ),
        // ),

        // GoRoute(
        //   path: Routes.geminiChatTest,
        //   builder: (context, state) => const GeminiChatScreenTest(),
        // ),
        // GoRoute(
        //   path: Routes.geminiChat,
        //   builder: (context, state) => BlocProvider(
        //     create: (context) => GeminiChatBloc(
        //       generateRecipeUseCase: sl(),
        //       getMainDishImageUseCase: sl(),
        //       getIngredientImagesUseCase: sl(),
        //     ),
        //     child: const GeminiChatScreen(),
        //   ),
        // ),
        // GoRoute(
        //   path: Routes.mealDetailsScreen,
        //   builder: (context, state) {
        //     final extra = state.extra as Map<String, dynamic>;
        //     final recipe = extra['recipe'] as Recipe;
        //     // final dishName = extra['dishName'] as String;
        //     final ingredientImagesUrls =
        //         extra['ingredientImagesUrls'] as List<String>? ?? [];
        //     final initialMainImage = extra['mainImageUrl'] as String?;

        //     return MealDetailsScreen(
        //       ingredientImagesUrls:
        //           ingredientImagesUrls.isNotEmpty ? ingredientImagesUrls : [],
        //       mainImageUrl: initialMainImage ?? '',
        //       recipe: recipe,
        //     );
        //   },

        // ),
        GoRoute(
          path: Routes.signInView,
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) => AuthCubit(
                      baseAuthUserRepo: sl(),
                      signinUserUseCase: sl(),
                      signUpUserUseCase: sl(),
                      resetUserPasswordUseCase: sl(),
                    ),
                child: const SignInView(),
              ),
        ),
        GoRoute(
          path: Routes.forgetPasswordView,
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) => AuthCubit(
                      baseAuthUserRepo: sl(),
                      signinUserUseCase: sl(),
                      signUpUserUseCase: sl(),
                      resetUserPasswordUseCase: sl(),
                    ),
                child: const ForgetPasswordView(),
              ),
        ),
        GoRoute(
          path: Routes.signUpView,
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) => AuthCubit(
                      baseAuthUserRepo: sl(),
                      signinUserUseCase: sl(),
                      signUpUserUseCase: sl(),
                      resetUserPasswordUseCase: sl(),
                    ),
                child: const SignUpView(),
              ),
        ),
        GoRoute(
          path: Routes.sendEmailView,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?; // Safe cast
            final email = extra?['email'] as String? ?? ''; // Handle null case
            final token = extra?['token'] as String? ?? '';
            return BlocProvider(
              create: (context) {
                return OtpBloc(sl(), sl())..add(
                  SendOtpEvent(email: email), // Avoids null error
                );
              },
              child: SendEmailView(emailText: email, token: token),
            );
          },
        ),
        GoRoute(
          path: Routes.otpView,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?; // Safe cast
            final email = extra?['email'] as String? ?? '';
            final token = extra?['token'] as String? ?? '';
            return OtpView(emailController: email, token: token);
          },
        ),
        // GoRoute(
        //   path: Routes.profile,
        //   builder: (context, state) => BlocProvider(
        //     create: (context) => sl<SettingBloc>()..add(GetUserDataevent()),
        //     child: const ProfileScreen(),
        //   ),
        // ),
        // GoRoute(
        //   path: Routes.testDetails,
        //   builder: (context, state) {
        //     return TestDetails(
        //       recipe: state.extra as Recipe,
        //     );
        //   },
        // ),
        // GoRoute(
        //   path: Routes.addMealScreen,
        //   builder: (context, state) => const AddMealScreen(),
        // ),
        GoRoute(
          path: Routes.navigationBarView,
          builder: (context, state) => const NavigationBarView(),
        ),
      ],
    );
  }
}
