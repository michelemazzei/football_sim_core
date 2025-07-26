// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pitch_role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PitchRole {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PitchRole);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchRole()';
}


}

/// @nodoc
class $PitchRoleCopyWith<$Res>  {
$PitchRoleCopyWith(PitchRole _, $Res Function(PitchRole) __);
}


/// Adds pattern-matching-related methods to [PitchRole].
extension PitchRolePatterns on PitchRole {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RoleDefender value)?  d,TResult Function( RoleDefensiveMidfielder value)?  dm,TResult Function( RoleMidfielder value)?  m,TResult Function( RoleAttackingMidfielder value)?  am,TResult Function( RoleForward value)?  f,TResult Function( RoleGoalkeeper value)?  gk,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoleDefender() when d != null:
return d(_that);case RoleDefensiveMidfielder() when dm != null:
return dm(_that);case RoleMidfielder() when m != null:
return m(_that);case RoleAttackingMidfielder() when am != null:
return am(_that);case RoleForward() when f != null:
return f(_that);case RoleGoalkeeper() when gk != null:
return gk(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RoleDefender value)  d,required TResult Function( RoleDefensiveMidfielder value)  dm,required TResult Function( RoleMidfielder value)  m,required TResult Function( RoleAttackingMidfielder value)  am,required TResult Function( RoleForward value)  f,required TResult Function( RoleGoalkeeper value)  gk,}){
final _that = this;
switch (_that) {
case RoleDefender():
return d(_that);case RoleDefensiveMidfielder():
return dm(_that);case RoleMidfielder():
return m(_that);case RoleAttackingMidfielder():
return am(_that);case RoleForward():
return f(_that);case RoleGoalkeeper():
return gk(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RoleDefender value)?  d,TResult? Function( RoleDefensiveMidfielder value)?  dm,TResult? Function( RoleMidfielder value)?  m,TResult? Function( RoleAttackingMidfielder value)?  am,TResult? Function( RoleForward value)?  f,TResult? Function( RoleGoalkeeper value)?  gk,}){
final _that = this;
switch (_that) {
case RoleDefender() when d != null:
return d(_that);case RoleDefensiveMidfielder() when dm != null:
return dm(_that);case RoleMidfielder() when m != null:
return m(_that);case RoleAttackingMidfielder() when am != null:
return am(_that);case RoleForward() when f != null:
return f(_that);case RoleGoalkeeper() when gk != null:
return gk(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  d,TResult Function()?  dm,TResult Function()?  m,TResult Function()?  am,TResult Function()?  f,TResult Function()?  gk,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoleDefender() when d != null:
return d();case RoleDefensiveMidfielder() when dm != null:
return dm();case RoleMidfielder() when m != null:
return m();case RoleAttackingMidfielder() when am != null:
return am();case RoleForward() when f != null:
return f();case RoleGoalkeeper() when gk != null:
return gk();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  d,required TResult Function()  dm,required TResult Function()  m,required TResult Function()  am,required TResult Function()  f,required TResult Function()  gk,}) {final _that = this;
switch (_that) {
case RoleDefender():
return d();case RoleDefensiveMidfielder():
return dm();case RoleMidfielder():
return m();case RoleAttackingMidfielder():
return am();case RoleForward():
return f();case RoleGoalkeeper():
return gk();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  d,TResult? Function()?  dm,TResult? Function()?  m,TResult? Function()?  am,TResult? Function()?  f,TResult? Function()?  gk,}) {final _that = this;
switch (_that) {
case RoleDefender() when d != null:
return d();case RoleDefensiveMidfielder() when dm != null:
return dm();case RoleMidfielder() when m != null:
return m();case RoleAttackingMidfielder() when am != null:
return am();case RoleForward() when f != null:
return f();case RoleGoalkeeper() when gk != null:
return gk();case _:
  return null;

}
}

}

/// @nodoc


class RoleDefender extends PitchRole {
  const RoleDefender(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleDefender);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchRole.d()';
}


}




/// @nodoc


class RoleDefensiveMidfielder extends PitchRole {
  const RoleDefensiveMidfielder(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleDefensiveMidfielder);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchRole.dm()';
}


}




/// @nodoc


class RoleMidfielder extends PitchRole {
  const RoleMidfielder(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleMidfielder);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchRole.m()';
}


}




/// @nodoc


class RoleAttackingMidfielder extends PitchRole {
  const RoleAttackingMidfielder(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleAttackingMidfielder);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchRole.am()';
}


}




/// @nodoc


class RoleForward extends PitchRole {
  const RoleForward(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleForward);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchRole.f()';
}


}




/// @nodoc


class RoleGoalkeeper extends PitchRole {
  const RoleGoalkeeper(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleGoalkeeper);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchRole.gk()';
}


}




// dart format on
