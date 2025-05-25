// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterState {
  ScreenStatus get screenStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  EmailOrUser get email => throw _privateConstructorUsedError;
  Name get firstName => throw _privateConstructorUsedError;
  Name get lastName => throw _privateConstructorUsedError;
  Name get username => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  bool get obscurePassword => throw _privateConstructorUsedError;
  bool get obscureConfirmPassword => throw _privateConstructorUsedError;
  bool get needsEmailVerification => throw _privateConstructorUsedError;
  bool get emailAlreadyExists => throw _privateConstructorUsedError;
  bool get usernameAlreadyExists => throw _privateConstructorUsedError;
  bool get passwordTooShort => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {ScreenStatus screenStatus,
      FormzSubmissionStatus status,
      EmailOrUser email,
      Name firstName,
      Name lastName,
      Name username,
      Password password,
      Password confirmPassword,
      bool obscurePassword,
      bool obscureConfirmPassword,
      bool needsEmailVerification,
      bool emailAlreadyExists,
      bool usernameAlreadyExists,
      bool passwordTooShort,
      User? user});

  $ScreenStatusCopyWith<$Res> get screenStatus;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenStatus = null,
    Object? status = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? obscurePassword = null,
    Object? obscureConfirmPassword = null,
    Object? needsEmailVerification = null,
    Object? emailAlreadyExists = null,
    Object? usernameAlreadyExists = null,
    Object? passwordTooShort = null,
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
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Name,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Name,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Name,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      obscureConfirmPassword: null == obscureConfirmPassword
          ? _value.obscureConfirmPassword
          : obscureConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      needsEmailVerification: null == needsEmailVerification
          ? _value.needsEmailVerification
          : needsEmailVerification // ignore: cast_nullable_to_non_nullable
              as bool,
      emailAlreadyExists: null == emailAlreadyExists
          ? _value.emailAlreadyExists
          : emailAlreadyExists // ignore: cast_nullable_to_non_nullable
              as bool,
      usernameAlreadyExists: null == usernameAlreadyExists
          ? _value.usernameAlreadyExists
          : usernameAlreadyExists // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordTooShort: null == passwordTooShort
          ? _value.passwordTooShort
          : passwordTooShort // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScreenStatusCopyWith<$Res> get screenStatus {
    return $ScreenStatusCopyWith<$Res>(_value.screenStatus, (value) {
      return _then(_value.copyWith(screenStatus: value) as $Val);
    });
  }

  /// Create a copy of RegisterState
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
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
          _$RegisterStateImpl value, $Res Function(_$RegisterStateImpl) then) =
      __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreenStatus screenStatus,
      FormzSubmissionStatus status,
      EmailOrUser email,
      Name firstName,
      Name lastName,
      Name username,
      Password password,
      Password confirmPassword,
      bool obscurePassword,
      bool obscureConfirmPassword,
      bool needsEmailVerification,
      bool emailAlreadyExists,
      bool usernameAlreadyExists,
      bool passwordTooShort,
      User? user});

  @override
  $ScreenStatusCopyWith<$Res> get screenStatus;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
      _$RegisterStateImpl _value, $Res Function(_$RegisterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenStatus = null,
    Object? status = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? obscurePassword = null,
    Object? obscureConfirmPassword = null,
    Object? needsEmailVerification = null,
    Object? emailAlreadyExists = null,
    Object? usernameAlreadyExists = null,
    Object? passwordTooShort = null,
    Object? user = freezed,
  }) {
    return _then(_$RegisterStateImpl(
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
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Name,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Name,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Name,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      obscureConfirmPassword: null == obscureConfirmPassword
          ? _value.obscureConfirmPassword
          : obscureConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      needsEmailVerification: null == needsEmailVerification
          ? _value.needsEmailVerification
          : needsEmailVerification // ignore: cast_nullable_to_non_nullable
              as bool,
      emailAlreadyExists: null == emailAlreadyExists
          ? _value.emailAlreadyExists
          : emailAlreadyExists // ignore: cast_nullable_to_non_nullable
              as bool,
      usernameAlreadyExists: null == usernameAlreadyExists
          ? _value.usernameAlreadyExists
          : usernameAlreadyExists // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordTooShort: null == passwordTooShort
          ? _value.passwordTooShort
          : passwordTooShort // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$RegisterStateImpl extends _RegisterState {
  _$RegisterStateImpl(
      {this.screenStatus = const ScreenStatus.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.email = const EmailOrUser.pure(),
      this.firstName = const Name.pure(),
      this.lastName = const Name.pure(),
      this.username = const Name.pure(),
      this.password = const Password.pure(),
      this.confirmPassword = const Password.pure(),
      this.obscurePassword = true,
      this.obscureConfirmPassword = true,
      this.needsEmailVerification = false,
      this.emailAlreadyExists = false,
      this.usernameAlreadyExists = false,
      this.passwordTooShort = false,
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
  final Name firstName;
  @override
  @JsonKey()
  final Name lastName;
  @override
  @JsonKey()
  final Name username;
  @override
  @JsonKey()
  final Password password;
  @override
  @JsonKey()
  final Password confirmPassword;
  @override
  @JsonKey()
  final bool obscurePassword;
  @override
  @JsonKey()
  final bool obscureConfirmPassword;
  @override
  @JsonKey()
  final bool needsEmailVerification;
  @override
  @JsonKey()
  final bool emailAlreadyExists;
  @override
  @JsonKey()
  final bool usernameAlreadyExists;
  @override
  @JsonKey()
  final bool passwordTooShort;
  @override
  final User? user;

  @override
  String toString() {
    return 'RegisterState(screenStatus: $screenStatus, status: $status, email: $email, firstName: $firstName, lastName: $lastName, username: $username, password: $password, confirmPassword: $confirmPassword, obscurePassword: $obscurePassword, obscureConfirmPassword: $obscureConfirmPassword, needsEmailVerification: $needsEmailVerification, emailAlreadyExists: $emailAlreadyExists, usernameAlreadyExists: $usernameAlreadyExists, passwordTooShort: $passwordTooShort, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.screenStatus, screenStatus) ||
                other.screenStatus == screenStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.obscureConfirmPassword, obscureConfirmPassword) ||
                other.obscureConfirmPassword == obscureConfirmPassword) &&
            (identical(other.needsEmailVerification, needsEmailVerification) ||
                other.needsEmailVerification == needsEmailVerification) &&
            (identical(other.emailAlreadyExists, emailAlreadyExists) ||
                other.emailAlreadyExists == emailAlreadyExists) &&
            (identical(other.usernameAlreadyExists, usernameAlreadyExists) ||
                other.usernameAlreadyExists == usernameAlreadyExists) &&
            (identical(other.passwordTooShort, passwordTooShort) ||
                other.passwordTooShort == passwordTooShort) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      screenStatus,
      status,
      email,
      firstName,
      lastName,
      username,
      password,
      confirmPassword,
      obscurePassword,
      obscureConfirmPassword,
      needsEmailVerification,
      emailAlreadyExists,
      usernameAlreadyExists,
      passwordTooShort,
      user);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState extends RegisterState {
  factory _RegisterState(
      {final ScreenStatus screenStatus,
      final FormzSubmissionStatus status,
      final EmailOrUser email,
      final Name firstName,
      final Name lastName,
      final Name username,
      final Password password,
      final Password confirmPassword,
      final bool obscurePassword,
      final bool obscureConfirmPassword,
      final bool needsEmailVerification,
      final bool emailAlreadyExists,
      final bool usernameAlreadyExists,
      final bool passwordTooShort,
      final User? user}) = _$RegisterStateImpl;
  _RegisterState._() : super._();

  @override
  ScreenStatus get screenStatus;
  @override
  FormzSubmissionStatus get status;
  @override
  EmailOrUser get email;
  @override
  Name get firstName;
  @override
  Name get lastName;
  @override
  Name get username;
  @override
  Password get password;
  @override
  Password get confirmPassword;
  @override
  bool get obscurePassword;
  @override
  bool get obscureConfirmPassword;
  @override
  bool get needsEmailVerification;
  @override
  bool get emailAlreadyExists;
  @override
  bool get usernameAlreadyExists;
  @override
  bool get passwordTooShort;
  @override
  User? get user;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
