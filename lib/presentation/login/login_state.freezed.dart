// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  ScreenStatus get screenStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  EmailOrUser get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get obscurePassword => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {ScreenStatus screenStatus,
      FormzSubmissionStatus status,
      EmailOrUser email,
      Password password,
      bool obscurePassword,
      User? user});

  $ScreenStatusCopyWith<$Res> get screenStatus;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenStatus = null,
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? obscurePassword = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      screenStatus: null == screenStatus
          ? _value.screenStatus
          : screenStatus // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailOrUser,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScreenStatusCopyWith<$Res> get screenStatus {
    return $ScreenStatusCopyWith<$Res>(_value.screenStatus, (value) {
      return _then(_value.copyWith(screenStatus: value) as $Val);
    });
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreenStatus screenStatus,
      FormzSubmissionStatus status,
      EmailOrUser email,
      Password password,
      bool obscurePassword,
      User? user});

  @override
  $ScreenStatusCopyWith<$Res> get screenStatus;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenStatus = null,
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? obscurePassword = null,
    Object? user = freezed,
  }) {
    return _then(_$LoginStateImpl(
      screenStatus: null == screenStatus
          ? _value.screenStatus
          : screenStatus // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailOrUser,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl extends _LoginState {
  _$LoginStateImpl(
      {this.screenStatus = const ScreenStatus.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.email = const EmailOrUser.pure(),
      this.password = const Password.pure(),
      this.obscurePassword = true,
      this.user})
      : super._();

  @override
  @JsonKey()
  final ScreenStatus screenStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final EmailOrUser email;
  @override
  @JsonKey()
  final Password password;
  @override
  @JsonKey()
  final bool obscurePassword;
  @override
  final User? user;

  @override
  String toString() {
    return 'LoginState(screenStatus: $screenStatus, status: $status, email: $email, password: $password, obscurePassword: $obscurePassword, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.screenStatus, screenStatus) ||
                other.screenStatus == screenStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screenStatus, status, email,
      password, obscurePassword, user);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  factory _LoginState(
      {final ScreenStatus screenStatus,
      final FormzSubmissionStatus status,
      final EmailOrUser email,
      final Password password,
      final bool obscurePassword,
      final User? user}) = _$LoginStateImpl;
  _LoginState._() : super._();

  @override
  ScreenStatus get screenStatus;
  @override
  FormzSubmissionStatus get status;
  @override
  EmailOrUser get email;
  @override
  Password get password;
  @override
  bool get obscurePassword;
  @override
  User? get user;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
