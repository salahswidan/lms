import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/constants/app_text_styles.dart';
import 'package:lms/features/home/presentation/cubit/home_view_cubit.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<HomeViewCubit>();

    final colorScheme = Theme.of(context).colorScheme;

    final items = [
      BottomNavigationBarItem(
        icon: Icon(PhosphorIcons.bookOpen(), color: colorScheme.primary),
        label: 'Courses',
        activeIcon: Icon(
          PhosphorIconsFill.bookOpen,
          color: colorScheme.primary,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(PhosphorIcons.bookmarkSimple(), color: colorScheme.primary),
        label: 'Favourite',
        activeIcon: Icon(
          PhosphorIconsFill.bookmarkSimple,
          color: colorScheme.primary,
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(PhosphorIcons.user(), color: colorScheme.primary),
        label: 'Profile',
        activeIcon: Icon(PhosphorIconsFill.user, color: colorScheme.primary),
      ),
    ];

    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: AppTextStyles.labelMedium,
            showSelectedLabels: true,
            unselectedItemColor: colorScheme.primary,
            selectedItemColor: colorScheme.primary,
            items: items,
            selectedFontSize: 14.0,
            unselectedFontSize: 14.0,
            elevation: 0.0,
            currentIndex: state.currentIndex,
            onTap: (index) => mainCubit.toggleIndex(index),
          ),
          body: mainCubit.changePage(),
        );
      },
    );
  }
}
