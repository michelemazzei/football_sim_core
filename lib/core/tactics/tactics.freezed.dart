// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Tactic {

 TacticsName get name; TacticalPriority get priority; set priority(TacticalPriority value); TacticalIntent get intent; set intent(TacticalIntent value); Duration? get expiration; set expiration(Duration? value); DateTime? get activatedAt; set activatedAt(DateTime? value); Map<TacticalRole, Zone> get zoneAssignments; set zoneAssignments(Map<TacticalRole, Zone> value);
/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TacticCopyWith<Tactic> get copyWith => _$TacticCopyWithImpl<Tactic>(this as Tactic, _$identity);





@override
String toString() {
  return 'Tactic(name: $name, priority: $priority, intent: $intent, expiration: $expiration, activatedAt: $activatedAt, zoneAssignments: $zoneAssignments)';
}


}

/// @nodoc
abstract mixin class $TacticCopyWith<$Res>  {
  factory $TacticCopyWith(Tactic value, $Res Function(Tactic) _then) = _$TacticCopyWithImpl;
@useResult
$Res call({
 TacticsName name, TacticalPriority priority, TacticalIntent intent, Duration? expiration, DateTime? activatedAt, Map<TacticalRole, Zone> zoneAssignments
});


$TacticsNameCopyWith<$Res> get name;$TacticalPriorityCopyWith<$Res> get priority;$TacticalIntentCopyWith<$Res> get intent;

}
/// @nodoc
class _$TacticCopyWithImpl<$Res>
    implements $TacticCopyWith<$Res> {
  _$TacticCopyWithImpl(this._self, this._then);

  final Tactic _self;
  final $Res Function(Tactic) _then;

/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? priority = null,Object? intent = null,Object? expiration = freezed,Object? activatedAt = freezed,Object? zoneAssignments = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as TacticsName,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TacticalPriority,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as TacticalIntent,expiration: freezed == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as Duration?,activatedAt: freezed == activatedAt ? _self.activatedAt : activatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,zoneAssignments: null == zoneAssignments ? _self.zoneAssignments : zoneAssignments // ignore: cast_nullable_to_non_nullable
as Map<TacticalRole, Zone>,
  ));
}
/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticsNameCopyWith<$Res> get name {
  
  return $TacticsNameCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalPriorityCopyWith<$Res> get priority {
  
  return $TacticalPriorityCopyWith<$Res>(_self.priority, (value) {
    return _then(_self.copyWith(priority: value));
  });
}/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalIntentCopyWith<$Res> get intent {
  
  return $TacticalIntentCopyWith<$Res>(_self.intent, (value) {
    return _then(_self.copyWith(intent: value));
  });
}
}


/// Adds pattern-matching-related methods to [Tactic].
extension TacticPatterns on Tactic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tactic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tactic() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tactic value)  $default,){
final _that = this;
switch (_that) {
case _Tactic():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tactic value)?  $default,){
final _that = this;
switch (_that) {
case _Tactic() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TacticsName name,  TacticalPriority priority,  TacticalIntent intent,  Duration? expiration,  DateTime? activatedAt,  Map<TacticalRole, Zone> zoneAssignments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tactic() when $default != null:
return $default(_that.name,_that.priority,_that.intent,_that.expiration,_that.activatedAt,_that.zoneAssignments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TacticsName name,  TacticalPriority priority,  TacticalIntent intent,  Duration? expiration,  DateTime? activatedAt,  Map<TacticalRole, Zone> zoneAssignments)  $default,) {final _that = this;
switch (_that) {
case _Tactic():
return $default(_that.name,_that.priority,_that.intent,_that.expiration,_that.activatedAt,_that.zoneAssignments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TacticsName name,  TacticalPriority priority,  TacticalIntent intent,  Duration? expiration,  DateTime? activatedAt,  Map<TacticalRole, Zone> zoneAssignments)?  $default,) {final _that = this;
switch (_that) {
case _Tactic() when $default != null:
return $default(_that.name,_that.priority,_that.intent,_that.expiration,_that.activatedAt,_that.zoneAssignments);case _:
  return null;

}
}

}

/// @nodoc


class _Tactic implements Tactic {
   _Tactic({required this.name, this.priority = const TacticalPriority.low(), this.intent = const TacticalIntent.none(), this.expiration, this.activatedAt, required this.zoneAssignments});
  

@override final  TacticsName name;
@override@JsonKey()  TacticalPriority priority;
@override@JsonKey()  TacticalIntent intent;
@override  Duration? expiration;
@override  DateTime? activatedAt;
@override  Map<TacticalRole, Zone> zoneAssignments;

/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TacticCopyWith<_Tactic> get copyWith => __$TacticCopyWithImpl<_Tactic>(this, _$identity);





@override
String toString() {
  return 'Tactic(name: $name, priority: $priority, intent: $intent, expiration: $expiration, activatedAt: $activatedAt, zoneAssignments: $zoneAssignments)';
}


}

/// @nodoc
abstract mixin class _$TacticCopyWith<$Res> implements $TacticCopyWith<$Res> {
  factory _$TacticCopyWith(_Tactic value, $Res Function(_Tactic) _then) = __$TacticCopyWithImpl;
@override @useResult
$Res call({
 TacticsName name, TacticalPriority priority, TacticalIntent intent, Duration? expiration, DateTime? activatedAt, Map<TacticalRole, Zone> zoneAssignments
});


@override $TacticsNameCopyWith<$Res> get name;@override $TacticalPriorityCopyWith<$Res> get priority;@override $TacticalIntentCopyWith<$Res> get intent;

}
/// @nodoc
class __$TacticCopyWithImpl<$Res>
    implements _$TacticCopyWith<$Res> {
  __$TacticCopyWithImpl(this._self, this._then);

  final _Tactic _self;
  final $Res Function(_Tactic) _then;

/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? priority = null,Object? intent = null,Object? expiration = freezed,Object? activatedAt = freezed,Object? zoneAssignments = null,}) {
  return _then(_Tactic(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as TacticsName,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TacticalPriority,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as TacticalIntent,expiration: freezed == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as Duration?,activatedAt: freezed == activatedAt ? _self.activatedAt : activatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,zoneAssignments: null == zoneAssignments ? _self.zoneAssignments : zoneAssignments // ignore: cast_nullable_to_non_nullable
as Map<TacticalRole, Zone>,
  ));
}

/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticsNameCopyWith<$Res> get name {
  
  return $TacticsNameCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalPriorityCopyWith<$Res> get priority {
  
  return $TacticalPriorityCopyWith<$Res>(_self.priority, (value) {
    return _then(_self.copyWith(priority: value));
  });
}/// Create a copy of Tactic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalIntentCopyWith<$Res> get intent {
  
  return $TacticalIntentCopyWith<$Res>(_self.intent, (value) {
    return _then(_self.copyWith(intent: value));
  });
}
}

// dart format on
