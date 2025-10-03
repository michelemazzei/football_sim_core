// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactical_intents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TacticalIntent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticalIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalIntent()';
}


}

/// @nodoc
class $TacticalIntentCopyWith<$Res>  {
$TacticalIntentCopyWith(TacticalIntent _, $Res Function(TacticalIntent) __);
}


/// Adds pattern-matching-related methods to [TacticalIntent].
extension TacticalIntentPatterns on TacticalIntent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _None value)?  none,TResult Function( _Kickoff value)?  kickoff,TResult Function( _Pressing value)?  pressing,TResult Function( _Attacking value)?  attacking,TResult Function( _Defending value)?  defending,TResult Function( _CoveringZone value)?  coveringZone,TResult Function( _SupportingAttacker value)?  supportingAttacker,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _None() when none != null:
return none(_that);case _Kickoff() when kickoff != null:
return kickoff(_that);case _Pressing() when pressing != null:
return pressing(_that);case _Attacking() when attacking != null:
return attacking(_that);case _Defending() when defending != null:
return defending(_that);case _CoveringZone() when coveringZone != null:
return coveringZone(_that);case _SupportingAttacker() when supportingAttacker != null:
return supportingAttacker(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _None value)  none,required TResult Function( _Kickoff value)  kickoff,required TResult Function( _Pressing value)  pressing,required TResult Function( _Attacking value)  attacking,required TResult Function( _Defending value)  defending,required TResult Function( _CoveringZone value)  coveringZone,required TResult Function( _SupportingAttacker value)  supportingAttacker,}){
final _that = this;
switch (_that) {
case _None():
return none(_that);case _Kickoff():
return kickoff(_that);case _Pressing():
return pressing(_that);case _Attacking():
return attacking(_that);case _Defending():
return defending(_that);case _CoveringZone():
return coveringZone(_that);case _SupportingAttacker():
return supportingAttacker(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _None value)?  none,TResult? Function( _Kickoff value)?  kickoff,TResult? Function( _Pressing value)?  pressing,TResult? Function( _Attacking value)?  attacking,TResult? Function( _Defending value)?  defending,TResult? Function( _CoveringZone value)?  coveringZone,TResult? Function( _SupportingAttacker value)?  supportingAttacker,}){
final _that = this;
switch (_that) {
case _None() when none != null:
return none(_that);case _Kickoff() when kickoff != null:
return kickoff(_that);case _Pressing() when pressing != null:
return pressing(_that);case _Attacking() when attacking != null:
return attacking(_that);case _Defending() when defending != null:
return defending(_that);case _CoveringZone() when coveringZone != null:
return coveringZone(_that);case _SupportingAttacker() when supportingAttacker != null:
return supportingAttacker(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function()?  kickoff,TResult Function()?  pressing,TResult Function()?  attacking,TResult Function()?  defending,TResult Function()?  coveringZone,TResult Function()?  supportingAttacker,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _None() when none != null:
return none();case _Kickoff() when kickoff != null:
return kickoff();case _Pressing() when pressing != null:
return pressing();case _Attacking() when attacking != null:
return attacking();case _Defending() when defending != null:
return defending();case _CoveringZone() when coveringZone != null:
return coveringZone();case _SupportingAttacker() when supportingAttacker != null:
return supportingAttacker();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function()  kickoff,required TResult Function()  pressing,required TResult Function()  attacking,required TResult Function()  defending,required TResult Function()  coveringZone,required TResult Function()  supportingAttacker,}) {final _that = this;
switch (_that) {
case _None():
return none();case _Kickoff():
return kickoff();case _Pressing():
return pressing();case _Attacking():
return attacking();case _Defending():
return defending();case _CoveringZone():
return coveringZone();case _SupportingAttacker():
return supportingAttacker();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function()?  kickoff,TResult? Function()?  pressing,TResult? Function()?  attacking,TResult? Function()?  defending,TResult? Function()?  coveringZone,TResult? Function()?  supportingAttacker,}) {final _that = this;
switch (_that) {
case _None() when none != null:
return none();case _Kickoff() when kickoff != null:
return kickoff();case _Pressing() when pressing != null:
return pressing();case _Attacking() when attacking != null:
return attacking();case _Defending() when defending != null:
return defending();case _CoveringZone() when coveringZone != null:
return coveringZone();case _SupportingAttacker() when supportingAttacker != null:
return supportingAttacker();case _:
  return null;

}
}

}

/// @nodoc


class _None implements TacticalIntent {
  const _None();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _None);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalIntent.none()';
}


}




/// @nodoc


class _Kickoff implements TacticalIntent {
  const _Kickoff();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Kickoff);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalIntent.kickoff()';
}


}




/// @nodoc


class _Pressing implements TacticalIntent {
  const _Pressing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pressing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalIntent.pressing()';
}


}




/// @nodoc


class _Attacking implements TacticalIntent {
  const _Attacking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Attacking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalIntent.attacking()';
}


}




/// @nodoc


class _Defending implements TacticalIntent {
  const _Defending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Defending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalIntent.defending()';
}


}




/// @nodoc


class _CoveringZone implements TacticalIntent {
  const _CoveringZone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoveringZone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalIntent.coveringZone()';
}


}




/// @nodoc


class _SupportingAttacker implements TacticalIntent {
  const _SupportingAttacker();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportingAttacker);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TacticalIntent.supportingAttacker()';
}


}




// dart format on
