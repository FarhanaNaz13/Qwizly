import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/common/widgets/app_drawer.dart';
import 'package:quizz_app/features/common/widgets/custom_appbar.dart';
import 'package:quizz_app/features/common/widgets/custom_bottom_navbar.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';

class RootStack extends StatefulWidget {
  final Widget body;
  final String title;
  final bool showBottomNav;
  final bool showFloatingActionButton;
  final bool enableDrawer;
  final VoidCallback? onBack;
  final bool showBackButton;
  final bool? resizeToAvoidBottomInset;

  const RootStack({
    super.key,
    required this.body,
    required this.title,
    this.showBottomNav = true,
    this.showFloatingActionButton = true,
    this.enableDrawer = true,
    this.onBack,
    this.showBackButton = true,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  State<RootStack> createState() => _RootStackState();
}

class _RootStackState extends State<RootStack> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    if (widget.enableDrawer) {
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  void closeDrawer() {
    if (widget.enableDrawer) {
      _scaffoldKey.currentState?.closeEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: CustomAppBar(
        titleText: widget.title,
        showBackButton: widget.showBackButton,
        onBack: widget.onBack ?? () => context.pop(),
        onMenu: openDrawer,
        showMenuButton: widget.enableDrawer,
      ),
      endDrawer:
          widget.enableDrawer ? AppDrawer(scaffoldKey: _scaffoldKey) : null,
      body: widget.body,
      floatingActionButton: widget.showFloatingActionButton
          ? FloatingActionButton(
              backgroundColor: AppColors.purple,
              shape: const CircleBorder(),
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white,),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          widget.showBottomNav ? const CustomBottomNavBar() : null,
    );
  }
}
