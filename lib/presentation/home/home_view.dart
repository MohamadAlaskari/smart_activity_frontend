import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/presentation/ui/buttons/vibe_day_button.dart';

import 'home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME.TITLE'.tr(), style: const TextStyle(fontSize: 28)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: VibeDayButton(
            text: 'Abmelden',
            onPressed: () {
              context.read<HomeCubit>().logout(context);
            },
          ),
        ),
      ),
    );
  }
}
