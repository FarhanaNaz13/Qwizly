import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quizz_app/features/common/widgets/custom_bottom_navbar.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/home/presentation/screens/widgets/greeting_section.dart';
import 'package:quizz_app/features/home/presentation/screens/widgets/quiz_header.dart';
import 'package:quizz_app/features/home/presentation/screens/widgets/quizzes_section.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();

    if (quizCubit.state.allQuestions.isEmpty) {
      quizCubit.start();
    }
    final dayName = DateFormat('EEEE').format(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            GreetingSection(),
            QuizHeader(
              dayName: dayName,
            ),
            SizedBox(height: 16),
            QuizzesSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
