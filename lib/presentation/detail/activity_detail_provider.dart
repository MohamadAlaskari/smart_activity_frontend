import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/domain/model/activity.dart';
import 'package:vibe_day/presentation/detail/activity_detail_cubit.dart';

import 'activity_detail_state.dart';
import 'activity_detail_view.dart';

class ActivityDetailProvider extends StatelessWidget {
  final Activity activity;

  const ActivityDetailProvider({
    super.key,
    required this.activity,
  });

  static const String routeName = 'activity-detail';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityDetailCubit(
        activity: activity,
      ),
      child: BlocListener<ActivityDetailCubit, ActivityDetailState>(
        listenWhen: (prev, cur) => prev.screenStatus != cur.screenStatus,
        listener: _onStatusChanged,
        child: const ActivityDetailView(),
      ),
    );
  }

  void _onStatusChanged(BuildContext context, ActivityDetailState state) {
  }
}