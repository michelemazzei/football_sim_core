// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerUnion {

 OnAck? get onAck; bool get cancelled; set cancelled(bool value); bool get requiresAck; EcsEntity get receiver;
/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerUnionCopyWith<PlayerUnion> get copyWith => _$PlayerUnionCopyWithImpl<PlayerUnion>(this as PlayerUnion, _$identity);





@override
String toString() {
  return 'PlayerUnion(onAck: $onAck, cancelled: $cancelled, requiresAck: $requiresAck, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class $PlayerUnionCopyWith<$Res>  {
  factory $PlayerUnionCopyWith(PlayerUnion value, $Res Function(PlayerUnion) _then) = _$PlayerUnionCopyWithImpl;
@useResult
$Res call({
 void Function()? onAck, bool cancelled, bool requiresAck, EcsEntity receiver
});




}
/// @nodoc
class _$PlayerUnionCopyWithImpl<$Res>
    implements $PlayerUnionCopyWith<$Res> {
  _$PlayerUnionCopyWithImpl(this._self, this._then);

  final PlayerUnion _self;
  final $Res Function(PlayerUnion) _then;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onAck = freezed,Object? cancelled = null,Object? requiresAck = null,Object? receiver = null,}) {
  return _then(_self.copyWith(
onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerUnion].
extension PlayerUnionPatterns on PlayerUnion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReceiveBallIntent value)?  receiveBallIntent,TResult Function( PassToNearestTeammate value)?  passToNearestTeammate,TResult Function( MoveToPosition value)?  moveToPosition,TResult Function( MoveToBall value)?  moveToBall,TResult Function( PlaceToKickOff value)?  placeToKickOff,TResult Function( ReceiveBall value)?  receiveBall,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReceiveBallIntent() when receiveBallIntent != null:
return receiveBallIntent(_that);case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate(_that);case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that);case MoveToBall() when moveToBall != null:
return moveToBall(_that);case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff(_that);case ReceiveBall() when receiveBall != null:
return receiveBall(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReceiveBallIntent value)  receiveBallIntent,required TResult Function( PassToNearestTeammate value)  passToNearestTeammate,required TResult Function( MoveToPosition value)  moveToPosition,required TResult Function( MoveToBall value)  moveToBall,required TResult Function( PlaceToKickOff value)  placeToKickOff,required TResult Function( ReceiveBall value)  receiveBall,}){
final _that = this;
switch (_that) {
case ReceiveBallIntent():
return receiveBallIntent(_that);case PassToNearestTeammate():
return passToNearestTeammate(_that);case MoveToPosition():
return moveToPosition(_that);case MoveToBall():
return moveToBall(_that);case PlaceToKickOff():
return placeToKickOff(_that);case ReceiveBall():
return receiveBall(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReceiveBallIntent value)?  receiveBallIntent,TResult? Function( PassToNearestTeammate value)?  passToNearestTeammate,TResult? Function( MoveToPosition value)?  moveToPosition,TResult? Function( MoveToBall value)?  moveToBall,TResult? Function( PlaceToKickOff value)?  placeToKickOff,TResult? Function( ReceiveBall value)?  receiveBall,}){
final _that = this;
switch (_that) {
case ReceiveBallIntent() when receiveBallIntent != null:
return receiveBallIntent(_that);case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate(_that);case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that);case MoveToBall() when moveToBall != null:
return moveToBall(_that);case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff(_that);case ReceiveBall() when receiveBall != null:
return receiveBall(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( OnAck? onAck,  bool cancelled,  bool requiresAck,  EcsEntity receiver,  Vector2 targetPosition)?  receiveBallIntent,TResult Function( bool cancelled,  bool requiresAck,  EcsEntity receiver,  OnAck? onAck)?  passToNearestTeammate,TResult Function( bool cancelled,  Vector2 target,  EcsEntity receiver,  bool requiresAck,  OnAck? onAck)?  moveToPosition,TResult Function( bool cancelled,  EcsEntity receiver,  MovePlayerIntent intent,  bool requiresAck,  OnAck? onAck)?  moveToBall,TResult Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck)?  placeToKickOff,TResult Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck)?  receiveBall,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReceiveBallIntent() when receiveBallIntent != null:
return receiveBallIntent(_that.onAck,_that.cancelled,_that.requiresAck,_that.receiver,_that.targetPosition);case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate(_that.cancelled,_that.requiresAck,_that.receiver,_that.onAck);case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that.cancelled,_that.target,_that.receiver,_that.requiresAck,_that.onAck);case MoveToBall() when moveToBall != null:
return moveToBall(_that.cancelled,_that.receiver,_that.intent,_that.requiresAck,_that.onAck);case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck);case ReceiveBall() when receiveBall != null:
return receiveBall(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( OnAck? onAck,  bool cancelled,  bool requiresAck,  EcsEntity receiver,  Vector2 targetPosition)  receiveBallIntent,required TResult Function( bool cancelled,  bool requiresAck,  EcsEntity receiver,  OnAck? onAck)  passToNearestTeammate,required TResult Function( bool cancelled,  Vector2 target,  EcsEntity receiver,  bool requiresAck,  OnAck? onAck)  moveToPosition,required TResult Function( bool cancelled,  EcsEntity receiver,  MovePlayerIntent intent,  bool requiresAck,  OnAck? onAck)  moveToBall,required TResult Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck)  placeToKickOff,required TResult Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck)  receiveBall,}) {final _that = this;
switch (_that) {
case ReceiveBallIntent():
return receiveBallIntent(_that.onAck,_that.cancelled,_that.requiresAck,_that.receiver,_that.targetPosition);case PassToNearestTeammate():
return passToNearestTeammate(_that.cancelled,_that.requiresAck,_that.receiver,_that.onAck);case MoveToPosition():
return moveToPosition(_that.cancelled,_that.target,_that.receiver,_that.requiresAck,_that.onAck);case MoveToBall():
return moveToBall(_that.cancelled,_that.receiver,_that.intent,_that.requiresAck,_that.onAck);case PlaceToKickOff():
return placeToKickOff(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck);case ReceiveBall():
return receiveBall(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( OnAck? onAck,  bool cancelled,  bool requiresAck,  EcsEntity receiver,  Vector2 targetPosition)?  receiveBallIntent,TResult? Function( bool cancelled,  bool requiresAck,  EcsEntity receiver,  OnAck? onAck)?  passToNearestTeammate,TResult? Function( bool cancelled,  Vector2 target,  EcsEntity receiver,  bool requiresAck,  OnAck? onAck)?  moveToPosition,TResult? Function( bool cancelled,  EcsEntity receiver,  MovePlayerIntent intent,  bool requiresAck,  OnAck? onAck)?  moveToBall,TResult? Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck)?  placeToKickOff,TResult? Function( EcsEntity receiver,  bool cancelled,  bool requiresAck,  OnAck? onAck)?  receiveBall,}) {final _that = this;
switch (_that) {
case ReceiveBallIntent() when receiveBallIntent != null:
return receiveBallIntent(_that.onAck,_that.cancelled,_that.requiresAck,_that.receiver,_that.targetPosition);case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate(_that.cancelled,_that.requiresAck,_that.receiver,_that.onAck);case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that.cancelled,_that.target,_that.receiver,_that.requiresAck,_that.onAck);case MoveToBall() when moveToBall != null:
return moveToBall(_that.cancelled,_that.receiver,_that.intent,_that.requiresAck,_that.onAck);case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck);case ReceiveBall() when receiveBall != null:
return receiveBall(_that.receiver,_that.cancelled,_that.requiresAck,_that.onAck);case _:
  return null;

}
}

}

