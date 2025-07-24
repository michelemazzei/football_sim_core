// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'telegram.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Telegram {

 MessageReceiver get sender; MessageReceiver get receiver; Messages get message; String? get additionalInfo; DateTime? get messageTime;
/// Create a copy of Telegram
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TelegramCopyWith<Telegram> get copyWith => _$TelegramCopyWithImpl<Telegram>(this as Telegram, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Telegram&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver)&&(identical(other.message, message) || other.message == message)&&(identical(other.additionalInfo, additionalInfo) || other.additionalInfo == additionalInfo)&&(identical(other.messageTime, messageTime) || other.messageTime == messageTime));
}


@override
int get hashCode => Object.hash(runtimeType,sender,receiver,message,additionalInfo,messageTime);



}

/// @nodoc
abstract mixin class $TelegramCopyWith<$Res>  {
  factory $TelegramCopyWith(Telegram value, $Res Function(Telegram) _then) = _$TelegramCopyWithImpl;
@useResult
$Res call({
 MessageReceiver sender, MessageReceiver receiver, Messages message, String? additionalInfo, DateTime? messageTime
});


$MessagesCopyWith<$Res> get message;

}
/// @nodoc
class _$TelegramCopyWithImpl<$Res>
    implements $TelegramCopyWith<$Res> {
  _$TelegramCopyWithImpl(this._self, this._then);

  final Telegram _self;
  final $Res Function(Telegram) _then;

/// Create a copy of Telegram
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sender = null,Object? receiver = null,Object? message = null,Object? additionalInfo = freezed,Object? messageTime = freezed,}) {
  return _then(_self.copyWith(
sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageReceiver,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as MessageReceiver,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Messages,additionalInfo: freezed == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as String?,messageTime: freezed == messageTime ? _self.messageTime : messageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Telegram
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessagesCopyWith<$Res> get message {
  
  return $MessagesCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [Telegram].
extension TelegramPatterns on Telegram {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Telegram value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Telegram() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Telegram value)  $default,){
final _that = this;
switch (_that) {
case _Telegram():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Telegram value)?  $default,){
final _that = this;
switch (_that) {
case _Telegram() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MessageReceiver sender,  MessageReceiver receiver,  Messages message,  String? additionalInfo,  DateTime? messageTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Telegram() when $default != null:
return $default(_that.sender,_that.receiver,_that.message,_that.additionalInfo,_that.messageTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MessageReceiver sender,  MessageReceiver receiver,  Messages message,  String? additionalInfo,  DateTime? messageTime)  $default,) {final _that = this;
switch (_that) {
case _Telegram():
return $default(_that.sender,_that.receiver,_that.message,_that.additionalInfo,_that.messageTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MessageReceiver sender,  MessageReceiver receiver,  Messages message,  String? additionalInfo,  DateTime? messageTime)?  $default,) {final _that = this;
switch (_that) {
case _Telegram() when $default != null:
return $default(_that.sender,_that.receiver,_that.message,_that.additionalInfo,_that.messageTime);case _:
  return null;

}
}

}

/// @nodoc


class _Telegram extends Telegram {
   _Telegram({required this.sender, required this.receiver, required this.message, this.additionalInfo, this.messageTime}): super._();
  

@override final  MessageReceiver sender;
@override final  MessageReceiver receiver;
@override final  Messages message;
@override final  String? additionalInfo;
@override final  DateTime? messageTime;

/// Create a copy of Telegram
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TelegramCopyWith<_Telegram> get copyWith => __$TelegramCopyWithImpl<_Telegram>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Telegram&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver)&&(identical(other.message, message) || other.message == message)&&(identical(other.additionalInfo, additionalInfo) || other.additionalInfo == additionalInfo)&&(identical(other.messageTime, messageTime) || other.messageTime == messageTime));
}


@override
int get hashCode => Object.hash(runtimeType,sender,receiver,message,additionalInfo,messageTime);



}

/// @nodoc
abstract mixin class _$TelegramCopyWith<$Res> implements $TelegramCopyWith<$Res> {
  factory _$TelegramCopyWith(_Telegram value, $Res Function(_Telegram) _then) = __$TelegramCopyWithImpl;
@override @useResult
$Res call({
 MessageReceiver sender, MessageReceiver receiver, Messages message, String? additionalInfo, DateTime? messageTime
});


@override $MessagesCopyWith<$Res> get message;

}
/// @nodoc
class __$TelegramCopyWithImpl<$Res>
    implements _$TelegramCopyWith<$Res> {
  __$TelegramCopyWithImpl(this._self, this._then);

  final _Telegram _self;
  final $Res Function(_Telegram) _then;

/// Create a copy of Telegram
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sender = null,Object? receiver = null,Object? message = null,Object? additionalInfo = freezed,Object? messageTime = freezed,}) {
  return _then(_Telegram(
sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageReceiver,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as MessageReceiver,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Messages,additionalInfo: freezed == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as String?,messageTime: freezed == messageTime ? _self.messageTime : messageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Telegram
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessagesCopyWith<$Res> get message {
  
  return $MessagesCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

// dart format on
