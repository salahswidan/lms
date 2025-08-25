import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lms/core/constants/app_router.dart';
import 'package:lms/core/cubits/course_cubit/course_cubit.dart';
import 'package:lms/core/services/get_it_service.dart';
import 'package:lms/core/theme/app_theme.dart';
import 'package:lms/features/check_out/cubit/check_out_cubit.dart';
import 'package:lms/features/course_details/presentation/cubit/course_details_cubit.dart';
import 'package:lms/features/courses/domain/repos/course_repo.dart';
import 'package:lms/features/home/presentation/cubit/home_view_cubit.dart';
import 'package:lms/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:lms/features/payment/cubit/payment_cubit.dart';

void main() {
  setup();
  runApp(const LMS());
}

class LMS extends StatelessWidget {
  const LMS({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => HomeViewCubit()),
        BlocProvider(create: (context) => CourseCubit(getIt.get<CourseRepo>())),
        BlocProvider(create: (context) => CourseDetailsCubit()),
        BlocProvider(create: (context) => CheckoutCubit([])),
        BlocProvider(create: (context) => PaymentCubit()),
      ],
      child: MaterialApp.router(
        theme: CustomAppTheme.lightTheme,
        darkTheme: CustomAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
