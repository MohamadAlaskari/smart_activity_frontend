import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/presentation/settings/settings_cubit.dart';
import 'package:vibe_day/presentation/ui/buttons/vibe_day_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SETTINGS.TITLE'.tr()), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: VibeDayButton(
            text: 'Abmelden',
            onPressed: () {
              context.read<SettingsCubit>().logout(context);
            },
          ),
        ),
      ),
    );
  }
}