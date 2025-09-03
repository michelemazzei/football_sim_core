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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GoHome value)?  goHome,TResult Function( Wait value)?  wait,TResult Function( PlaceToKickOff value)?  placeToKickOff,TResult Function( ReceiveBall value)?  receiveBall,TResult Function( PassToMe value)?  passToMe,TResult Function( SupportAttacker value)?  supportAttacker,TResult Function( BallChangeOwner value)?  ballChangeOwner,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GoHome() when goHome != null:
return goHome(_that);case Wait() when wait != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GoHome value)  goHome,required TResult Function( Wait value)  wait,required TResult Function( PlaceToKickOff value)  placeToKickOff,required TResult Function( ReceiveBall value)  receiveBall,required TResult Function( PassToMe value)  passToMe,required TResult Function( SupportAttacker value)  supportAttacker,required TResult Function( BallChangeOwner value)  ballChangeOwner,}){
final _that = this;
switch (_that) {
case GoHome():
return goHome(_that);case Wait():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GoHome value)?  goHome,TResult? Function( Wait value)?  wait,TResult? Function( PlaceToKickOff value)?  placeToKickOff,TResult? Function( ReceiveBall value)?  receiveBall,TResult? Function( PassToMe value)?  passToMe,TResult? Function( SupportAttacker value)?  supportAttacker,TResult? Function( BallChangeOwner value)?  ballChangeOwner,}){
final _that = this;
switch (_that) {
case GoHome() when goHome != null:
return goHome(_that);case Wait() when wait != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  goHome,TResult Function()?  wait,TResult Function()?  placeToKickOff,TResult Function()?  receiveBall,TResult Function()?  passToMe,TResult Function()?  supportAttacker,TResult Function()?  ballChangeOwner,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GoHome() when goHome != null:
return goHome();case Wait() when wait != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  goHome,required TResult Function()  wait,required TResult Function()  placeToKickOff,required TResult Function()  receiveBall,required TResult Function()  passToMe,required TResult Function()  supportAttacker,required TResult Function()  ballChangeOwner,}) {final _that = this;
switch (_that) {
case GoHome():
return goHome();case Wait():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  goHome,TResult? Function()?  wait,TResult? Function()?  placeToKickOff,TResult? Function()?  receiveBall,TResult? Function()?  passToMe,TResult? Function()?  supportAttacker,TResult? Function()?  ballChangeOwner,}) {final _that = this;
switch (_that) {
case GoHome() when goHome != null:
return goHome();case Wait() when wait != null:
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
