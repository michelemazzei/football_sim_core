// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchMessage {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage()';
}


}

/// @nodoc
class $MatchMessageCopyWith<$Res>  {
$MatchMessageCopyWith(MatchMessage _, $Res Function(MatchMessage) __);
}


/// Adds pattern-matching-related methods to [MatchMessage].
extension MatchMessagePatterns on MatchMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( KickoffStarted value)?  kickoffStarted,TResult Function( BallKicked value)?  ballKicked,TResult Function( PassCompleted value)?  passCompleted,TResult Function( PlayStarted value)?  playStarted,TResult Function( MatchStarted value)?  started,TResult Function( MatchFirstHalfStarted value)?  firstHalfStarted,TResult Function( MatchFirstHalfEnded value)?  firstHalfEnded,TResult Function( MatchSecondHalfStarted value)?  secondHalfStarted,TResult Function( MatchSecondHalfEnded value)?  secondHalfEnded,TResult Function( MatchFirstExtraTimeStarted value)?  firstExtraTimeStarted,TResult Function( MatchFirstExtraTimeEnded value)?  firstExtraTimeEnded,TResult Function( MatchSecondExtraTimeStarted value)?  secondExtraTimeStarted,TResult Function( MatchSecondExtraTimeEnded value)?  secondExtraTimeEnded,TResult Function( MatchShootOutStarted value)?  shootOutStarted,TResult Function( MatchShootOutEnded value)?  shootOutEnded,TResult Function( MatchEnded value)?  ended,TResult Function( GoalScored value)?  goalScored,required TResult orElse(),}){
final _that = this;
switch (_that) {
case KickoffStarted() when kickoffStarted != null:
return kickoffStarted(_that);case BallKicked() when ballKicked != null:
return ballKicked(_that);case PassCompleted() when passCompleted != null:
return passCompleted(_that);case PlayStarted() when playStarted != null:
return playStarted(_that);case MatchStarted() when started != null:
return started(_that);case MatchFirstHalfStarted() when firstHalfStarted != null:
return firstHalfStarted(_that);case MatchFirstHalfEnded() when firstHalfEnded != null:
return firstHalfEnded(_that);case MatchSecondHalfStarted() when secondHalfStarted != null:
return secondHalfStarted(_that);case MatchSecondHalfEnded() when secondHalfEnded != null:
return secondHalfEnded(_that);case MatchFirstExtraTimeStarted() when firstExtraTimeStarted != null:
return firstExtraTimeStarted(_that);case MatchFirstExtraTimeEnded() when firstExtraTimeEnded != null:
return firstExtraTimeEnded(_that);case MatchSecondExtraTimeStarted() when secondExtraTimeStarted != null:
return secondExtraTimeStarted(_that);case MatchSecondExtraTimeEnded() when secondExtraTimeEnded != null:
return secondExtraTimeEnded(_that);case MatchShootOutStarted() when shootOutStarted != null:
return shootOutStarted(_that);case MatchShootOutEnded() when shootOutEnded != null:
return shootOutEnded(_that);case MatchEnded() when ended != null:
return ended(_that);case GoalScored() when goalScored != null:
return goalScored(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( KickoffStarted value)  kickoffStarted,required TResult Function( BallKicked value)  ballKicked,required TResult Function( PassCompleted value)  passCompleted,required TResult Function( PlayStarted value)  playStarted,required TResult Function( MatchStarted value)  started,required TResult Function( MatchFirstHalfStarted value)  firstHalfStarted,required TResult Function( MatchFirstHalfEnded value)  firstHalfEnded,required TResult Function( MatchSecondHalfStarted value)  secondHalfStarted,required TResult Function( MatchSecondHalfEnded value)  secondHalfEnded,required TResult Function( MatchFirstExtraTimeStarted value)  firstExtraTimeStarted,required TResult Function( MatchFirstExtraTimeEnded value)  firstExtraTimeEnded,required TResult Function( MatchSecondExtraTimeStarted value)  secondExtraTimeStarted,required TResult Function( MatchSecondExtraTimeEnded value)  secondExtraTimeEnded,required TResult Function( MatchShootOutStarted value)  shootOutStarted,required TResult Function( MatchShootOutEnded value)  shootOutEnded,required TResult Function( MatchEnded value)  ended,required TResult Function( GoalScored value)  goalScored,}){
final _that = this;
switch (_that) {
case KickoffStarted():
return kickoffStarted(_that);case BallKicked():
return ballKicked(_that);case PassCompleted():
return passCompleted(_that);case PlayStarted():
return playStarted(_that);case MatchStarted():
return started(_that);case MatchFirstHalfStarted():
return firstHalfStarted(_that);case MatchFirstHalfEnded():
return firstHalfEnded(_that);case MatchSecondHalfStarted():
return secondHalfStarted(_that);case MatchSecondHalfEnded():
return secondHalfEnded(_that);case MatchFirstExtraTimeStarted():
return firstExtraTimeStarted(_that);case MatchFirstExtraTimeEnded():
return firstExtraTimeEnded(_that);case MatchSecondExtraTimeStarted():
return secondExtraTimeStarted(_that);case MatchSecondExtraTimeEnded():
return secondExtraTimeEnded(_that);case MatchShootOutStarted():
return shootOutStarted(_that);case MatchShootOutEnded():
return shootOutEnded(_that);case MatchEnded():
return ended(_that);case GoalScored():
return goalScored(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( KickoffStarted value)?  kickoffStarted,TResult? Function( BallKicked value)?  ballKicked,TResult? Function( PassCompleted value)?  passCompleted,TResult? Function( PlayStarted value)?  playStarted,TResult? Function( MatchStarted value)?  started,TResult? Function( MatchFirstHalfStarted value)?  firstHalfStarted,TResult? Function( MatchFirstHalfEnded value)?  firstHalfEnded,TResult? Function( MatchSecondHalfStarted value)?  secondHalfStarted,TResult? Function( MatchSecondHalfEnded value)?  secondHalfEnded,TResult? Function( MatchFirstExtraTimeStarted value)?  firstExtraTimeStarted,TResult? Function( MatchFirstExtraTimeEnded value)?  firstExtraTimeEnded,TResult? Function( MatchSecondExtraTimeStarted value)?  secondExtraTimeStarted,TResult? Function( MatchSecondExtraTimeEnded value)?  secondExtraTimeEnded,TResult? Function( MatchShootOutStarted value)?  shootOutStarted,TResult? Function( MatchShootOutEnded value)?  shootOutEnded,TResult? Function( MatchEnded value)?  ended,TResult? Function( GoalScored value)?  goalScored,}){
final _that = this;
switch (_that) {
case KickoffStarted() when kickoffStarted != null:
return kickoffStarted(_that);case BallKicked() when ballKicked != null:
return ballKicked(_that);case PassCompleted() when passCompleted != null:
return passCompleted(_that);case PlayStarted() when playStarted != null:
return playStarted(_that);case MatchStarted() when started != null:
return started(_that);case MatchFirstHalfStarted() when firstHalfStarted != null:
return firstHalfStarted(_that);case MatchFirstHalfEnded() when firstHalfEnded != null:
return firstHalfEnded(_that);case MatchSecondHalfStarted() when secondHalfStarted != null:
return secondHalfStarted(_that);case MatchSecondHalfEnded() when secondHalfEnded != null:
return secondHalfEnded(_that);case MatchFirstExtraTimeStarted() when firstExtraTimeStarted != null:
return firstExtraTimeStarted(_that);case MatchFirstExtraTimeEnded() when firstExtraTimeEnded != null:
return firstExtraTimeEnded(_that);case MatchSecondExtraTimeStarted() when secondExtraTimeStarted != null:
return secondExtraTimeStarted(_that);case MatchSecondExtraTimeEnded() when secondExtraTimeEnded != null:
return secondExtraTimeEnded(_that);case MatchShootOutStarted() when shootOutStarted != null:
return shootOutStarted(_that);case MatchShootOutEnded() when shootOutEnded != null:
return shootOutEnded(_that);case MatchEnded() when ended != null:
return ended(_that);case GoalScored() when goalScored != null:
return goalScored(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  kickoffStarted,TResult Function( int fromPlayerId,  int toPlayerId)?  ballKicked,TResult Function( int receiverId)?  passCompleted,TResult Function()?  playStarted,TResult Function()?  started,TResult Function()?  firstHalfStarted,TResult Function()?  firstHalfEnded,TResult Function()?  secondHalfStarted,TResult Function()?  secondHalfEnded,TResult Function()?  firstExtraTimeStarted,TResult Function()?  firstExtraTimeEnded,TResult Function()?  secondExtraTimeStarted,TResult Function()?  secondExtraTimeEnded,TResult Function()?  shootOutStarted,TResult Function()?  shootOutEnded,TResult Function()?  ended,TResult Function( int teamId)?  goalScored,required TResult orElse(),}) {final _that = this;
switch (_that) {
case KickoffStarted() when kickoffStarted != null:
return kickoffStarted();case BallKicked() when ballKicked != null:
return ballKicked(_that.fromPlayerId,_that.toPlayerId);case PassCompleted() when passCompleted != null:
return passCompleted(_that.receiverId);case PlayStarted() when playStarted != null:
return playStarted();case MatchStarted() when started != null:
return started();case MatchFirstHalfStarted() when firstHalfStarted != null:
return firstHalfStarted();case MatchFirstHalfEnded() when firstHalfEnded != null:
return firstHalfEnded();case MatchSecondHalfStarted() when secondHalfStarted != null:
return secondHalfStarted();case MatchSecondHalfEnded() when secondHalfEnded != null:
return secondHalfEnded();case MatchFirstExtraTimeStarted() when firstExtraTimeStarted != null:
return firstExtraTimeStarted();case MatchFirstExtraTimeEnded() when firstExtraTimeEnded != null:
return firstExtraTimeEnded();case MatchSecondExtraTimeStarted() when secondExtraTimeStarted != null:
return secondExtraTimeStarted();case MatchSecondExtraTimeEnded() when secondExtraTimeEnded != null:
return secondExtraTimeEnded();case MatchShootOutStarted() when shootOutStarted != null:
return shootOutStarted();case MatchShootOutEnded() when shootOutEnded != null:
return shootOutEnded();case MatchEnded() when ended != null:
return ended();case GoalScored() when goalScored != null:
return goalScored(_that.teamId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  kickoffStarted,required TResult Function( int fromPlayerId,  int toPlayerId)  ballKicked,required TResult Function( int receiverId)  passCompleted,required TResult Function()  playStarted,required TResult Function()  started,required TResult Function()  firstHalfStarted,required TResult Function()  firstHalfEnded,required TResult Function()  secondHalfStarted,required TResult Function()  secondHalfEnded,required TResult Function()  firstExtraTimeStarted,required TResult Function()  firstExtraTimeEnded,required TResult Function()  secondExtraTimeStarted,required TResult Function()  secondExtraTimeEnded,required TResult Function()  shootOutStarted,required TResult Function()  shootOutEnded,required TResult Function()  ended,required TResult Function( int teamId)  goalScored,}) {final _that = this;
switch (_that) {
case KickoffStarted():
return kickoffStarted();case BallKicked():
return ballKicked(_that.fromPlayerId,_that.toPlayerId);case PassCompleted():
return passCompleted(_that.receiverId);case PlayStarted():
return playStarted();case MatchStarted():
return started();case MatchFirstHalfStarted():
return firstHalfStarted();case MatchFirstHalfEnded():
return firstHalfEnded();case MatchSecondHalfStarted():
return secondHalfStarted();case MatchSecondHalfEnded():
return secondHalfEnded();case MatchFirstExtraTimeStarted():
return firstExtraTimeStarted();case MatchFirstExtraTimeEnded():
return firstExtraTimeEnded();case MatchSecondExtraTimeStarted():
return secondExtraTimeStarted();case MatchSecondExtraTimeEnded():
return secondExtraTimeEnded();case MatchShootOutStarted():
return shootOutStarted();case MatchShootOutEnded():
return shootOutEnded();case MatchEnded():
return ended();case GoalScored():
return goalScored(_that.teamId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  kickoffStarted,TResult? Function( int fromPlayerId,  int toPlayerId)?  ballKicked,TResult? Function( int receiverId)?  passCompleted,TResult? Function()?  playStarted,TResult? Function()?  started,TResult? Function()?  firstHalfStarted,TResult? Function()?  firstHalfEnded,TResult? Function()?  secondHalfStarted,TResult? Function()?  secondHalfEnded,TResult? Function()?  firstExtraTimeStarted,TResult? Function()?  firstExtraTimeEnded,TResult? Function()?  secondExtraTimeStarted,TResult? Function()?  secondExtraTimeEnded,TResult? Function()?  shootOutStarted,TResult? Function()?  shootOutEnded,TResult? Function()?  ended,TResult? Function( int teamId)?  goalScored,}) {final _that = this;
switch (_that) {
case KickoffStarted() when kickoffStarted != null:
return kickoffStarted();case BallKicked() when ballKicked != null:
return ballKicked(_that.fromPlayerId,_that.toPlayerId);case PassCompleted() when passCompleted != null:
return passCompleted(_that.receiverId);case PlayStarted() when playStarted != null:
return playStarted();case MatchStarted() when started != null:
return started();case MatchFirstHalfStarted() when firstHalfStarted != null:
return firstHalfStarted();case MatchFirstHalfEnded() when firstHalfEnded != null:
return firstHalfEnded();case MatchSecondHalfStarted() when secondHalfStarted != null:
return secondHalfStarted();case MatchSecondHalfEnded() when secondHalfEnded != null:
return secondHalfEnded();case MatchFirstExtraTimeStarted() when firstExtraTimeStarted != null:
return firstExtraTimeStarted();case MatchFirstExtraTimeEnded() when firstExtraTimeEnded != null:
return firstExtraTimeEnded();case MatchSecondExtraTimeStarted() when secondExtraTimeStarted != null:
return secondExtraTimeStarted();case MatchSecondExtraTimeEnded() when secondExtraTimeEnded != null:
return secondExtraTimeEnded();case MatchShootOutStarted() when shootOutStarted != null:
return shootOutStarted();case MatchShootOutEnded() when shootOutEnded != null:
return shootOutEnded();case MatchEnded() when ended != null:
return ended();case GoalScored() when goalScored != null:
return goalScored(_that.teamId);case _:
  return null;

}
}

}

/// @nodoc


class KickoffStarted implements MatchMessage {
  const KickoffStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KickoffStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.kickoffStarted()';
}


}




/// @nodoc


class BallKicked implements MatchMessage {
  const BallKicked({required this.fromPlayerId, required this.toPlayerId});
  

 final  int fromPlayerId;
 final  int toPlayerId;

/// Create a copy of MatchMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallKickedCopyWith<BallKicked> get copyWith => _$BallKickedCopyWithImpl<BallKicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallKicked&&(identical(other.fromPlayerId, fromPlayerId) || other.fromPlayerId == fromPlayerId)&&(identical(other.toPlayerId, toPlayerId) || other.toPlayerId == toPlayerId));
}


@override
int get hashCode => Object.hash(runtimeType,fromPlayerId,toPlayerId);

@override
String toString() {
  return 'MatchMessage.ballKicked(fromPlayerId: $fromPlayerId, toPlayerId: $toPlayerId)';
}


}

/// @nodoc
abstract mixin class $BallKickedCopyWith<$Res> implements $MatchMessageCopyWith<$Res> {
  factory $BallKickedCopyWith(BallKicked value, $Res Function(BallKicked) _then) = _$BallKickedCopyWithImpl;
@useResult
$Res call({
 int fromPlayerId, int toPlayerId
});




}
/// @nodoc
class _$BallKickedCopyWithImpl<$Res>
    implements $BallKickedCopyWith<$Res> {
  _$BallKickedCopyWithImpl(this._self, this._then);

  final BallKicked _self;
  final $Res Function(BallKicked) _then;

/// Create a copy of MatchMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fromPlayerId = null,Object? toPlayerId = null,}) {
  return _then(BallKicked(
fromPlayerId: null == fromPlayerId ? _self.fromPlayerId : fromPlayerId // ignore: cast_nullable_to_non_nullable
as int,toPlayerId: null == toPlayerId ? _self.toPlayerId : toPlayerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PassCompleted implements MatchMessage {
  const PassCompleted({required this.receiverId});
  

 final  int receiverId;

/// Create a copy of MatchMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassCompletedCopyWith<PassCompleted> get copyWith => _$PassCompletedCopyWithImpl<PassCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassCompleted&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId));
}


@override
int get hashCode => Object.hash(runtimeType,receiverId);

@override
String toString() {
  return 'MatchMessage.passCompleted(receiverId: $receiverId)';
}


}

/// @nodoc
abstract mixin class $PassCompletedCopyWith<$Res> implements $MatchMessageCopyWith<$Res> {
  factory $PassCompletedCopyWith(PassCompleted value, $Res Function(PassCompleted) _then) = _$PassCompletedCopyWithImpl;
@useResult
$Res call({
 int receiverId
});




}
/// @nodoc
class _$PassCompletedCopyWithImpl<$Res>
    implements $PassCompletedCopyWith<$Res> {
  _$PassCompletedCopyWithImpl(this._self, this._then);

  final PassCompleted _self;
  final $Res Function(PassCompleted) _then;

/// Create a copy of MatchMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? receiverId = null,}) {
  return _then(PassCompleted(
receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PlayStarted implements MatchMessage {
  const PlayStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.playStarted()';
}


}




/// @nodoc


class MatchStarted implements MatchMessage {
  const MatchStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.started()';
}


}




/// @nodoc


class MatchFirstHalfStarted implements MatchMessage {
  const MatchFirstHalfStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchFirstHalfStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.firstHalfStarted()';
}


}




/// @nodoc


class MatchFirstHalfEnded implements MatchMessage {
  const MatchFirstHalfEnded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchFirstHalfEnded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.firstHalfEnded()';
}


}




/// @nodoc


class MatchSecondHalfStarted implements MatchMessage {
  const MatchSecondHalfStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchSecondHalfStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.secondHalfStarted()';
}


}




/// @nodoc


class MatchSecondHalfEnded implements MatchMessage {
  const MatchSecondHalfEnded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchSecondHalfEnded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.secondHalfEnded()';
}


}




/// @nodoc


class MatchFirstExtraTimeStarted implements MatchMessage {
  const MatchFirstExtraTimeStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchFirstExtraTimeStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.firstExtraTimeStarted()';
}


}




