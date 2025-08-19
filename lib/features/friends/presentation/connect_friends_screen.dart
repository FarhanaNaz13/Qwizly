import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizz_app/features/common/widgets/root_stack.dart';
import 'package:quizz_app/features/core/di/injection.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/friends/domain/friend.dart';
import 'package:quizz_app/features/friends/domain/usecase/share_with_reward.dart';
import 'package:quizz_app/features/friends/presentation/cuibit/points_cubit.dart';
import 'package:quizz_app/features/friends/presentation/widget/social_share_card.dart';

class ConnectWithFriendsScreen extends StatelessWidget {
  ConnectWithFriendsScreen({super.key});

  final friends = [
    Friend(
      id: "1",
      name: "Wakib Hasan",
      avatarUrl: "https://randomuser.me/api/portraits/men/32.jpg",
    ),
    Friend(
      id: "2",
      name: "Ahmed Fuad",
      avatarUrl: "https://randomuser.me/api/portraits/men/45.jpg",
      isConnected: true,
    ),
    Friend(
      id: "3",
      name: "Farhana Naz",
      avatarUrl: "https://randomuser.me/api/portraits/women/65.jpg",
    ),
  ];

  final List<SocialPlatform> _platforms = const [
    SocialPlatform("Facebook", FontAwesomeIcons.facebook),
    SocialPlatform("Messenger", FontAwesomeIcons.facebookMessenger),
    SocialPlatform("WhatsApp", FontAwesomeIcons.whatsapp),
    SocialPlatform("Instagram", FontAwesomeIcons.instagram),
  ];

  Future<void> _shareWithReward(BuildContext context, String platform) async {
    const reward = 20;
    final cubit = context.read<PointsCubit>();
    final useCase = getIt<ShareWithRewardUseCase>();

    await useCase.execute(StringRes.shareMessage);

    if (!context.mounted) return;

    cubit.addPoints(reward);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(StringRes.earnedPoints(platform, reward))),
    );
  }

  Future<void> _inviteFriend(BuildContext context, String friendName) async {
    final useCase = getIt<ShareWithRewardUseCase>();

    await useCase.execute(
      StringRes.inviteMessage,
    );

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(StringRes.inviteSent(friendName))),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PointsCubit>(),
      child: RootStack(
        title: StringRes.connectWithFriendsTitle,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _buildPointsSection(),
              const SizedBox(height: 24),
              _buildFriendsCard(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPointsSection() {
    return BlocBuilder<PointsCubit, int>(
      builder: (_, points) {
        return Center(
          child: Text(
            "${StringRes.yourPoints}$points",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.purpleCom[800],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFriendsCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringRes.friends,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C1C1C),
              ),
            ),
            const SizedBox(height: 8),
            _buildFriendList(context),
            const SizedBox(height: 12),
            SocialShareCard(
              platforms: _platforms,
              onShare: (platformName) =>
                  _shareWithReward(context, platformName),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(friend.avatarUrl),
            ),
            title: Text(friend.name),
            trailing: friend.isConnected
                ? Text(
                    StringRes.connected,
                    style: TextStyle(
                      color: AppColors.green[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  )
                : TextButton(
                    onPressed: () => _inviteFriend(context, friend.name),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(StringRes.invite),
                  ),
          ),
        );
      },
    );
  }
}
