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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage()';
}


}

/// @nodoc
class $PlayerMessageCopyWith<$Res>  {
$PlayerMessageCopyWith(PlayerMessage _, $Res Function(PlayerMessage) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GoHome value)?  goHome,TResult Function( PassToNearestTeammate value)?  passToNearestTeammate,TResult Function( MoveToPosition value)?  moveToPosition,TResult Function( MoveToBall value)?  moveToBall,TResult Function( Wait value)?  wait,TResult Function( PlaceToKickOff value)?  placeToKickOff,TResult Function( ReceiveBall value)?  receiveBall,TResult Function( PassToMe value)?  passToMe,TResult Function( SupportAttacker value)?  supportAttacker,TResult Function( BallChangeOwner value)?  ballChangeOwner,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GoHome() when goHome != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GoHome value)  goHome,required TResult Function( PassToNearestTeammate value)  passToNearestTeammate,required TResult Function( MoveToPosition value)  moveToPosition,required TResult Function( MoveToBall value)  moveToBall,required TResult Function( Wait value)  wait,required TResult Function( PlaceToKickOff value)  placeToKickOff,required TResult Function( ReceiveBall value)  receiveBall,required TResult Function( PassToMe value)  passToMe,required TResult Function( SupportAttacker value)  supportAttacker,required TResult Function( BallChangeOwner value)  ballChangeOwner,}){
final _that = this;
switch (_that) {
case GoHome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GoHome value)?  goHome,TResult? Function( PassToNearestTeammate value)?  passToNearestTeammate,TResult? Function( MoveToPosition value)?  moveToPosition,TResult? Function( MoveToBall value)?  moveToBall,TResult? Function( Wait value)?  wait,TResult? Function( PlaceToKickOff value)?  placeToKickOff,TResult? Function( ReceiveBall value)?  receiveBall,TResult? Function( PassToMe value)?  passToMe,TResult? Function( SupportAttacker value)?  supportAttacker,TResult? Function( BallChangeOwner value)?  ballChangeOwner,}){
final _that = this;
switch (_that) {
case GoHome() when goHome != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  goHome,TResult Function()?  passToNearestTeammate,TResult Function( Vector2 target)?  moveToPosition,TResult Function( MovePlayerIntent intent)?  moveToBall,TResult Function()?  wait,TResult Function()?  placeToKickOff,TResult Function()?  receiveBall,TResult Function()?  passToMe,TResult Function()?  supportAttacker,TResult Function()?  ballChangeOwner,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GoHome() when goHome != null:
return goHome();case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate();case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that.target);case MoveToBall() when moveToBall != null:
return moveToBall(_that.intent);case Wait() when wait != null:
return wait();case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff();case ReceiveBall() when receiveBall != null:
return receiveBall();case PassToMe() when passToMe != null:
return passToMe();case SupportAttacker() when supportAttacker != null:
return supportAttacker();case BallChangeOwner() when ballChangeOwner != null:
return ballChangeOwner();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  goHome,required TResult Function()  passToNearestTeammate,required TResult Function( Vector2 target)  moveToPosition,required TResult Function( MovePlayerIntent intent)  moveToBall,required TResult Function()  wait,required TResult Function()  placeToKickOff,required TResult Function()  receiveBall,required TResult Function()  passToMe,required TResult Function()  supportAttacker,required TResult Function()  ballChangeOwner,}) {final _that = this;
switch (_that) {
case GoHome():
return goHome();case PassToNearestTeammate():
return passToNearestTeammate();case MoveToPosition():
return moveToPosition(_that.target);case MoveToBall():
return moveToBall(_that.intent);case Wait():
return wait();case PlaceToKickOff():
return placeToKickOff();case ReceiveBall():
return receiveBall();case PassToMe():
return passToMe();case SupportAttacker():
return supportAttacker();case BallChangeOwner():
return ballChangeOwner();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  goHome,TResult? Function()?  passToNearestTeammate,TResult? Function( Vector2 target)?  moveToPosition,TResult? Function( MovePlayerIntent intent)?  moveToBall,TResult? Function()?  wait,TResult? Function()?  placeToKickOff,TResult? Function()?  receiveBall,TResult? Function()?  passToMe,TResult? Function()?  supportAttacker,TResult? Function()?  ballChangeOwner,}) {final _that = this;
switch (_that) {
case GoHome() when goHome != null:
return goHome();case PassToNearestTeammate() when passToNearestTeammate != null:
return passToNearestTeammate();case MoveToPosition() when moveToPosition != null:
return moveToPosition(_that.target);case MoveToBall() when moveToBall != null:
return moveToBall(_that.intent);case Wait() when wait != null:
return wait();case PlaceToKickOff() when placeToKickOff != null:
return placeToKickOff();case ReceiveBall() when receiveBall != null:
return receiveBall();case PassToMe() when passToMe != null:
return passToMe();case SupportAttacker() when supportAttacker != null:
return supportAttacker();case BallChangeOwner() when ballChangeOwner != null:
return ballChangeOwner();case _:
  return null;

}
}

}

