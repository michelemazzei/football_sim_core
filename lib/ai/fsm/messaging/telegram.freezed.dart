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
mixin _$TelegramUnion {

 String get id; MessageSender? get sender; MessageReceiver get receiver; DateTime? get timeOut; Message get message; bool get cancelled; set cancelled(bool value); String? get additionalInfo; DateTime? get messageTime;
/// Create a copy of TelegramUnion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TelegramUnionCopyWith<TelegramUnion> get copyWith => _$TelegramUnionCopyWithImpl<TelegramUnion>(this as TelegramUnion, _$identity);







}

/// @nodoc
abstract mixin class $TelegramUnionCopyWith<$Res>  {
  factory $TelegramUnionCopyWith(TelegramUnion value, $Res Function(TelegramUnion) _then) = _$TelegramUnionCopyWithImpl;
@useResult
$Res call({
 String id, MessageSender? sender, MessageReceiver receiver, DateTime? timeOut, Message message, bool cancelled, String? additionalInfo, DateTime? messageTime
});




}
/// @nodoc
class _$TelegramUnionCopyWithImpl<$Res>
    implements $TelegramUnionCopyWith<$Res> {
  _$TelegramUnionCopyWithImpl(this._self, this._then);

  final TelegramUnion _self;
  final $Res Function(TelegramUnion) _then;

/// Create a copy of TelegramUnion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sender = freezed,Object? receiver = null,Object? timeOut = freezed,Object? message = null,Object? cancelled = null,Object? additionalInfo = freezed,Object? messageTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageSender?,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as MessageReceiver,timeOut: freezed == timeOut ? _self.timeOut : timeOut // ignore: cast_nullable_to_non_nullable
as DateTime?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,additionalInfo: freezed == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as String?,messageTime: freezed == messageTime ? _self.messageTime : messageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TelegramUnion].
extension TelegramUnionPatterns on TelegramUnion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TelegramUnion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TelegramUnion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TelegramUnion value)  $default,){
final _that = this;
switch (_that) {
case _TelegramUnion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TelegramUnion value)?  $default,){
final _that = this;
switch (_that) {
case _TelegramUnion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MessageSender? sender,  MessageReceiver receiver,  DateTime? timeOut,  Message message,  bool cancelled,  String? additionalInfo,  DateTime? messageTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TelegramUnion() when $default != null:
return $default(_that.id,_that.sender,_that.receiver,_that.timeOut,_that.message,_that.cancelled,_that.additionalInfo,_that.messageTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MessageSender? sender,  MessageReceiver receiver,  DateTime? timeOut,  Message message,  bool cancelled,  String? additionalInfo,  DateTime? messageTime)  $default,) {final _that = this;
switch (_that) {
case _TelegramUnion():
return $default(_that.id,_that.sender,_that.receiver,_that.timeOut,_that.message,_that.cancelled,_that.additionalInfo,_that.messageTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MessageSender? sender,  MessageReceiver receiver,  DateTime? timeOut,  Message message,  bool cancelled,  String? additionalInfo,  DateTime? messageTime)?  $default,) {final _that = this;
switch (_that) {
case _TelegramUnion() when $default != null:
return $default(_that.id,_that.sender,_that.receiver,_that.timeOut,_that.message,_that.cancelled,_that.additionalInfo,_that.messageTime);case _:
  return null;

}
}

}

/// @nodoc


class _TelegramUnion extends TelegramUnion {
   _TelegramUnion({required this.id, this.sender, required this.receiver, this.timeOut, required this.message, this.cancelled = false, this.additionalInfo, this.messageTime}): super._();
  

@override final  String id;
@override final  MessageSender? sender;
@override final  MessageReceiver receiver;
@override final  DateTime? timeOut;
@override final  Message message;
@override@JsonKey()  bool cancelled;
@override final  String? additionalInfo;
@override final  DateTime? messageTime;

/// Create a copy of TelegramUnion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TelegramUnionCopyWith<_TelegramUnion> get copyWith => __$TelegramUnionCopyWithImpl<_TelegramUnion>(this, _$identity);







}

/// @nodoc
abstract mixin class _$TelegramUnionCopyWith<$Res> implements $TelegramUnionCopyWith<$Res> {
  factory _$TelegramUnionCopyWith(_TelegramUnion value, $Res Function(_TelegramUnion) _then) = __$TelegramUnionCopyWithImpl;
@override @useResult
$Res call({
 String id, MessageSender? sender, MessageReceiver receiver, DateTime? timeOut, Message message, bool cancelled, String? additionalInfo, DateTime? messageTime
});




}
/// @nodoc
class __$TelegramUnionCopyWithImpl<$Res>
    implements _$TelegramUnionCopyWith<$Res> {
  __$TelegramUnionCopyWithImpl(this._self, this._then);

  final _TelegramUnion _self;
  final $Res Function(_TelegramUnion) _then;

/// Create a copy of TelegramUnion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sender = freezed,Object? receiver = null,Object? timeOut = freezed,Object? message = null,Object? cancelled = null,Object? additionalInfo = freezed,Object? messageTime = freezed,}) {
  return _then(_TelegramUnion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageSender?,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as MessageReceiver,timeOut: freezed == timeOut ? _self.timeOut : timeOut // ignore: cast_nullable_to_non_nullable
as DateTime?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,additionalInfo: freezed == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as String?,messageTime: freezed == messageTime ? _self.messageTime : messageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
