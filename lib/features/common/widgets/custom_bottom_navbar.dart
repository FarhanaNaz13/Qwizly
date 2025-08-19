import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return BottomAppBar(
      color: Theme.of(context).cardColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home, 'Home', RoutePath.home, currentRoute == RoutePath.home),
            _buildNavItem(context, Icons.grid_view, 'Quizzes', RoutePath.quizCategory, currentRoute == RoutePath.quizCategory),
            const SizedBox(width: 48),
            _buildNavItem(context, Icons.bar_chart, 'Leaderboard', RoutePath.leaderBoard, currentRoute == RoutePath.leaderBoard),
            _buildNavItem(context, Icons.people, 'Friends', RoutePath.friends, currentRoute == RoutePath.friends),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, String route, bool isActive) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? AppColors.purple : Colors.grey),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? AppColors.purple : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
