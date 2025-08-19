import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToIntro();
  }

  Future<void> _navigateToIntro() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    context.go(RoutePath.intro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: Center(
        child: SvgPicture.asset(
          QuizzAsset.icons.splash.qwizlyLogo,
        ),
      ),
    );
  }
}
