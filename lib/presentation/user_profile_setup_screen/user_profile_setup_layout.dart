import 'package:cookbook/presentation/user_profile_setup_screen/page_view_screens/setup_fifth.dart';
import 'package:cookbook/presentation/user_profile_setup_screen/page_view_screens/setup_first.dart';
import 'package:cookbook/presentation/user_profile_setup_screen/page_view_screens/setup_fourth.dart';
import 'package:cookbook/presentation/user_profile_setup_screen/page_view_screens/setup_second.dart';
import 'package:cookbook/presentation/user_profile_setup_screen/page_view_screens/setup_third.dart';
import 'package:cookbook/utils/image_picker.dart';
import 'package:cookbook/widgets/molecules/gradient_background.dart';
import 'package:cookbook/widgets/organisms/profile_completion.dart';
import 'package:flutter/material.dart';

class UserProfileSetupLayout extends StatefulWidget {
  const UserProfileSetupLayout({super.key});

  @override
  State<UserProfileSetupLayout> createState() => _UserProfileSetupLayoutState();
}

class _UserProfileSetupLayoutState extends State<UserProfileSetupLayout> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Progress calculation based on page index
  String get progressText => "${(_currentPage + 1) * 20}%";

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ProfileCompletionWidget(
              progressText: progressText,
              currentPage: _currentPage,
              onBack: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setState(() {
                  _currentPage = _currentPage - 1;
                });
              },
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  SetUpFirst(
                    onNext: onNextPage,
                    onSkip: () {},
                  ),
                  SetUpSecond(
                    onNext: onNextPage,
                    onSkip: () {},
                  ),
                  SetUpThird(
                    onNext: onNextPage,
                    onSkip: () {},
                  ),
                  SetUpFourth(
                    onNext: onNextPage,
                    onSkip: () {},
                  ),
                  SetUpFifth(
                    onNext: onNextPage,
                    onSkip: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
