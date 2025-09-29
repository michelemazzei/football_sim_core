// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ZoneType {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ZoneType()';
}


}

/// @nodoc
class $ZoneTypeCopyWith<$Res>  {
$ZoneTypeCopyWith(ZoneType _, $Res Function(ZoneType) __);
}


/// Adds pattern-matching-related methods to [ZoneType].
extension ZoneTypePatterns on ZoneType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DefensiveZone value)?  defensive,TResult Function( MildfieldZone value)?  mildfield,TResult Function( AttackingZone value)?  attacking,TResult Function( SpecialZone value)?  special,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DefensiveZone() when defensive != null:
return defensive(_that);case MildfieldZone() when mildfield != null:
return mildfield(_that);case AttackingZone() when attacking != null:
return attacking(_that);case SpecialZone() when special != null:
return special(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DefensiveZone value)  defensive,required TResult Function( MildfieldZone value)  mildfield,required TResult Function( AttackingZone value)  attacking,required TResult Function( SpecialZone value)  special,}){
final _that = this;
switch (_that) {
case DefensiveZone():
return defensive(_that);case MildfieldZone():
return mildfield(_that);case AttackingZone():
return attacking(_that);case SpecialZone():
return special(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DefensiveZone value)?  defensive,TResult? Function( MildfieldZone value)?  mildfield,TResult? Function( AttackingZone value)?  attacking,TResult? Function( SpecialZone value)?  special,}){
final _that = this;
switch (_that) {
case DefensiveZone() when defensive != null:
return defensive(_that);case MildfieldZone() when mildfield != null:
return mildfield(_that);case AttackingZone() when attacking != null:
return attacking(_that);case SpecialZone() when special != null:
return special(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  defensive,TResult Function()?  mildfield,TResult Function()?  attacking,TResult Function()?  special,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DefensiveZone() when defensive != null:
return defensive();case MildfieldZone() when mildfield != null:
return mildfield();case AttackingZone() when attacking != null:
return attacking();case SpecialZone() when special != null:
return special();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  defensive,required TResult Function()  mildfield,required TResult Function()  attacking,required TResult Function()  special,}) {final _that = this;
switch (_that) {
case DefensiveZone():
return defensive();case MildfieldZone():
return mildfield();case AttackingZone():
return attacking();case SpecialZone():
return special();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  defensive,TResult? Function()?  mildfield,TResult? Function()?  attacking,TResult? Function()?  special,}) {final _that = this;
switch (_that) {
case DefensiveZone() when defensive != null:
return defensive();case MildfieldZone() when mildfield != null:
return mildfield();case AttackingZone() when attacking != null:
return attacking();case SpecialZone() when special != null:
return special();case _:
  return null;

}
}

}

/// @nodoc


class DefensiveZone implements ZoneType {
  const DefensiveZone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefensiveZone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ZoneType.defensive()';
}


}




/// @nodoc


class MildfieldZone implements ZoneType {
  const MildfieldZone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MildfieldZone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ZoneType.mildfield()';
}


}




/// @nodoc


class AttackingZone implements ZoneType {
  const AttackingZone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttackingZone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ZoneType.attacking()';
}


}




/// @nodoc


class SpecialZone implements ZoneType {
  const SpecialZone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialZone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ZoneType.special()';
}


}




// dart format on
