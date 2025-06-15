import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/domain/model/activity.dart';

part 'activity_detail_state.freezed.dart';

@freezed
class ActivityDetailState with _$ActivityDetailState {
  const ActivityDetailState._();

  factory ActivityDetailState({
    required Activity activity,
    @Default(ScreenStatus.pure()) ScreenStatus screenStatus,
  }) = _ActivityDetailState;
}