/// @nodoc


class ReceiveBallIntent extends PlayerUnion {
   ReceiveBallIntent({this.onAck, this.cancelled = false, this.requiresAck = false, required this.receiver, required this.targetPosition}): super._();
  

@override  OnAck? onAck;
@override@JsonKey()  bool cancelled;
@override@JsonKey() final  bool requiresAck;
@override final  EcsEntity receiver;
 final  Vector2 targetPosition;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveBallIntentCopyWith<ReceiveBallIntent> get copyWith => _$ReceiveBallIntentCopyWithImpl<ReceiveBallIntent>(this, _$identity);





@override
String toString() {
  return 'PlayerUnion.receiveBallIntent(onAck: $onAck, cancelled: $cancelled, requiresAck: $requiresAck, receiver: $receiver, targetPosition: $targetPosition)';
}


}

/// @nodoc
abstract mixin class $ReceiveBallIntentCopyWith<$Res> implements $PlayerUnionCopyWith<$Res> {
  factory $ReceiveBallIntentCopyWith(ReceiveBallIntent value, $Res Function(ReceiveBallIntent) _then) = _$ReceiveBallIntentCopyWithImpl;
@override @useResult
$Res call({
 OnAck? onAck, bool cancelled, bool requiresAck, EcsEntity receiver, Vector2 targetPosition
});




}
/// @nodoc
class _$ReceiveBallIntentCopyWithImpl<$Res>
    implements $ReceiveBallIntentCopyWith<$Res> {
  _$ReceiveBallIntentCopyWithImpl(this._self, this._then);

  final ReceiveBallIntent _self;
  final $Res Function(ReceiveBallIntent) _then;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onAck = freezed,Object? cancelled = null,Object? requiresAck = null,Object? receiver = null,Object? targetPosition = null,}) {
  return _then(ReceiveBallIntent(
onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as OnAck?,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,targetPosition: null == targetPosition ? _self.targetPosition : targetPosition // ignore: cast_nullable_to_non_nullable
as Vector2,
  ));
}


}

