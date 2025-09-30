// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessageOutcome {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageOutcome()';
}


}

/// @nodoc
class $MessageOutcomeCopyWith<$Res>  {
$MessageOutcomeCopyWith(MessageOutcome _, $Res Function(MessageOutcome) __);
}


/// Adds pattern-matching-related methods to [MessageOutcome].
extension MessageOutcomePatterns on MessageOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Consumed value)?  consumed,TResult Function( Ignored value)?  ignored,TResult Function( Escalated value)?  escalated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Consumed() when consumed != null:
return consumed(_that);case Ignored() when ignored != null:
return ignored(_that);case Escalated() when escalated != null:
return escalated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Consumed value)  consumed,required TResult Function( Ignored value)  ignored,required TResult Function( Escalated value)  escalated,}){
final _that = this;
switch (_that) {
case Consumed():
return consumed(_that);case Ignored():
return ignored(_that);case Escalated():
return escalated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Consumed value)?  consumed,TResult? Function( Ignored value)?  ignored,TResult? Function( Escalated value)?  escalated,}){
final _that = this;
switch (_that) {
case Consumed() when consumed != null:
return consumed(_that);case Ignored() when ignored != null:
return ignored(_that);case Escalated() when escalated != null:
return escalated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  consumed,TResult Function()?  ignored,TResult Function()?  escalated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Consumed() when consumed != null:
return consumed();case Ignored() when ignored != null:
return ignored();case Escalated() when escalated != null:
return escalated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  consumed,required TResult Function()  ignored,required TResult Function()  escalated,}) {final _that = this;
switch (_that) {
case Consumed():
return consumed();case Ignored():
return ignored();case Escalated():
return escalated();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  consumed,TResult? Function()?  ignored,TResult? Function()?  escalated,}) {final _that = this;
switch (_that) {
case Consumed() when consumed != null:
return consumed();case Ignored() when ignored != null:
return ignored();case Escalated() when escalated != null:
return escalated();case _:
  return null;

}
}

}

/// @nodoc


class Consumed implements MessageOutcome {
  const Consumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Consumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageOutcome.consumed()';
}


}




/// @nodoc


class Ignored implements MessageOutcome {
  const Ignored();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ignored);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageOutcome.ignored()';
}


}




/// @nodoc


class Escalated implements MessageOutcome {
  const Escalated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Escalated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageOutcome.escalated()';
}


}




// dart format on
