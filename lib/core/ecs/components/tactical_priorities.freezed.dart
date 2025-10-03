// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactical_priorities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TacticalPriority {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticalPriority);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalPriority()';
}


}

/// @nodoc
class $TacticalPriorityCopyWith<$Res>  {
$TacticalPriorityCopyWith(TacticalPriority _, $Res Function(TacticalPriority) __);
}


/// Adds pattern-matching-related methods to [TacticalPriority].
extension TacticalPriorityPatterns on TacticalPriority {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Low value)?  low,TResult Function( _Medium value)?  medium,TResult Function( _High value)?  high,TResult Function( _highest value)?  highest,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Low() when low != null:
return low(_that);case _Medium() when medium != null:
return medium(_that);case _High() when high != null:
return high(_that);case _highest() when highest != null:
return highest(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Low value)  low,required TResult Function( _Medium value)  medium,required TResult Function( _High value)  high,required TResult Function( _highest value)  highest,}){
final _that = this;
switch (_that) {
case _Low():
return low(_that);case _Medium():
return medium(_that);case _High():
return high(_that);case _highest():
return highest(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Low value)?  low,TResult? Function( _Medium value)?  medium,TResult? Function( _High value)?  high,TResult? Function( _highest value)?  highest,}){
final _that = this;
switch (_that) {
case _Low() when low != null:
return low(_that);case _Medium() when medium != null:
return medium(_that);case _High() when high != null:
return high(_that);case _highest() when highest != null:
return highest(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  low,TResult Function()?  medium,TResult Function()?  high,TResult Function()?  highest,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Low() when low != null:
return low();case _Medium() when medium != null:
return medium();case _High() when high != null:
return high();case _highest() when highest != null:
return highest();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  low,required TResult Function()  medium,required TResult Function()  high,required TResult Function()  highest,}) {final _that = this;
switch (_that) {
case _Low():
return low();case _Medium():
return medium();case _High():
return high();case _highest():
return highest();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  low,TResult? Function()?  medium,TResult? Function()?  high,TResult? Function()?  highest,}) {final _that = this;
switch (_that) {
case _Low() when low != null:
return low();case _Medium() when medium != null:
return medium();case _High() when high != null:
return high();case _highest() when highest != null:
return highest();case _:
  return null;

}
}

}

/// @nodoc


class _Low extends TacticalPriority {
  const _Low(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Low);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalPriority.low()';
}


}




/// @nodoc


class _Medium extends TacticalPriority {
  const _Medium(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Medium);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalPriority.medium()';
}


}




/// @nodoc


class _High extends TacticalPriority {
  const _High(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _High);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalPriority.high()';
}


}




/// @nodoc


class _highest extends TacticalPriority {
  const _highest(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _highest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalPriority.highest()';
}


}




// dart format on
