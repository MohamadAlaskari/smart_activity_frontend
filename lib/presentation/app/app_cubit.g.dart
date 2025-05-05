// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      selectedDate: DateTime.parse(json['selectedDate'] as String),
      status: json['status'] == null
          ? const AuthResult.initial()
          : AuthResult.fromJson(json['status'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      screenStatus: json['screenStatus'] == null
          ? const ScreenStatus.pure()
          : ScreenStatus.fromJson(json['screenStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'selectedDate': instance.selectedDate.toIso8601String(),
      'status': instance.status,
      'user': instance.user,
      'screenStatus': instance.screenStatus,
    };
