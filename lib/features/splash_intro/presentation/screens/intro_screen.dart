import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/splash_intro/presentation/widgets/animated_flappy.dart';
import 'package:quizz_app/features/splash_intro/presentation/widgets/next_circle_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  final PageController _controller = PageController();
  late AnimationController _animController;
  late Animation<double> _progressAnimation;

  final List<_IntroPageData> _pages = [
    _IntroPageData(
      image: QuizzAsset.icons.splash.welcome1,
      title: StringRes.welcomeQwizly,
      subtitle: StringRes.introOneMessage,
    ),
    _IntroPageData(
      image: QuizzAsset.icons.splash.goods1,
      title: StringRes.triviaChallenge,
      subtitle: StringRes.introTwoMessage,
    ),
    _IntroPageData(
      image: QuizzAsset.icons.splash.group3,
      title: StringRes.testWithQwizly,
      subtitle: StringRes.introThreeMessage,
    ),
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _progressAnimation =
        Tween<double>(begin: 0, end: 0).animate(_animController);
  }

  void _nextPage() {
    if (_currentPage == _pages.length - 1) {
      GoRouter.of(context).go(RoutePath.home);
      return;
    }

    setState(() => _currentPage++);

    final targetProgress = (_currentPage + 1) / _pages.length;
    _progressAnimation = Tween<double>(
      begin: _animController.value,
      end: targetProgress,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeInOut,
    ));

    _animController.forward(from: 0);
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (_, index) => Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    child: SvgPicture.asset(_pages[index].image)),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: _IntroContent(
              title: page.title,
              subtitle: page.subtitle,
              controller: _controller,
              pageCount: _pages.length,
              currentPage: _currentPage,
              progressAnimation: _progressAnimation,
              onNext: _nextPage,
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final PageController controller;
  final int pageCount;
  final int currentPage;
  final Animation<double> progressAnimation;
  final VoidCallback onNext;

  const _IntroContent({
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.pageCount,
    required this.currentPage,
    required this.progressAnimation,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runAlignment: WrapAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark,
                ),
                textAlign: TextAlign.center,
              ),
              const AnimatedFlappy(),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.dark,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: pageCount,
                effect: WormEffect(
                  dotColor: Colors.grey.shade400,
                  activeDotColor: AppColors.purple,
                  spacing: 12,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              NextCircleButton(
                progressAnimation: progressAnimation,
                onNext: onNext,
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _IntroPageData {
  final String image;
  final String title;
  final String subtitle;

  const _IntroPageData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}


