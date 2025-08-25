import 'package:go_router/go_router.dart';
import 'package:lms/features/auth/presentation/pages/login_page.dart';
import 'package:lms/features/auth/presentation/pages/sign_up_page.dart';
import 'package:lms/features/course_details/presentation/views/course_details_view.dart';
import 'package:lms/features/home/presentation/views/home_view.dart';
import 'package:lms/features/onboarding/presentation/view/onboarding_view.dart';

class AppRouter {
  static const onboardingPage = '/';
  static const homePage = '/home_page';
  static const courseDetailsPage = '/course_details';
  static const loginPage = '/login_page';
  static const signUpPage = '/sign_up_page';

  static final router = GoRouter(
    initialLocation: onboardingPage,
    routes: [
      GoRoute(
        path: onboardingPage,
        builder: (context, state) => OnBoardingView(),
      ),
      GoRoute(path: loginPage, builder: (context, state) => LoginPage()),
      GoRoute(path: signUpPage, builder: (context, state) => SignUpPage()),
      GoRoute(path: homePage, builder: (context, state) => HomeView()),
      GoRoute(
        path: courseDetailsPage,
        builder: (context, state) {
          final id = state.extra as String;
          return CourseDetailsView(id: id);
        },
      ),
    ],
  );
}
