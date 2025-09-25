// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_player_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovePlayerIntent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovePlayerIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovePlayerIntent()';
}


}

/// @nodoc
class $MovePlayerIntentCopyWith<$Res>  {
$MovePlayerIntentCopyWith(MovePlayerIntent _, $Res Function(MovePlayerIntent) __);
}


/// Adds pattern-matching-related methods to [MovePlayerIntent].
extension MovePlayerIntentPatterns on MovePlayerIntent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReceivePassIntent value)?  receivePass,TResult Function( InterceptIntent value)?  intercept,TResult Function( ChaseBallIntent value)?  chaseBall,TResult Function( PressOpponentIntent value)?  pressOpponent,TResult Function( IdleIntent value)?  idle,TResult Function( PrepareKickIntent value)?  prepareKick,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReceivePassIntent() when receivePass != null:
return receivePass(_that);case InterceptIntent() when intercept != null:
return intercept(_that);case ChaseBallIntent() when chaseBall != null:
return chaseBall(_that);case PressOpponentIntent() when pressOpponent != null:
return pressOpponent(_that);case IdleIntent() when idle != null:
return idle(_that);case PrepareKickIntent() when prepareKick != null:
return prepareKick(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReceivePassIntent value)  receivePass,required TResult Function( InterceptIntent value)  intercept,required TResult Function( ChaseBallIntent value)  chaseBall,required TResult Function( PressOpponentIntent value)  pressOpponent,required TResult Function( IdleIntent value)  idle,required TResult Function( PrepareKickIntent value)  prepareKick,}){
final _that = this;
switch (_that) {
case ReceivePassIntent():
return receivePass(_that);case InterceptIntent():
return intercept(_that);case ChaseBallIntent():
return chaseBall(_that);case PressOpponentIntent():
return pressOpponent(_that);case IdleIntent():
return idle(_that);case PrepareKickIntent():
return prepareKick(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReceivePassIntent value)?  receivePass,TResult? Function( InterceptIntent value)?  intercept,TResult? Function( ChaseBallIntent value)?  chaseBall,TResult? Function( PressOpponentIntent value)?  pressOpponent,TResult? Function( IdleIntent value)?  idle,TResult? Function( PrepareKickIntent value)?  prepareKick,}){
final _that = this;
switch (_that) {
case ReceivePassIntent() when receivePass != null:
return receivePass(_that);case InterceptIntent() when intercept != null:
return intercept(_that);case ChaseBallIntent() when chaseBall != null:
return chaseBall(_that);case PressOpponentIntent() when pressOpponent != null:
return pressOpponent(_that);case IdleIntent() when idle != null:
return idle(_that);case PrepareKickIntent() when prepareKick != null:
return prepareKick(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  receivePass,TResult Function()?  intercept,TResult Function()?  chaseBall,TResult Function()?  pressOpponent,TResult Function()?  idle,TResult Function()?  prepareKick,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReceivePassIntent() when receivePass != null:
return receivePass();case InterceptIntent() when intercept != null:
return intercept();case ChaseBallIntent() when chaseBall != null:
return chaseBall();case PressOpponentIntent() when pressOpponent != null:
return pressOpponent();case IdleIntent() when idle != null:
return idle();case PrepareKickIntent() when prepareKick != null:
return prepareKick();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  receivePass,required TResult Function()  intercept,required TResult Function()  chaseBall,required TResult Function()  pressOpponent,required TResult Function()  idle,required TResult Function()  prepareKick,}) {final _that = this;
switch (_that) {
case ReceivePassIntent():
return receivePass();case InterceptIntent():
return intercept();case ChaseBallIntent():
return chaseBall();case PressOpponentIntent():
return pressOpponent();case IdleIntent():
return idle();case PrepareKickIntent():
return prepareKick();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  receivePass,TResult? Function()?  intercept,TResult? Function()?  chaseBall,TResult? Function()?  pressOpponent,TResult? Function()?  idle,TResult? Function()?  prepareKick,}) {final _that = this;
switch (_that) {
case ReceivePassIntent() when receivePass != null:
return receivePass();case InterceptIntent() when intercept != null:
return intercept();case ChaseBallIntent() when chaseBall != null:
return chaseBall();case PressOpponentIntent() when pressOpponent != null:
return pressOpponent();case IdleIntent() when idle != null:
return idle();case PrepareKickIntent() when prepareKick != null:
return prepareKick();case _:
  return null;

}
}

}

/// @nodoc


class ReceivePassIntent implements MovePlayerIntent {
  const ReceivePassIntent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceivePassIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovePlayerIntent.receivePass()';
}


}




/// @nodoc


class InterceptIntent implements MovePlayerIntent {
  const InterceptIntent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterceptIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovePlayerIntent.intercept()';
}


}




/// @nodoc


class ChaseBallIntent implements MovePlayerIntent {
  const ChaseBallIntent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChaseBallIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovePlayerIntent.chaseBall()';
}


}




/// @nodoc


class PressOpponentIntent implements MovePlayerIntent {
  const PressOpponentIntent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PressOpponentIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovePlayerIntent.pressOpponent()';
}


}




/// @nodoc


class IdleIntent implements MovePlayerIntent {
  const IdleIntent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdleIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovePlayerIntent.idle()';
}


}




/// @nodoc


class PrepareKickIntent implements MovePlayerIntent {
  const PrepareKickIntent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrepareKickIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovePlayerIntent.prepareKick()';
}


}




// dart format on
