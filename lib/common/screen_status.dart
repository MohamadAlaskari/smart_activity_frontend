import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_status.g.dart';
part 'screen_status.freezed.dart';

@Freezed(fromJson: true, toJson: true)
class ScreenStatus with _$ScreenStatus {
  const factory ScreenStatus.pure() = ScreenStatusPure;
  const factory ScreenStatus.loading() = ScreenStatusLoading;
  const factory ScreenStatus.success() = ScreenStatusSuccess;
  const factory ScreenStatus.error([String? messageKey]) = ScreenStatusError;

  factory ScreenStatus.fromJson(Map<String, dynamic> json) =>
      _$ScreenStatusFromJson(json);
}