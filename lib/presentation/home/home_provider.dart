import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/presentation/home/home_cubit.dart';
import 'package:vibe_day/presentation/home/home_state.dart';
import 'package:vibe_day/presentation/home/home_view.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (prev, cur) => prev.screenStatus != cur.screenStatus,
      listener: _onStatusChanged,
      child: const HomeView(),
    );
  }

  void _onStatusChanged(BuildContext context, HomeState state) {}
}