// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactical_role_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TacticalRoleComponent {

 TacticalRole get role;
/// Create a copy of TacticalRoleComponent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TacticalRoleComponentCopyWith<TacticalRoleComponent> get copyWith => _$TacticalRoleComponentCopyWithImpl<TacticalRoleComponent>(this as TacticalRoleComponent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticalRoleComponent&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,role);

@override
String toString() {
  return 'TacticalRoleComponent(role: $role)';
}


}

/// @nodoc
abstract mixin class $TacticalRoleComponentCopyWith<$Res>  {
  factory $TacticalRoleComponentCopyWith(TacticalRoleComponent value, $Res Function(TacticalRoleComponent) _then) = _$TacticalRoleComponentCopyWithImpl;
@useResult
$Res call({
 TacticalRole role
});


$TacticalRoleCopyWith<$Res> get role;

}
/// @nodoc
class _$TacticalRoleComponentCopyWithImpl<$Res>
    implements $TacticalRoleComponentCopyWith<$Res> {
  _$TacticalRoleComponentCopyWithImpl(this._self, this._then);

  final TacticalRoleComponent _self;
  final $Res Function(TacticalRoleComponent) _then;

/// Create a copy of TacticalRoleComponent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as TacticalRole,
  ));
}
/// Create a copy of TacticalRoleComponent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalRoleCopyWith<$Res> get role {
  
  return $TacticalRoleCopyWith<$Res>(_self.role, (value) {
    return _then(_self.copyWith(role: value));
  });
}
}


/// Adds pattern-matching-related methods to [TacticalRoleComponent].
extension TacticalRoleComponentPatterns on TacticalRoleComponent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TacticalRoleComponent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TacticalRoleComponent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TacticalRoleComponent value)  $default,){
final _that = this;
switch (_that) {
case _TacticalRoleComponent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TacticalRoleComponent value)?  $default,){
final _that = this;
switch (_that) {
case _TacticalRoleComponent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TacticalRole role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TacticalRoleComponent() when $default != null:
return $default(_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TacticalRole role)  $default,) {final _that = this;
switch (_that) {
case _TacticalRoleComponent():
return $default(_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TacticalRole role)?  $default,) {final _that = this;
switch (_that) {
case _TacticalRoleComponent() when $default != null:
return $default(_that.role);case _:
  return null;

}
}

}

/// @nodoc


class _TacticalRoleComponent implements TacticalRoleComponent {
  const _TacticalRoleComponent({required this.role});
  

@override final  TacticalRole role;

/// Create a copy of TacticalRoleComponent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TacticalRoleComponentCopyWith<_TacticalRoleComponent> get copyWith => __$TacticalRoleComponentCopyWithImpl<_TacticalRoleComponent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TacticalRoleComponent&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,role);

@override
String toString() {
  return 'TacticalRoleComponent(role: $role)';
}


}

/// @nodoc
abstract mixin class _$TacticalRoleComponentCopyWith<$Res> implements $TacticalRoleComponentCopyWith<$Res> {
  factory _$TacticalRoleComponentCopyWith(_TacticalRoleComponent value, $Res Function(_TacticalRoleComponent) _then) = __$TacticalRoleComponentCopyWithImpl;
@override @useResult
$Res call({
 TacticalRole role
});


@override $TacticalRoleCopyWith<$Res> get role;

}
/// @nodoc
class __$TacticalRoleComponentCopyWithImpl<$Res>
    implements _$TacticalRoleComponentCopyWith<$Res> {
  __$TacticalRoleComponentCopyWithImpl(this._self, this._then);

  final _TacticalRoleComponent _self;
  final $Res Function(_TacticalRoleComponent) _then;

/// Create a copy of TacticalRoleComponent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,}) {
  return _then(_TacticalRoleComponent(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as TacticalRole,
  ));
}

/// Create a copy of TacticalRoleComponent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalRoleCopyWith<$Res> get role {
  
  return $TacticalRoleCopyWith<$Res>(_self.role, (value) {
    return _then(_self.copyWith(role: value));
  });
}
}

// dart format on
