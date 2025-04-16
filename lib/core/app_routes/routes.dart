import 'package:go_router/go_router.dart';
import 'package:meals_recommendation/features/onboarding/presentation/views/on_boarding_view.dart';

class Routes {
  static const String onBoardingView = '/';

  static GoRouter getRouter({required String initialRoute}) {
    return GoRouter(
      initialLocation: initialRoute,
      routes: [
        GoRoute(
          path: onBoardingView,
          builder: (context, state) => const OnBoardingView(),
        ),
      ],
    );
  }
}
