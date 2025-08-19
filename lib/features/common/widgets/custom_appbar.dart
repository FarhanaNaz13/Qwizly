import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final VoidCallback? onBack;
  final VoidCallback? onMenu;
  final bool showMenuButton;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.titleText,
    this.onBack,
    this.onMenu,
    this.showMenuButton = true,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: AppTheme.lightTheme.appBarTheme.backgroundColor,
      title: Text(titleText),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack ?? () => Navigator.of(context).pop(),
            )
          : null,
      actions: showMenuButton
          ? [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: onMenu ?? () => Scaffold.of(context).openEndDrawer(),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
