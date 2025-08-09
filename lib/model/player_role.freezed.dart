// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerRole {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerRole);
}


@override
int get hashCode => runtimeType.hashCode;



}

/// @nodoc
class $PlayerRoleCopyWith<$Res>  {
$PlayerRoleCopyWith(PlayerRole _, $Res Function(PlayerRole) __);
}


/// Adds pattern-matching-related methods to [PlayerRole].
extension PlayerRolePatterns on PlayerRole {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Goalkeeper value)?  goalkeeper,TResult Function( Defender value)?  defender,TResult Function( Midfielder value)?  midfielder,TResult Function( Attacker value)?  attacker,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Goalkeeper() when goalkeeper != null:
return goalkeeper(_that);case Defender() when defender != null:
return defender(_that);case Midfielder() when midfielder != null:
return midfielder(_that);case Attacker() when attacker != null:
return attacker(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Goalkeeper value)  goalkeeper,required TResult Function( Defender value)  defender,required TResult Function( Midfielder value)  midfielder,required TResult Function( Attacker value)  attacker,}){
final _that = this;
switch (_that) {
case Goalkeeper():
return goalkeeper(_that);case Defender():
return defender(_that);case Midfielder():
return midfielder(_that);case Attacker():
return attacker(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Goalkeeper value)?  goalkeeper,TResult? Function( Defender value)?  defender,TResult? Function( Midfielder value)?  midfielder,TResult? Function( Attacker value)?  attacker,}){
final _that = this;
switch (_that) {
case Goalkeeper() when goalkeeper != null:
return goalkeeper(_that);case Defender() when defender != null:
return defender(_that);case Midfielder() when midfielder != null:
return midfielder(_that);case Attacker() when attacker != null:
return attacker(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  goalkeeper,TResult Function()?  defender,TResult Function()?  midfielder,TResult Function()?  attacker,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Goalkeeper() when goalkeeper != null:
return goalkeeper();case Defender() when defender != null:
return defender();case Midfielder() when midfielder != null:
return midfielder();case Attacker() when attacker != null:
return attacker();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  goalkeeper,required TResult Function()  defender,required TResult Function()  midfielder,required TResult Function()  attacker,}) {final _that = this;
switch (_that) {
case Goalkeeper():
return goalkeeper();case Defender():
return defender();case Midfielder():
return midfielder();case Attacker():
return attacker();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  goalkeeper,TResult? Function()?  defender,TResult? Function()?  midfielder,TResult? Function()?  attacker,}) {final _that = this;
switch (_that) {
case Goalkeeper() when goalkeeper != null:
return goalkeeper();case Defender() when defender != null:
return defender();case Midfielder() when midfielder != null:
return midfielder();case Attacker() when attacker != null:
return attacker();case _:
  return null;

}
}

}

/// @nodoc


class Goalkeeper extends PlayerRole {
  const Goalkeeper(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Goalkeeper);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class Defender extends PlayerRole {
  const Defender(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Defender);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class Midfielder extends PlayerRole {
  const Midfielder(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Midfielder);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class Attacker extends PlayerRole {
  const Attacker(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attacker);
}


@override
int get hashCode => runtimeType.hashCode;



}




// dart format on
