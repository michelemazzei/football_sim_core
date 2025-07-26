// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pitch_side.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PitchSide {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PitchSide);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchSide()';
}


}

/// @nodoc
class $PitchSideCopyWith<$Res>  {
$PitchSideCopyWith(PitchSide _, $Res Function(PitchSide) __);
}


/// Adds pattern-matching-related methods to [PitchSide].
extension PitchSidePatterns on PitchSide {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SideRight value)?  r,TResult Function( SideLeft value)?  l,TResult Function( SideCenter value)?  c,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SideRight() when r != null:
return r(_that);case SideLeft() when l != null:
return l(_that);case SideCenter() when c != null:
return c(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SideRight value)  r,required TResult Function( SideLeft value)  l,required TResult Function( SideCenter value)  c,}){
final _that = this;
switch (_that) {
case SideRight():
return r(_that);case SideLeft():
return l(_that);case SideCenter():
return c(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SideRight value)?  r,TResult? Function( SideLeft value)?  l,TResult? Function( SideCenter value)?  c,}){
final _that = this;
switch (_that) {
case SideRight() when r != null:
return r(_that);case SideLeft() when l != null:
return l(_that);case SideCenter() when c != null:
return c(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  r,TResult Function()?  l,TResult Function()?  c,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SideRight() when r != null:
return r();case SideLeft() when l != null:
return l();case SideCenter() when c != null:
return c();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  r,required TResult Function()  l,required TResult Function()  c,}) {final _that = this;
switch (_that) {
case SideRight():
return r();case SideLeft():
return l();case SideCenter():
return c();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  r,TResult? Function()?  l,TResult? Function()?  c,}) {final _that = this;
switch (_that) {
case SideRight() when r != null:
return r();case SideLeft() when l != null:
return l();case SideCenter() when c != null:
return c();case _:
  return null;

}
}

}

/// @nodoc


class SideRight extends PitchSide {
  const SideRight(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SideRight);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchSide.r()';
}


}




/// @nodoc


class SideLeft extends PitchSide {
  const SideLeft(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SideLeft);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchSide.l()';
}


}




/// @nodoc


class SideCenter extends PitchSide {
  const SideCenter(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SideCenter);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PitchSide.c()';
}


}




// dart format on
