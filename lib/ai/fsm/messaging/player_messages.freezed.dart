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
mixin _$PlayerMessage {

 void Function()? get onAck; bool get requiresAck;
/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerMessageCopyWith<PlayerMessage> get copyWith => _$PlayerMessageCopyWithImpl<PlayerMessage>(this as PlayerMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerMessage&&(identical(other.onAck, onAck) || other.onAck == onAck)&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck));
}


@override
int get hashCode => Object.hash(runtimeType,onAck,requiresAck);

@override
String toString() {
  return 'PlayerMessage(onAck: $onAck, requiresAck: $requiresAck)';
}


}

/// @nodoc
abstract mixin class $PlayerMessageCopyWith<$Res>  {
  factory $PlayerMessageCopyWith(PlayerMessage value, $Res Function(PlayerMessage) _then) = _$PlayerMessageCopyWithImpl;
@useResult
$Res call({
 void Function()? onAck, bool requiresAck
});




}
/// @nodoc
class _$PlayerMessageCopyWithImpl<$Res>
    implements $PlayerMessageCopyWith<$Res> {
  _$PlayerMessageCopyWithImpl(this._self, this._then);

  final PlayerMessage _self;
  final $Res Function(PlayerMessage) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onAck = freezed,Object? requiresAck = null,}) {
  return _then(_self.copyWith(
onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerMessage].
extension PlayerMessagePatterns on PlayerMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReceiveBallIntent value)?  receiveBallIntent,TResult Function( GoHome value)?  goHome,TResult Function( PassToNearestTeammate value)?  passToNearestTeammate,TResult Function( MoveToPosition value)?  moveToPosition,TResult Function( MoveToBall value)?  moveToBall,TResult Function( Wait value)?  wait,TResult Function( PlaceToKickOff value)?  placeToKickOff,TResult Function( ReceiveBall value)?  receiveBall,TResult Function( PassToMe value)?  passToMe,TResult Function( SupportAttacker value)?  supportAttacker,TResult Function( BallChangeOwner value)?  ballChangeOwner,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReceiveBallIntent() when receiveBallIntent != null:
return receiveBallIntent(_that);case GoHome() when goHome != null:
return goHome(_that);case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate(_that);case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that);case MoveToBall() when moveToBall != null:
return moveToBall(_that);case Wait() when wait != null:
return wait(_that);case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff(_that);case ReceiveBall() when receiveBall != null:
return receiveBall(_that);case PassToMe() when passToMe != null:
return passToMe(_that);case SupportAttacker() when supportAttacker != null:
return supportAttacker(_that);case BallChangeOwner() when ballChangeOwner != null:
return ballChangeOwner(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReceiveBallIntent value)  receiveBallIntent,required TResult Function( GoHome value)  goHome,required TResult Function( PassToNearestTeammate value)  passToNearestTeammate,required TResult Function( MoveToPosition value)  moveToPosition,required TResult Function( MoveToBall value)  moveToBall,required TResult Function( Wait value)  wait,required TResult Function( PlaceToKickOff value)  placeToKickOff,required TResult Function( ReceiveBall value)  receiveBall,required TResult Function( PassToMe value)  passToMe,required TResult Function( SupportAttacker value)  supportAttacker,required TResult Function( BallChangeOwner value)  ballChangeOwner,}){
final _that = this;
switch (_that) {
case ReceiveBallIntent():
return receiveBallIntent(_that);case GoHome():
return goHome(_that);case PassToNearestTeammate():
return passToNearestTeammate(_that);case MoveToPosition():
return moveToPosition(_that);case MoveToBall():
return moveToBall(_that);case Wait():
return wait(_that);case PlaceToKickOff():
return placeToKickOff(_that);case ReceiveBall():
return receiveBall(_that);case PassToMe():
return passToMe(_that);case SupportAttacker():
return supportAttacker(_that);case BallChangeOwner():
return ballChangeOwner(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReceiveBallIntent value)?  receiveBallIntent,TResult? Function( GoHome value)?  goHome,TResult? Function( PassToNearestTeammate value)?  passToNearestTeammate,TResult? Function( MoveToPosition value)?  moveToPosition,TResult? Function( MoveToBall value)?  moveToBall,TResult? Function( Wait value)?  wait,TResult? Function( PlaceToKickOff value)?  placeToKickOff,TResult? Function( ReceiveBall value)?  receiveBall,TResult? Function( PassToMe value)?  passToMe,TResult? Function( SupportAttacker value)?  supportAttacker,TResult? Function( BallChangeOwner value)?  ballChangeOwner,}){
final _that = this;
switch (_that) {
case ReceiveBallIntent() when receiveBallIntent != null:
return receiveBallIntent(_that);case GoHome() when goHome != null:
return goHome(_that);case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate(_that);case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that);case MoveToBall() when moveToBall != null:
return moveToBall(_that);case Wait() when wait != null:
return wait(_that);case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff(_that);case ReceiveBall() when receiveBall != null:
return receiveBall(_that);case PassToMe() when passToMe != null:
return passToMe(_that);case SupportAttacker() when supportAttacker != null:
return supportAttacker(_that);case BallChangeOwner() when ballChangeOwner != null:
return ballChangeOwner(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( void Function()? onAck,  bool requiresAck,  EcsEntity receiver,  Vector2 targetPosition)?  receiveBallIntent,TResult Function( bool requiresAck,  void Function()? onAck)?  goHome,TResult Function( bool requiresAck,  void Function()? onAck)?  passToNearestTeammate,TResult Function( Vector2 target,  bool requiresAck,  void Function()? onAck)?  moveToPosition,TResult Function( MovePlayerIntent intent,  bool requiresAck,  void Function()? onAck)?  moveToBall,TResult Function( bool requiresAck,  void Function()? onAck)?  wait,TResult Function( bool requiresAck,  void Function()? onAck)?  placeToKickOff,TResult Function( bool requiresAck,  void Function()? onAck)?  receiveBall,TResult Function( bool requiresAck,  void Function()? onAck)?  passToMe,TResult Function( bool requiresAck,  void Function()? onAck)?  supportAttacker,TResult Function( bool requiresAck,  void Function()? onAck)?  ballChangeOwner,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReceiveBallIntent() when receiveBallIntent != null:
return receiveBallIntent(_that.onAck,_that.requiresAck,_that.receiver,_that.targetPosition);case GoHome() when goHome != null:
return goHome(_that.requiresAck,_that.onAck);case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate(_that.requiresAck,_that.onAck);case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that.target,_that.requiresAck,_that.onAck);case MoveToBall() when moveToBall != null:
return moveToBall(_that.intent,_that.requiresAck,_that.onAck);case Wait() when wait != null:
return wait(_that.requiresAck,_that.onAck);case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff(_that.requiresAck,_that.onAck);case ReceiveBall() when receiveBall != null:
return receiveBall(_that.requiresAck,_that.onAck);case PassToMe() when passToMe != null:
return passToMe(_that.requiresAck,_that.onAck);case SupportAttacker() when supportAttacker != null:
return supportAttacker(_that.requiresAck,_that.onAck);case BallChangeOwner() when ballChangeOwner != null:
return ballChangeOwner(_that.requiresAck,_that.onAck);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( void Function()? onAck,  bool requiresAck,  EcsEntity receiver,  Vector2 targetPosition)  receiveBallIntent,required TResult Function( bool requiresAck,  void Function()? onAck)  goHome,required TResult Function( bool requiresAck,  void Function()? onAck)  passToNearestTeammate,required TResult Function( Vector2 target,  bool requiresAck,  void Function()? onAck)  moveToPosition,required TResult Function( MovePlayerIntent intent,  bool requiresAck,  void Function()? onAck)  moveToBall,required TResult Function( bool requiresAck,  void Function()? onAck)  wait,required TResult Function( bool requiresAck,  void Function()? onAck)  placeToKickOff,required TResult Function( bool requiresAck,  void Function()? onAck)  receiveBall,required TResult Function( bool requiresAck,  void Function()? onAck)  passToMe,required TResult Function( bool requiresAck,  void Function()? onAck)  supportAttacker,required TResult Function( bool requiresAck,  void Function()? onAck)  ballChangeOwner,}) {final _that = this;
switch (_that) {
case ReceiveBallIntent():
return receiveBallIntent(_that.onAck,_that.requiresAck,_that.receiver,_that.targetPosition);case GoHome():
return goHome(_that.requiresAck,_that.onAck);case PassToNearestTeammate():
return passToNearestTeammate(_that.requiresAck,_that.onAck);case MoveToPosition():
return moveToPosition(_that.target,_that.requiresAck,_that.onAck);case MoveToBall():
return moveToBall(_that.intent,_that.requiresAck,_that.onAck);case Wait():
return wait(_that.requiresAck,_that.onAck);case PlaceToKickOff():
return placeToKickOff(_that.requiresAck,_that.onAck);case ReceiveBall():
return receiveBall(_that.requiresAck,_that.onAck);case PassToMe():
return passToMe(_that.requiresAck,_that.onAck);case SupportAttacker():
return supportAttacker(_that.requiresAck,_that.onAck);case BallChangeOwner():
return ballChangeOwner(_that.requiresAck,_that.onAck);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( void Function()? onAck,  bool requiresAck,  EcsEntity receiver,  Vector2 targetPosition)?  receiveBallIntent,TResult? Function( bool requiresAck,  void Function()? onAck)?  goHome,TResult? Function( bool requiresAck,  void Function()? onAck)?  passToNearestTeammate,TResult? Function( Vector2 target,  bool requiresAck,  void Function()? onAck)?  moveToPosition,TResult? Function( MovePlayerIntent intent,  bool requiresAck,  void Function()? onAck)?  moveToBall,TResult? Function( bool requiresAck,  void Function()? onAck)?  wait,TResult? Function( bool requiresAck,  void Function()? onAck)?  placeToKickOff,TResult? Function( bool requiresAck,  void Function()? onAck)?  receiveBall,TResult? Function( bool requiresAck,  void Function()? onAck)?  passToMe,TResult? Function( bool requiresAck,  void Function()? onAck)?  supportAttacker,TResult? Function( bool requiresAck,  void Function()? onAck)?  ballChangeOwner,}) {final _that = this;
switch (_that) {
case ReceiveBallIntent() when receiveBallIntent != null:
return receiveBallIntent(_that.onAck,_that.requiresAck,_that.receiver,_that.targetPosition);case GoHome() when goHome != null:
return goHome(_that.requiresAck,_that.onAck);case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate(_that.requiresAck,_that.onAck);case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that.target,_that.requiresAck,_that.onAck);case MoveToBall() when moveToBall != null:
return moveToBall(_that.intent,_that.requiresAck,_that.onAck);case Wait() when wait != null:
return wait(_that.requiresAck,_that.onAck);case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff(_that.requiresAck,_that.onAck);case ReceiveBall() when receiveBall != null:
return receiveBall(_that.requiresAck,_that.onAck);case PassToMe() when passToMe != null:
return passToMe(_that.requiresAck,_that.onAck);case SupportAttacker() when supportAttacker != null:
return supportAttacker(_that.requiresAck,_that.onAck);case BallChangeOwner() when ballChangeOwner != null:
return ballChangeOwner(_that.requiresAck,_that.onAck);case _:
  return null;

}
}

}

