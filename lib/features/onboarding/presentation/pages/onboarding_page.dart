import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/onboarding/presentation/widgets/onboarding_action_buttons.dart';
import 'package:learning_management/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:learning_management/features/onboarding/presentation/widgets/onboarding_page_view.dart';

class OnboardingPage extends HookWidget {
  static String get path => "/onboard";
  static String get name => "onboard";
  const OnboardingPage({super.key});


  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentIndex = useState(0);

    final onboardingPages = [
      OnboardingPageData(
        title: "Hi, Welcome Back! 👋",
        description:
        "Welcome to our learning platform! Stay ahead by tracking your academic progress, managing your learning goals, and accessing key features—all in one place. Whether you're just getting started or already on your journey, we’re here to support your success.",
        svgImage: "assets/images/global_learning.svg",
      ),
      OnboardingPageData(
        title: "Stay Focused",
        description:
        "Never miss a deadline again! Our smart reminders and scheduling tools keep you organized and on track. Plan your study sessions, set exam alerts, and make time for what matters most—your learning and personal growth.",
        svgImage: "assets/images/online_learning.svg",
      ),
      OnboardingPageData(
        title: "Achieve More",
        description:
        "Unlock your full potential with data-driven insights and personalized learning support. Set your goals, monitor your achievements, and take your academic journey to the next level. With us, your growth never stops.",
        svgImage: "assets/images/exam_scene.svg",
      ),
    ];


    void completeOnboarding() {
      Navigator.pushReplacementNamed(context, SignInPage.name);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding24,
          child: Column(
            children: [

              Expanded(
                child: OnboardingPageView(
                  pages: onboardingPages,
                  controller: pageController,
                  onPageChanged: (index) => currentIndex.value = index,
                ),
              ),

              gap24,

              OnboardingPageIndicator(
                controller: pageController,
                count: onboardingPages.length,
              ),

              gap36,

              OnboardingActionButtons(
                currentIndex: currentIndex.value,
                lastIndex: onboardingPages.length - 1,
                onSkip: completeOnboarding,
                onNextOrDone: () {
                  if (currentIndex.value == onboardingPages.length - 1) {
                    completeOnboarding();
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
