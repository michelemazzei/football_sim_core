// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_phases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GamePhase {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamePhase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamePhase()';
}


}

/// @nodoc
class $GamePhaseCopyWith<$Res>  {
$GamePhaseCopyWith(GamePhase _, $Res Function(GamePhase) __);
}


/// Adds pattern-matching-related methods to [GamePhase].
extension GamePhasePatterns on GamePhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BuildUpPhase value)?  buildUp,TResult Function( PossessionPhase value)?  possession,TResult Function( TrasitionPhase value)?  transition,TResult Function( DefensePhase value)?  defense,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BuildUpPhase() when buildUp != null:
return buildUp(_that);case PossessionPhase() when possession != null:
return possession(_that);case TrasitionPhase() when transition != null:
return transition(_that);case DefensePhase() when defense != null:
return defense(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BuildUpPhase value)  buildUp,required TResult Function( PossessionPhase value)  possession,required TResult Function( TrasitionPhase value)  transition,required TResult Function( DefensePhase value)  defense,}){
final _that = this;
switch (_that) {
case BuildUpPhase():
return buildUp(_that);case PossessionPhase():
return possession(_that);case TrasitionPhase():
return transition(_that);case DefensePhase():
return defense(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BuildUpPhase value)?  buildUp,TResult? Function( PossessionPhase value)?  possession,TResult? Function( TrasitionPhase value)?  transition,TResult? Function( DefensePhase value)?  defense,}){
final _that = this;
switch (_that) {
case BuildUpPhase() when buildUp != null:
return buildUp(_that);case PossessionPhase() when possession != null:
return possession(_that);case TrasitionPhase() when transition != null:
return transition(_that);case DefensePhase() when defense != null:
return defense(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  buildUp,TResult Function()?  possession,TResult Function()?  transition,TResult Function()?  defense,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BuildUpPhase() when buildUp != null:
return buildUp();case PossessionPhase() when possession != null:
return possession();case TrasitionPhase() when transition != null:
return transition();case DefensePhase() when defense != null:
return defense();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  buildUp,required TResult Function()  possession,required TResult Function()  transition,required TResult Function()  defense,}) {final _that = this;
switch (_that) {
case BuildUpPhase():
return buildUp();case PossessionPhase():
return possession();case TrasitionPhase():
return transition();case DefensePhase():
return defense();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  buildUp,TResult? Function()?  possession,TResult? Function()?  transition,TResult? Function()?  defense,}) {final _that = this;
switch (_that) {
case BuildUpPhase() when buildUp != null:
return buildUp();case PossessionPhase() when possession != null:
return possession();case TrasitionPhase() when transition != null:
return transition();case DefensePhase() when defense != null:
return defense();case _:
  return null;

}
}

}

/// @nodoc


class BuildUpPhase implements GamePhase {
  const BuildUpPhase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildUpPhase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamePhase.buildUp()';
}


}




/// @nodoc


class PossessionPhase implements GamePhase {
  const PossessionPhase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PossessionPhase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamePhase.possession()';
}


}




/// @nodoc


class TrasitionPhase implements GamePhase {
  const TrasitionPhase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrasitionPhase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamePhase.transition()';
}


}




/// @nodoc


class DefensePhase implements GamePhase {
  const DefensePhase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefensePhase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamePhase.defense()';
}


}




// dart format on