/// @nodoc


class MatchFirstExtraTimeEnded implements MatchMessage {
  const MatchFirstExtraTimeEnded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchFirstExtraTimeEnded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.firstExtraTimeEnded()';
}


}




/// @nodoc


class MatchSecondExtraTimeStarted implements MatchMessage {
  const MatchSecondExtraTimeStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchSecondExtraTimeStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.secondExtraTimeStarted()';
}


}




/// @nodoc


class MatchSecondExtraTimeEnded implements MatchMessage {
  const MatchSecondExtraTimeEnded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchSecondExtraTimeEnded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.secondExtraTimeEnded()';
}


}




/// @nodoc


class MatchShootOutStarted implements MatchMessage {
  const MatchShootOutStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchShootOutStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.shootOutStarted()';
}


}




/// @nodoc


class MatchShootOutEnded implements MatchMessage {
  const MatchShootOutEnded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchShootOutEnded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.shootOutEnded()';
}


}




/// @nodoc


class MatchEnded implements MatchMessage {
  const MatchEnded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchEnded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchMessage.ended()';
}


}




/// @nodoc


class GoalScored implements MatchMessage {
  const GoalScored({required this.teamId});
  

 final  int teamId;

/// Create a copy of MatchMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalScoredCopyWith<GoalScored> get copyWith => _$GoalScoredCopyWithImpl<GoalScored>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalScored&&(identical(other.teamId, teamId) || other.teamId == teamId));
}


@override
int get hashCode => Object.hash(runtimeType,teamId);

@override
String toString() {
  return 'MatchMessage.goalScored(teamId: $teamId)';
}


}

/// @nodoc
abstract mixin class $GoalScoredCopyWith<$Res> implements $MatchMessageCopyWith<$Res> {
  factory $GoalScoredCopyWith(GoalScored value, $Res Function(GoalScored) _then) = _$GoalScoredCopyWithImpl;
@useResult
$Res call({
 int teamId
});




}
/// @nodoc
class _$GoalScoredCopyWithImpl<$Res>
    implements $GoalScoredCopyWith<$Res> {
  _$GoalScoredCopyWithImpl(this._self, this._then);

  final GoalScored _self;
  final $Res Function(GoalScored) _then;

/// Create a copy of MatchMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teamId = null,}) {
  return _then(GoalScored(
teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
