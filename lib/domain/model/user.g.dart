// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      active: json['active'] as bool?,
      name: json['name'] as String?,
      hasPushToken: json['hasPushToken'] as bool?,
      localAccount: json['localAccount'] as bool?,
      userAuthority: json['userAuthority'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'active': instance.active,
      'name': instance.name,
      'hasPushToken': instance.hasPushToken,
      'localAccount': instance.localAccount,
      'userAuthority': instance.userAuthority,
    };
