import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/common/widgets/root_stack.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/quiz_type_widget.dart';

class QuizCategoryScreen extends StatelessWidget {
  const QuizCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RootStack(
      title: StringRes.quizCategory,
      onBack: () {
        context.go(RoutePath.home);
      },
      showFloatingActionButton: true,
      showBottomNav: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: QuizTypeWidget(color: AppColors.gray[300]
            // Colors.white,
            ),
      ),
    );
  }
}
