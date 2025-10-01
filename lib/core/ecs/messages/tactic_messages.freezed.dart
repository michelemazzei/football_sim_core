// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactic_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TacticMessage {

 EcsEntity get receiver; bool get cancelled; bool get requiresAck; OnAck? get onAck; Zone get targetZone;
/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TacticMessageCopyWith<TacticMessage> get copyWith => _$TacticMessageCopyWithImpl<TacticMessage>(this as TacticMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticMessage&&(identical(other.receiver, receiver) || other.receiver == receiver)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled)&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck)&&(identical(other.targetZone, targetZone) || other.targetZone == targetZone));
}


@override
int get hashCode => Object.hash(runtimeType,receiver,cancelled,requiresAck,onAck,targetZone);

@override
String toString() {
  return 'TacticMessage(receiver: $receiver, cancelled: $cancelled, requiresAck: $requiresAck, onAck: $onAck, targetZone: $targetZone)';
}


}

/// @nodoc
abstract mixin class $TacticMessageCopyWith<$Res>  {
  factory $TacticMessageCopyWith(TacticMessage value, $Res Function(TacticMessage) _then) = _$TacticMessageCopyWithImpl;
@useResult
$Res call({
 EcsEntity receiver, bool cancelled, bool requiresAck, OnAck? onAck, Zone targetZone
});


$ZoneCopyWith<$Res> get targetZone;

}
/// @nodoc
class _$TacticMessageCopyWithImpl<$Res>
    implements $TacticMessageCopyWith<$Res> {
  _$TacticMessageCopyWithImpl(this._self, this._then);

  final TacticMessage _self;
  final $Res Function(TacticMessage) _then;

/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiver = null,Object? cancelled = null,Object? requiresAck = null,Object? onAck = freezed,Object? targetZone = null,}) {
  return _then(_self.copyWith(
receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as OnAck?,targetZone: null == targetZone ? _self.targetZone : targetZone // ignore: cast_nullable_to_non_nullable
as Zone,
  ));
}
/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneCopyWith<$Res> get targetZone {
  
  return $ZoneCopyWith<$Res>(_self.targetZone, (value) {
    return _then(_self.copyWith(targetZone: value));
  });
}
}


/// Adds pattern-matching-related methods to [TacticMessage].
extension TacticMessagePatterns on TacticMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TacticalMoveToZone value)?  moveToZone,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TacticalMoveToZone() when moveToZone != null:
return moveToZone(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TacticalMoveToZone value)  moveToZone,}){
final _that = this;
switch (_that) {
case TacticalMoveToZone():
return moveToZone(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TacticalMoveToZone value)?  moveToZone,}){
final _that = this;
switch (_that) {
case TacticalMoveToZone() when moveToZone != null:
return moveToZone(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck,  Zone targetZone)?  moveToZone,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TacticalMoveToZone() when moveToZone != null:
return moveToZone(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck,_that.targetZone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck,  Zone targetZone)  moveToZone,}) {final _that = this;
switch (_that) {
case TacticalMoveToZone():
return moveToZone(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck,_that.targetZone);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck,  Zone targetZone)?  moveToZone,}) {final _that = this;
switch (_that) {
case TacticalMoveToZone() when moveToZone != null:
return moveToZone(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck,_that.targetZone);case _:
  return null;

}
}

}

/// @nodoc


class TacticalMoveToZone extends TacticMessage {
   TacticalMoveToZone({required this.receiver, this.cancelled = false, this.requiresAck = false, this.onAck, required this.targetZone}): super._();
  

@override final  EcsEntity receiver;
@override@JsonKey() final  bool cancelled;
@override@JsonKey() final  bool requiresAck;
@override final  OnAck? onAck;
@override final  Zone targetZone;

/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TacticalMoveToZoneCopyWith<TacticalMoveToZone> get copyWith => _$TacticalMoveToZoneCopyWithImpl<TacticalMoveToZone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticalMoveToZone&&(identical(other.receiver, receiver) || other.receiver == receiver)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled)&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck)&&(identical(other.targetZone, targetZone) || other.targetZone == targetZone));
}


@override
int get hashCode => Object.hash(runtimeType,receiver,cancelled,requiresAck,onAck,targetZone);

@override
String toString() {
  return 'TacticMessage.moveToZone(receiver: $receiver, cancelled: $cancelled, requiresAck: $requiresAck, onAck: $onAck, targetZone: $targetZone)';
}


}

/// @nodoc
abstract mixin class $TacticalMoveToZoneCopyWith<$Res> implements $TacticMessageCopyWith<$Res> {
  factory $TacticalMoveToZoneCopyWith(TacticalMoveToZone value, $Res Function(TacticalMoveToZone) _then) = _$TacticalMoveToZoneCopyWithImpl;
@override @useResult
$Res call({
 EcsEntity receiver, bool cancelled, bool requiresAck, OnAck? onAck, Zone targetZone
});


@override $ZoneCopyWith<$Res> get targetZone;

}
/// @nodoc
class _$TacticalMoveToZoneCopyWithImpl<$Res>
    implements $TacticalMoveToZoneCopyWith<$Res> {
  _$TacticalMoveToZoneCopyWithImpl(this._self, this._then);

  final TacticalMoveToZone _self;
  final $Res Function(TacticalMoveToZone) _then;

/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiver = null,Object? cancelled = null,Object? requiresAck = null,Object? onAck = freezed,Object? targetZone = null,}) {
  return _then(TacticalMoveToZone(
receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as OnAck?,targetZone: null == targetZone ? _self.targetZone : targetZone // ignore: cast_nullable_to_non_nullable
as Zone,
  ));
}

/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneCopyWith<$Res> get targetZone {
  
  return $ZoneCopyWith<$Res>(_self.targetZone, (value) {
    return _then(_self.copyWith(targetZone: value));
  });
}
}

// dart format on