/// @nodoc


class ReceiveBallIntent implements PlayerMessage {
  const ReceiveBallIntent({this.onAck, this.requiresAck = false, required this.receiver, required this.targetPosition});
  

@override final  void Function()? onAck;
@override@JsonKey() final  bool requiresAck;
 final  EcsEntity receiver;
 final  Vector2 targetPosition;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveBallIntentCopyWith<ReceiveBallIntent> get copyWith => _$ReceiveBallIntentCopyWithImpl<ReceiveBallIntent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveBallIntent&&(identical(other.onAck, onAck) || other.onAck == onAck)&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.receiver, receiver) || other.receiver == receiver)&&(identical(other.targetPosition, targetPosition) || other.targetPosition == targetPosition));
}


@override
int get hashCode => Object.hash(runtimeType,onAck,requiresAck,receiver,targetPosition);

@override
String toString() {
  return 'PlayerMessage.receiveBallIntent(onAck: $onAck, requiresAck: $requiresAck, receiver: $receiver, targetPosition: $targetPosition)';
}


}

/// @nodoc
abstract mixin class $ReceiveBallIntentCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $ReceiveBallIntentCopyWith(ReceiveBallIntent value, $Res Function(ReceiveBallIntent) _then) = _$ReceiveBallIntentCopyWithImpl;
@override @useResult
$Res call({
 void Function()? onAck, bool requiresAck, EcsEntity receiver, Vector2 targetPosition
});




}
/// @nodoc
class _$ReceiveBallIntentCopyWithImpl<$Res>
    implements $ReceiveBallIntentCopyWith<$Res> {
  _$ReceiveBallIntentCopyWithImpl(this._self, this._then);

  final ReceiveBallIntent _self;
  final $Res Function(ReceiveBallIntent) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onAck = freezed,Object? requiresAck = null,Object? receiver = null,Object? targetPosition = null,}) {
  return _then(ReceiveBallIntent(
onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,receiver: null == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as EcsEntity,targetPosition: null == targetPosition ? _self.targetPosition : targetPosition // ignore: cast_nullable_to_non_nullable
as Vector2,
  ));
}


}