/// @nodoc


class PassToNearestTeammate extends PlayerUnion {
   PassToNearestTeammate({this.cancelled = false, this.requiresAck = false, required this.receiver, this.onAck}): super._();
  

@override@JsonKey()  bool cancelled;
@override@JsonKey() final  bool requiresAck;
@override final  EcsEntity receiver;
@override final  OnAck? onAck;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassToNearestTeammateCopyWith<PassToNearestTeammate> get copyWith => _$PassToNearestTeammateCopyWithImpl<PassToNearestTeammate>(this, _$identity);





@override
String toString() {
  return 'PlayerUnion.passToNearestTeammate(cancelled: $cancelled, requiresAck: $requiresAck, receiver: $receiver, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $PassToNearestTeammateCopyWith<$Res> implements $PlayerUnionCopyWith<$Res> {
  factory $PassToNearestTeammateCopyWith(PassToNearestTeammate value, $Res Function(PassToNearestTeammate) _then) = _$PassToNearestTeammateCopyWithImpl;
@override @useResult
$Res call({
 bool cancelled, bool requiresAck, EcsEntity receiver, OnAck? onAck
});




}
/// @nodoc
class _$PassToNearestTeammateCopyWithImpl<$Res>
    implements $PassToNearestTeammateCopyWith<$Res> {
  _$PassToNearestTeammateCopyWithImpl(this._self, this._then);

  final PassToNearestTeammate _self;
  final $Res Function(PassToNearestTeammate) _then;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cancelled = null,Object? requiresAck = null,Object? receiver = null,Object? onAck = freezed,}) {
  return _then(PassToNearestTeammate(
cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as OnAck?,
  ));
}


}

/// @nodoc


class MoveToPosition extends PlayerUnion {
   MoveToPosition({this.cancelled = false, required this.target, required this.receiver, this.requiresAck = false, this.onAck}): super._();
  

@override@JsonKey()  bool cancelled;
 final  Vector2 target;
@override final  EcsEntity receiver;
@override@JsonKey() final  bool requiresAck;
@override final  OnAck? onAck;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveToPositionCopyWith<MoveToPosition> get copyWith => _$MoveToPositionCopyWithImpl<MoveToPosition>(this, _$identity);





@override
String toString() {
  return 'PlayerUnion.moveToPosition(cancelled: $cancelled, target: $target, receiver: $receiver, requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $MoveToPositionCopyWith<$Res> implements $PlayerUnionCopyWith<$Res> {
  factory $MoveToPositionCopyWith(MoveToPosition value, $Res Function(MoveToPosition) _then) = _$MoveToPositionCopyWithImpl;
@override @useResult
$Res call({
 bool cancelled, Vector2 target, EcsEntity receiver, bool requiresAck, OnAck? onAck
});




}
/// @nodoc
class _$MoveToPositionCopyWithImpl<$Res>
    implements $MoveToPositionCopyWith<$Res> {
  _$MoveToPositionCopyWithImpl(this._self, this._then);

  final MoveToPosition _self;
  final $Res Function(MoveToPosition) _then;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cancelled = null,Object? target = null,Object? receiver = null,Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(MoveToPosition(
cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as Vector2,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as OnAck?,
  ));
}


}

/// @nodoc


