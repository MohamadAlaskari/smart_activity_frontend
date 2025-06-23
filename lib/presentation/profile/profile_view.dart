import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/app/app_cubit.dart';
import 'package:vibe_day/presentation/login/login_provider.dart';
import 'package:vibe_day/presentation/ui/buttons/vibe_day_button.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static void show(BuildContext context) {
    showDialog(context: context, builder: (context) => const ProfileView());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, appState) {
          final user = appState.user;
          final displayName = user?.username ?? user?.firstName ?? '';

          String initials = '';
          if (user?.firstName?.isNotEmpty == true) {
            initials += user!.firstName![0].toUpperCase();
          }
          if (user?.lastName?.isNotEmpty == true) {
            initials += user!.lastName![0].toUpperCase();
          }
          if (initials.isEmpty) {
            initials = '';
          }

          return Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorName.colorPrimary,
                      radius: 20,
                      child: Text(
                        initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                VibeDayButton(
                  text: 'SETTINGS.LOGOUT'.tr(),
                  icon: Icons.logout,
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _logout(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    context.read<VibeSelectionCubit>().resetToDefaults();
    await context.read<AppCubit>().logout();

    if (context.mounted) {
      context.pushNamed(LoginProvider.routeName);
    }
  }
}
