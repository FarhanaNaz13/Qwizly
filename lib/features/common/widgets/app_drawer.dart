import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/theme/cubit/theme_cubit.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class AppDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppDrawer({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: AppColors.cream,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // background image
                  Image.asset(
                    QuizzAsset.icons.avatar.user.path,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // text at bottom
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Hello Genius!",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                scaffoldKey.currentState?.closeEndDrawer();
                context.go(RoutePath.home);
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text("Quizzes"),
              onTap: () {
                scaffoldKey.currentState?.closeEndDrawer();
                context.go(RoutePath.quizCategory);
              },
            ),
            const Spacer(),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, state) {
                return SwitchListTile(
                  title: const Text("Change Mode"),
                  value: state == ThemeMode.dark,
                  onChanged: (_) => themeCubit.toggleTheme(),
                  secondary: Icon(
                    state == ThemeMode.dark
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
