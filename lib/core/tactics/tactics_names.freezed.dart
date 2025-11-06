// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactics_names.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TacticsName {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticsName);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticsName()';
}


}

/// @nodoc
class $TacticsNameCopyWith<$Res>  {
$TacticsNameCopyWith(TacticsName _, $Res Function(TacticsName) __);
}


/// Adds pattern-matching-related methods to [TacticsName].
extension TacticsNamePatterns on TacticsName {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ZoneTactic value)?  zoneTactics,TResult Function( BallFollowTactic value)?  ballFollowTactic,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ZoneTactic() when zoneTactics != null:
return zoneTactics(_that);case BallFollowTactic() when ballFollowTactic != null:
return ballFollowTactic(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ZoneTactic value)  zoneTactics,required TResult Function( BallFollowTactic value)  ballFollowTactic,}){
final _that = this;
switch (_that) {
case ZoneTactic():
return zoneTactics(_that);case BallFollowTactic():
return ballFollowTactic(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ZoneTactic value)?  zoneTactics,TResult? Function( BallFollowTactic value)?  ballFollowTactic,}){
final _that = this;
switch (_that) {
case ZoneTactic() when zoneTactics != null:
return zoneTactics(_that);case BallFollowTactic() when ballFollowTactic != null:
return ballFollowTactic(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  zoneTactics,TResult Function()?  ballFollowTactic,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ZoneTactic() when zoneTactics != null:
return zoneTactics();case BallFollowTactic() when ballFollowTactic != null:
return ballFollowTactic();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  zoneTactics,required TResult Function()  ballFollowTactic,}) {final _that = this;
switch (_that) {
case ZoneTactic():
return zoneTactics();case BallFollowTactic():
return ballFollowTactic();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  zoneTactics,TResult? Function()?  ballFollowTactic,}) {final _that = this;
switch (_that) {
case ZoneTactic() when zoneTactics != null:
return zoneTactics();case BallFollowTactic() when ballFollowTactic != null:
return ballFollowTactic();case _:
  return null;

}
}

}

/// @nodoc


class ZoneTactic implements TacticsName {
  const ZoneTactic();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneTactic);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticsName.zoneTactics()';
}


}




/// @nodoc


class BallFollowTactic implements TacticsName {
  const BallFollowTactic();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallFollowTactic);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticsName.ballFollowTactic()';
}


}




// dart format on