/// @nodoc


class GoHome implements PlayerMessage {
  const GoHome({this.requiresAck = false, this.onAck});
  

@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoHomeCopyWith<GoHome> get copyWith => _$GoHomeCopyWithImpl<GoHome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoHome&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.goHome(requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $GoHomeCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $GoHomeCopyWith(GoHome value, $Res Function(GoHome) _then) = _$GoHomeCopyWithImpl;
@override @useResult
$Res call({
 bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$GoHomeCopyWithImpl<$Res>
    implements $GoHomeCopyWith<$Res> {
  _$GoHomeCopyWithImpl(this._self, this._then);

  final GoHome _self;
  final $Res Function(GoHome) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(GoHome(
requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class PassToNearestTeammate implements PlayerMessage {
  const PassToNearestTeammate({this.requiresAck = false, this.onAck});
  

@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassToNearestTeammateCopyWith<PassToNearestTeammate> get copyWith => _$PassToNearestTeammateCopyWithImpl<PassToNearestTeammate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassToNearestTeammate&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.passToNearestTeammate(requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $PassToNearestTeammateCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $PassToNearestTeammateCopyWith(PassToNearestTeammate value, $Res Function(PassToNearestTeammate) _then) = _$PassToNearestTeammateCopyWithImpl;
@override @useResult
$Res call({
 bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$PassToNearestTeammateCopyWithImpl<$Res>
    implements $PassToNearestTeammateCopyWith<$Res> {
  _$PassToNearestTeammateCopyWithImpl(this._self, this._then);

  final PassToNearestTeammate _self;
  final $Res Function(PassToNearestTeammate) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(PassToNearestTeammate(
requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class MoveToPosition implements PlayerMessage {
  const MoveToPosition(this.target, {this.requiresAck = false, this.onAck});
  

 final  Vector2 target;
@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveToPositionCopyWith<MoveToPosition> get copyWith => _$MoveToPositionCopyWithImpl<MoveToPosition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveToPosition&&(identical(other.target, target) || other.target == target)&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,target,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.moveToPosition(target: $target, requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $MoveToPositionCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $MoveToPositionCopyWith(MoveToPosition value, $Res Function(MoveToPosition) _then) = _$MoveToPositionCopyWithImpl;
@override @useResult
$Res call({
 Vector2 target, bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$MoveToPositionCopyWithImpl<$Res>
    implements $MoveToPositionCopyWith<$Res> {
  _$MoveToPositionCopyWithImpl(this._self, this._then);

  final MoveToPosition _self;
  final $Res Function(MoveToPosition) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? target = null,Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(MoveToPosition(
null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as Vector2,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class MoveToBall implements PlayerMessage {
  const MoveToBall({required this.intent, this.requiresAck = false, this.onAck});
  

 final  MovePlayerIntent intent;
@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveToBallCopyWith<MoveToBall> get copyWith => _$MoveToBallCopyWithImpl<MoveToBall>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveToBall&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,intent,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.moveToBall(intent: $intent, requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $MoveToBallCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $MoveToBallCopyWith(MoveToBall value, $Res Function(MoveToBall) _then) = _$MoveToBallCopyWithImpl;
@override @useResult
$Res call({
 MovePlayerIntent intent, bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$MoveToBallCopyWithImpl<$Res>
    implements $MoveToBallCopyWith<$Res> {
  _$MoveToBallCopyWithImpl(this._self, this._then);

  final MoveToBall _self;
  final $Res Function(MoveToBall) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intent = null,Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(MoveToBall(
intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as MovePlayerIntent,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class Wait implements PlayerMessage {
  const Wait({this.requiresAck = false, this.onAck});
  

@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaitCopyWith<Wait> get copyWith => _$WaitCopyWithImpl<Wait>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wait&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.wait(requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $WaitCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $WaitCopyWith(Wait value, $Res Function(Wait) _then) = _$WaitCopyWithImpl;
@override @useResult
$Res call({
 bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$WaitCopyWithImpl<$Res>
    implements $WaitCopyWith<$Res> {
  _$WaitCopyWithImpl(this._self, this._then);

  final Wait _self;
  final $Res Function(Wait) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(Wait(
requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class PlaceToKickOff implements PlayerMessage {
  const PlaceToKickOff({this.requiresAck = false, this.onAck});
  

@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceToKickOffCopyWith<PlaceToKickOff> get copyWith => _$PlaceToKickOffCopyWithImpl<PlaceToKickOff>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceToKickOff&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.placeToKickOff(requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $PlaceToKickOffCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $PlaceToKickOffCopyWith(PlaceToKickOff value, $Res Function(PlaceToKickOff) _then) = _$PlaceToKickOffCopyWithImpl;
@override @useResult
$Res call({
 bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$PlaceToKickOffCopyWithImpl<$Res>
    implements $PlaceToKickOffCopyWith<$Res> {
  _$PlaceToKickOffCopyWithImpl(this._self, this._then);

  final PlaceToKickOff _self;
  final $Res Function(PlaceToKickOff) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(PlaceToKickOff(
requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class ReceiveBall implements PlayerMessage {
  const ReceiveBall({this.requiresAck = false, this.onAck});
  

@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveBallCopyWith<ReceiveBall> get copyWith => _$ReceiveBallCopyWithImpl<ReceiveBall>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveBall&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.receiveBall(requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $ReceiveBallCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $ReceiveBallCopyWith(ReceiveBall value, $Res Function(ReceiveBall) _then) = _$ReceiveBallCopyWithImpl;
@override @useResult
$Res call({
 bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$ReceiveBallCopyWithImpl<$Res>
    implements $ReceiveBallCopyWith<$Res> {
  _$ReceiveBallCopyWithImpl(this._self, this._then);

  final ReceiveBall _self;
  final $Res Function(ReceiveBall) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(ReceiveBall(
requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class PassToMe implements PlayerMessage {
  const PassToMe({this.requiresAck = false, this.onAck});
  

@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassToMeCopyWith<PassToMe> get copyWith => _$PassToMeCopyWithImpl<PassToMe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassToMe&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.passToMe(requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $PassToMeCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $PassToMeCopyWith(PassToMe value, $Res Function(PassToMe) _then) = _$PassToMeCopyWithImpl;
@override @useResult
$Res call({
 bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$PassToMeCopyWithImpl<$Res>
    implements $PassToMeCopyWith<$Res> {
  _$PassToMeCopyWithImpl(this._self, this._then);

  final PassToMe _self;
  final $Res Function(PassToMe) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(PassToMe(
requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class SupportAttacker implements PlayerMessage {
  const SupportAttacker({this.requiresAck = false, this.onAck});
  

@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportAttackerCopyWith<SupportAttacker> get copyWith => _$SupportAttackerCopyWithImpl<SupportAttacker>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportAttacker&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.supportAttacker(requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $SupportAttackerCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $SupportAttackerCopyWith(SupportAttacker value, $Res Function(SupportAttacker) _then) = _$SupportAttackerCopyWithImpl;
@override @useResult
$Res call({
 bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$SupportAttackerCopyWithImpl<$Res>
    implements $SupportAttackerCopyWith<$Res> {
  _$SupportAttackerCopyWithImpl(this._self, this._then);

  final SupportAttacker _self;
  final $Res Function(SupportAttacker) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(SupportAttacker(
requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class BallChangeOwner implements PlayerMessage {
  const BallChangeOwner({this.requiresAck = false, this.onAck});
  

@override@JsonKey() final  bool requiresAck;
@override final  void Function()? onAck;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallChangeOwnerCopyWith<BallChangeOwner> get copyWith => _$BallChangeOwnerCopyWithImpl<BallChangeOwner>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallChangeOwner&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.onAck, onAck) || other.onAck == onAck));
}


@override
int get hashCode => Object.hash(runtimeType,requiresAck,onAck);

@override
String toString() {
  return 'PlayerMessage.ballChangeOwner(requiresAck: $requiresAck, onAck: $onAck)';
}


}

/// @nodoc
abstract mixin class $BallChangeOwnerCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $BallChangeOwnerCopyWith(BallChangeOwner value, $Res Function(BallChangeOwner) _then) = _$BallChangeOwnerCopyWithImpl;
@override @useResult
$Res call({
 bool requiresAck, void Function()? onAck
});




}
/// @nodoc
class _$BallChangeOwnerCopyWithImpl<$Res>
    implements $BallChangeOwnerCopyWith<$Res> {
  _$BallChangeOwnerCopyWithImpl(this._self, this._then);

  final BallChangeOwner _self;
  final $Res Function(BallChangeOwner) _then;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiresAck = null,Object? onAck = freezed,}) {
  return _then(BallChangeOwner(
requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

// dart format on