class MoveToBall extends PlayerUnion {
   MoveToBall({this.cancelled = false, required this.receiver, required this.intent, this.requiresAck = false, this.onAck}): super._();
  

@override@JsonKey()  bool cancelled;
@override final  EcsEntity receiver;
 final  MovePlayerIntent intent;
@override@JsonKey() final  bool requiresAck;
@override final  OnAck? onAck;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveToBallCopyWith<MoveToBall> get copyWith => _$MoveToBallCopyWithImpl<MoveToBall>(this, _$identity);





@override
String toString() {
  return 'PlayerUnion.moveToBall(cancelled: $cancelled, receiver: $receiver, intent: $intent, requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $MoveToBallCopyWith<$Res> implements $PlayerUnionCopyWith<$Res> {
  factory $MoveToBallCopyWith(MoveToBall value, $Res Function(MoveToBall) _then) = _$MoveToBallCopyWithImpl;
@override @useResult
$Res call({
 bool cancelled, EcsEntity receiver, MovePlayerIntent intent, bool requiresAck, OnAck? onAck
});


$MovePlayerIntentCopyWith<$Res> get intent;

}
/// @nodoc
class _$MoveToBallCopyWithImpl<$Res>
    implements $MoveToBallCopyWith<$Res> {
  _$MoveToBallCopyWithImpl(this._self, this._then);

  final MoveToBall _self;
  final $Res Function(MoveToBall) _then;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cancelled = null,Object? receiver = null,Object? intent = null,Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(MoveToBall(
cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as MovePlayerIntent,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as OnAck?,
  ));
}

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovePlayerIntentCopyWith<$Res> get intent {
  
  return $MovePlayerIntentCopyWith<$Res>(_self.intent, (value) {
    return _then(_self.copyWith(intent: value));
  });
}
}

/// @nodoc


class PlaceToKickOff extends PlayerUnion {
   PlaceToKickOff({required this.receiver, this.cancelled = false, this.requiresAck = false, this.onAck}): super._();
  

@override final  EcsEntity receiver;
@override@JsonKey()  bool cancelled;
@override@JsonKey() final  bool requiresAck;
@override final  OnAck? onAck;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceToKickOffCopyWith<PlaceToKickOff> get copyWith => _$PlaceToKickOffCopyWithImpl<PlaceToKickOff>(this, _$identity);





@override
String toString() {
  return 'PlayerUnion.placeToKickOff(receiver: $receiver, cancelled: $cancelled, requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $PlaceToKickOffCopyWith<$Res> implements $PlayerUnionCopyWith<$Res> {
  factory $PlaceToKickOffCopyWith(PlaceToKickOff value, $Res Function(PlaceToKickOff) _then) = _$PlaceToKickOffCopyWithImpl;
@override @useResult
$Res call({
 EcsEntity receiver, bool cancelled, bool requiresAck, OnAck? onAck
});




}
/// @nodoc
class _$PlaceToKickOffCopyWithImpl<$Res>
    implements $PlaceToKickOffCopyWith<$Res> {
  _$PlaceToKickOffCopyWithImpl(this._self, this._then);

  final PlaceToKickOff _self;
  final $Res Function(PlaceToKickOff) _then;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiver = null,Object? cancelled = null,Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(PlaceToKickOff(
receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as OnAck?,
  ));
}


}

/// @nodoc


class ReceiveBall extends PlayerUnion {
   ReceiveBall({required this.receiver, this.cancelled = false, this.requiresAck = false, this.onAck}): super._();
  

@override final  EcsEntity receiver;
@override@JsonKey()  bool cancelled;
@override@JsonKey() final  bool requiresAck;
@override final  OnAck? onAck;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveBallCopyWith<ReceiveBall> get copyWith => _$ReceiveBallCopyWithImpl<ReceiveBall>(this, _$identity);





@override
String toString() {
  return 'PlayerUnion.receiveBall(receiver: $receiver, cancelled: $cancelled, requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $ReceiveBallCopyWith<$Res> implements $PlayerUnionCopyWith<$Res> {
  factory $ReceiveBallCopyWith(ReceiveBall value, $Res Function(ReceiveBall) _then) = _$ReceiveBallCopyWithImpl;
@override @useResult
$Res call({
 EcsEntity receiver, bool cancelled, bool requiresAck, OnAck? onAck
});




}
/// @nodoc
class _$ReceiveBallCopyWithImpl<$Res>
    implements $ReceiveBallCopyWith<$Res> {
  _$ReceiveBallCopyWithImpl(this._self, this._then);

  final ReceiveBall _self;
  final $Res Function(ReceiveBall) _then;

/// Create a copy of PlayerUnion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiver = null,Object? cancelled = null,Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(ReceiveBall(
receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as bool,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as OnAck?,
  ));
}


}

// dart format on
