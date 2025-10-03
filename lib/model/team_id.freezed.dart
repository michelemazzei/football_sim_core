// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamId {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamId);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamId()';
}


}

/// @nodoc
class $TeamIdCopyWith<$Res>  {
$TeamIdCopyWith(TeamId _, $Res Function(TeamId) __);
}


/// Adds pattern-matching-related methods to [TeamId].
extension TeamIdPatterns on TeamId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TeamIdHome value)?  home,TResult Function( _TeamIdAway value)?  away,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamIdHome() when home != null:
return home(_that);case _TeamIdAway() when away != null:
return away(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TeamIdHome value)  home,required TResult Function( _TeamIdAway value)  away,}){
final _that = this;
switch (_that) {
case _TeamIdHome():
return home(_that);case _TeamIdAway():
return away(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TeamIdHome value)?  home,TResult? Function( _TeamIdAway value)?  away,}){
final _that = this;
switch (_that) {
case _TeamIdHome() when home != null:
return home(_that);case _TeamIdAway() when away != null:
return away(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  home,TResult Function()?  away,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamIdHome() when home != null:
return home();case _TeamIdAway() when away != null:
return away();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  home,required TResult Function()  away,}) {final _that = this;
switch (_that) {
case _TeamIdHome():
return home();case _TeamIdAway():
return away();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  home,TResult? Function()?  away,}) {final _that = this;
switch (_that) {
case _TeamIdHome() when home != null:
return home();case _TeamIdAway() when away != null:
return away();case _:
  return null;

}
}

}

/// @nodoc


class _TeamIdHome implements TeamId {
  const _TeamIdHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamIdHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamId.home()';
}


}




/// @nodoc


class _TeamIdAway implements TeamId {
  const _TeamIdAway();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamIdAway);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamId.away()';
}


}




// dart format on
