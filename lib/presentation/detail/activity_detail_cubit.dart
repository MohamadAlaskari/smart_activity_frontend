import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/domain/model/activity.dart';
import 'package:vibe_day/presentation/detail/activity_detail_state.dart';

class ActivityDetailCubit extends Cubit<ActivityDetailState> {
  ActivityDetailCubit({
    required Activity activity,
  }) : super(ActivityDetailState(activity: activity));
}