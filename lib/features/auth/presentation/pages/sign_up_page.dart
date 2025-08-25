import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:lms/core/constants/app_router.dart';
import 'package:lms/core/constants/assets.dart';
import 'package:lms/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:lms/features/auth/presentation/widgets/primary_button.dart';

import '../../../../core/constants/app_colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.0),
                SizedBox(
                  width: double.infinity - 160,
                  height: 200,
                  child: SvgPicture.asset(
                    Assets.authImagePath,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Start your learning journey today!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 32.0),
                Form(
                  child: Column(
                    children: [
                      AuthTextFormField(hintTex: 'Full Name'),
                      SizedBox(height: 16.0),
                      AuthTextFormField(hintTex: 'Email'),
                      SizedBox(height: 16.0),
                      AuthTextFormField(hintTex: 'Password'),
                      SizedBox(height: 8.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey.shade200,
                          value: 0.2,
                          valueColor: AlwaysStoppedAnimation(
                            Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      AuthTextFormField(hintTex: 'Confirm Password'),
                      SizedBox(height: 24.0),
                      PrimaryButton(
                        buttonText: 'Register',
                        isLoading: false,
                        onTap: () {},
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.loginPage),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
