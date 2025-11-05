// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_phone_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthPhoneState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthPhoneState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthPhoneState()';
}


}

/// @nodoc
class $AuthPhoneStateCopyWith<$Res>  {
$AuthPhoneStateCopyWith(AuthPhoneState _, $Res Function(AuthPhoneState) __);
}


/// Adds pattern-matching-related methods to [AuthPhoneState].
extension AuthPhoneStatePatterns on AuthPhoneState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Challenging value)?  challenging,TResult Function( _Challenged value)?  challenged,TResult Function( _Verifying value)?  verifying,TResult Function( _Verified value)?  verified,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Challenging() when challenging != null:
return challenging(_that);case _Challenged() when challenged != null:
return challenged(_that);case _Verifying() when verifying != null:
return verifying(_that);case _Verified() when verified != null:
return verified(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Challenging value)  challenging,required TResult Function( _Challenged value)  challenged,required TResult Function( _Verifying value)  verifying,required TResult Function( _Verified value)  verified,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Challenging():
return challenging(_that);case _Challenged():
return challenged(_that);case _Verifying():
return verifying(_that);case _Verified():
return verified(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Challenging value)?  challenging,TResult? Function( _Challenged value)?  challenged,TResult? Function( _Verifying value)?  verifying,TResult? Function( _Verified value)?  verified,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Challenging() when challenging != null:
return challenging(_that);case _Challenged() when challenged != null:
return challenged(_that);case _Verifying() when verifying != null:
return verifying(_that);case _Verified() when verified != null:
return verified(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  challenging,TResult Function( String? error,  Challenge? challenge)?  challenged,TResult Function()?  verifying,TResult Function( String? error,  AuthToken? authToken)?  verified,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Challenging() when challenging != null:
return challenging();case _Challenged() when challenged != null:
return challenged(_that.error,_that.challenge);case _Verifying() when verifying != null:
return verifying();case _Verified() when verified != null:
return verified(_that.error,_that.authToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  challenging,required TResult Function( String? error,  Challenge? challenge)  challenged,required TResult Function()  verifying,required TResult Function( String? error,  AuthToken? authToken)  verified,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Challenging():
return challenging();case _Challenged():
return challenged(_that.error,_that.challenge);case _Verifying():
return verifying();case _Verified():
return verified(_that.error,_that.authToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  challenging,TResult? Function( String? error,  Challenge? challenge)?  challenged,TResult? Function()?  verifying,TResult? Function( String? error,  AuthToken? authToken)?  verified,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Challenging() when challenging != null:
return challenging();case _Challenged() when challenged != null:
return challenged(_that.error,_that.challenge);case _Verifying() when verifying != null:
return verifying();case _Verified() when verified != null:
return verified(_that.error,_that.authToken);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthPhoneState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthPhoneState.initial()';
}


}




/// @nodoc


class _Challenging implements AuthPhoneState {
  const _Challenging();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Challenging);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthPhoneState.challenging()';
}


}




/// @nodoc


class _Challenged implements AuthPhoneState {
  const _Challenged({required this.error, required this.challenge});
  

 final  String? error;
 final  Challenge? challenge;

/// Create a copy of AuthPhoneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengedCopyWith<_Challenged> get copyWith => __$ChallengedCopyWithImpl<_Challenged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Challenged&&(identical(other.error, error) || other.error == error)&&(identical(other.challenge, challenge) || other.challenge == challenge));
}


@override
int get hashCode => Object.hash(runtimeType,error,challenge);

@override
String toString() {
  return 'AuthPhoneState.challenged(error: $error, challenge: $challenge)';
}


}

/// @nodoc
abstract mixin class _$ChallengedCopyWith<$Res> implements $AuthPhoneStateCopyWith<$Res> {
  factory _$ChallengedCopyWith(_Challenged value, $Res Function(_Challenged) _then) = __$ChallengedCopyWithImpl;
@useResult
$Res call({
 String? error, Challenge? challenge
});




}
/// @nodoc
class __$ChallengedCopyWithImpl<$Res>
    implements _$ChallengedCopyWith<$Res> {
  __$ChallengedCopyWithImpl(this._self, this._then);

  final _Challenged _self;
  final $Res Function(_Challenged) _then;

/// Create a copy of AuthPhoneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? challenge = freezed,}) {
  return _then(_Challenged(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,challenge: freezed == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as Challenge?,
  ));
}


}

/// @nodoc


class _Verifying implements AuthPhoneState {
  const _Verifying();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Verifying);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthPhoneState.verifying()';
}


}




/// @nodoc


class _Verified implements AuthPhoneState {
  const _Verified({required this.error, required this.authToken});
  

 final  String? error;
 final  AuthToken? authToken;

/// Create a copy of AuthPhoneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifiedCopyWith<_Verified> get copyWith => __$VerifiedCopyWithImpl<_Verified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Verified&&(identical(other.error, error) || other.error == error)&&(identical(other.authToken, authToken) || other.authToken == authToken));
}


@override
int get hashCode => Object.hash(runtimeType,error,authToken);

@override
String toString() {
  return 'AuthPhoneState.verified(error: $error, authToken: $authToken)';
}


}

/// @nodoc
abstract mixin class _$VerifiedCopyWith<$Res> implements $AuthPhoneStateCopyWith<$Res> {
  factory _$VerifiedCopyWith(_Verified value, $Res Function(_Verified) _then) = __$VerifiedCopyWithImpl;
@useResult
$Res call({
 String? error, AuthToken? authToken
});




}
/// @nodoc
class __$VerifiedCopyWithImpl<$Res>
    implements _$VerifiedCopyWith<$Res> {
  __$VerifiedCopyWithImpl(this._self, this._then);

  final _Verified _self;
  final $Res Function(_Verified) _then;

/// Create a copy of AuthPhoneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? authToken = freezed,}) {
  return _then(_Verified(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as AuthToken?,
  ));
}


}

// dart format on