/// @nodoc


class GoHome implements PlayerMessage {
  const GoHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage.goHome()';
}


}




/// @nodoc


class PassToNearestTeammate implements PlayerMessage {
  const PassToNearestTeammate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassToNearestTeammate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage.passToNearestTeammate()';
}


}




/// @nodoc


class MoveToPosition implements PlayerMessage {
  const MoveToPosition(this.target);
  

 final  Vector2 target;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveToPositionCopyWith<MoveToPosition> get copyWith => _$MoveToPositionCopyWithImpl<MoveToPosition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveToPosition&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode => Object.hash(runtimeType,target);

@override
String toString() {
  return 'PlayerMessage.moveToPosition(target: $target)';
}


}

/// @nodoc
abstract mixin class $MoveToPositionCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $MoveToPositionCopyWith(MoveToPosition value, $Res Function(MoveToPosition) _then) = _$MoveToPositionCopyWithImpl;
@useResult
$Res call({
 Vector2 target
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
@pragma('vm:prefer-inline') $Res call({Object? target = null,}) {
  return _then(MoveToPosition(
null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as Vector2,
  ));
}


}

/// @nodoc


class MoveToBall implements PlayerMessage {
  const MoveToBall({required this.intent});
  

 final  MovePlayerIntent intent;

/// Create a copy of PlayerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveToBallCopyWith<MoveToBall> get copyWith => _$MoveToBallCopyWithImpl<MoveToBall>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveToBall&&(identical(other.intent, intent) || other.intent == intent));
}


@override
int get hashCode => Object.hash(runtimeType,intent);

@override
String toString() {
  return 'PlayerMessage.moveToBall(intent: $intent)';
}


}

/// @nodoc
abstract mixin class $MoveToBallCopyWith<$Res> implements $PlayerMessageCopyWith<$Res> {
  factory $MoveToBallCopyWith(MoveToBall value, $Res Function(MoveToBall) _then) = _$MoveToBallCopyWithImpl;
@useResult
$Res call({
 MovePlayerIntent intent
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
@pragma('vm:prefer-inline') $Res call({Object? intent = null,}) {
  return _then(MoveToBall(
intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as MovePlayerIntent,
  ));
}


}

/// @nodoc


class Wait implements PlayerMessage {
  const Wait();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wait);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage.wait()';
}


}




/// @nodoc


class PlaceToKickOff implements PlayerMessage {
  const PlaceToKickOff();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceToKickOff);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage.placeToKickOff()';
}


}




/// @nodoc


class ReceiveBall implements PlayerMessage {
  const ReceiveBall();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveBall);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage.receiveBall()';
}


}




/// @nodoc


class PassToMe implements PlayerMessage {
  const PassToMe();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassToMe);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage.passToMe()';
}


}




/// @nodoc


class SupportAttacker implements PlayerMessage {
  const SupportAttacker();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportAttacker);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage.supportAttacker()';
}


}




/// @nodoc


class BallChangeOwner implements PlayerMessage {
  const BallChangeOwner();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallChangeOwner);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerMessage.ballChangeOwner()';
}


}




// dart format on
