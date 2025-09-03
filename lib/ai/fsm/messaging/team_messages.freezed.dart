// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamMessage {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamMessage()';
}


}

/// @nodoc
class $TeamMessageCopyWith<$Res>  {
$TeamMessageCopyWith(TeamMessage _, $Res Function(TeamMessage) __);
}


/// Adds pattern-matching-related methods to [TeamMessage].
extension TeamMessagePatterns on TeamMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Attacking value)?  attacking,TResult Function( Defending value)?  defending,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Attacking() when attacking != null:
return attacking(_that);case Defending() when defending != null:
return defending(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Attacking value)  attacking,required TResult Function( Defending value)  defending,}){
final _that = this;
switch (_that) {
case Attacking():
return attacking(_that);case Defending():
return defending(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Attacking value)?  attacking,TResult? Function( Defending value)?  defending,}){
final _that = this;
switch (_that) {
case Attacking() when attacking != null:
return attacking(_that);case Defending() when defending != null:
return defending(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  attacking,TResult Function()?  defending,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Attacking() when attacking != null:
return attacking();case Defending() when defending != null:
return defending();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  attacking,required TResult Function()  defending,}) {final _that = this;
switch (_that) {
case Attacking():
return attacking();case Defending():
return defending();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  attacking,TResult? Function()?  defending,}) {final _that = this;
switch (_that) {
case Attacking() when attacking != null:
return attacking();case Defending() when defending != null:
return defending();case _:
  return null;

}
}

}

/// @nodoc


class Attacking implements TeamMessage {
  const Attacking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attacking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamMessage.attacking()';
}


}




/// @nodoc


class Defending implements TeamMessage {
  const Defending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Defending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamMessage.defending()';
}


}




// dart format on
