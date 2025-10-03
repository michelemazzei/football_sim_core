// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactical_setup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TacticalSetup {

 Formation get formation; TacticalZoneMap get map;
/// Create a copy of TacticalSetup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TacticalSetupCopyWith<TacticalSetup> get copyWith => _$TacticalSetupCopyWithImpl<TacticalSetup>(this as TacticalSetup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticalSetup&&(identical(other.formation, formation) || other.formation == formation)&&(identical(other.map, map) || other.map == map));
}


@override
int get hashCode => Object.hash(runtimeType,formation,map);

@override
String toString() {
  return 'TacticalSetup(formation: $formation, map: $map)';
}


}

/// @nodoc
abstract mixin class $TacticalSetupCopyWith<$Res>  {
  factory $TacticalSetupCopyWith(TacticalSetup value, $Res Function(TacticalSetup) _then) = _$TacticalSetupCopyWithImpl;
@useResult
$Res call({
 Formation formation, TacticalZoneMap map
});




}
/// @nodoc
class _$TacticalSetupCopyWithImpl<$Res>
    implements $TacticalSetupCopyWith<$Res> {
  _$TacticalSetupCopyWithImpl(this._self, this._then);

  final TacticalSetup _self;
  final $Res Function(TacticalSetup) _then;

/// Create a copy of TacticalSetup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formation = null,Object? map = null,}) {
  return _then(_self.copyWith(
formation: null == formation ? _self.formation : formation // ignore: cast_nullable_to_non_nullable
as Formation,map: null == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as TacticalZoneMap,
  ));
}

}


/// Adds pattern-matching-related methods to [TacticalSetup].
extension TacticalSetupPatterns on TacticalSetup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _442 value)?  formation442,TResult Function( _433 value)?  formation433,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _442() when formation442 != null:
return formation442(_that);case _433() when formation433 != null:
return formation433(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _442 value)  formation442,required TResult Function( _433 value)  formation433,}){
final _that = this;
switch (_that) {
case _442():
return formation442(_that);case _433():
return formation433(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _442 value)?  formation442,TResult? Function( _433 value)?  formation433,}){
final _that = this;
switch (_that) {
case _442() when formation442 != null:
return formation442(_that);case _433() when formation433 != null:
return formation433(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Formation formation,  TacticalZoneMap map)?  formation442,TResult Function( Formation formation,  TacticalZoneMap map)?  formation433,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _442() when formation442 != null:
return formation442(_that.formation,_that.map);case _433() when formation433 != null:
return formation433(_that.formation,_that.map);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Formation formation,  TacticalZoneMap map)  formation442,required TResult Function( Formation formation,  TacticalZoneMap map)  formation433,}) {final _that = this;
switch (_that) {
case _442():
return formation442(_that.formation,_that.map);case _433():
return formation433(_that.formation,_that.map);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Formation formation,  TacticalZoneMap map)?  formation442,TResult? Function( Formation formation,  TacticalZoneMap map)?  formation433,}) {final _that = this;
switch (_that) {
case _442() when formation442 != null:
return formation442(_that.formation,_that.map);case _433() when formation433 != null:
return formation433(_that.formation,_that.map);case _:
  return null;

}
}

}

/// @nodoc


class _442 implements TacticalSetup {
  const _442({required this.formation, required this.map});
  

@override final  Formation formation;
@override final  TacticalZoneMap map;

/// Create a copy of TacticalSetup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$442CopyWith<_442> get copyWith => __$442CopyWithImpl<_442>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _442&&(identical(other.formation, formation) || other.formation == formation)&&(identical(other.map, map) || other.map == map));
}


@override
int get hashCode => Object.hash(runtimeType,formation,map);

@override
String toString() {
  return 'TacticalSetup.formation442(formation: $formation, map: $map)';
}


}

/// @nodoc
abstract mixin class _$442CopyWith<$Res> implements $TacticalSetupCopyWith<$Res> {
  factory _$442CopyWith(_442 value, $Res Function(_442) _then) = __$442CopyWithImpl;
@override @useResult
$Res call({
 Formation formation, TacticalZoneMap map
});




}
/// @nodoc
class __$442CopyWithImpl<$Res>
    implements _$442CopyWith<$Res> {
  __$442CopyWithImpl(this._self, this._then);

  final _442 _self;
  final $Res Function(_442) _then;

/// Create a copy of TacticalSetup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formation = null,Object? map = null,}) {
  return _then(_442(
formation: null == formation ? _self.formation : formation // ignore: cast_nullable_to_non_nullable
as Formation,map: null == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as TacticalZoneMap,
  ));
}


}

/// @nodoc


class _433 implements TacticalSetup {
  const _433({required this.formation, required this.map});
  

@override final  Formation formation;
@override final  TacticalZoneMap map;

/// Create a copy of TacticalSetup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$433CopyWith<_433> get copyWith => __$433CopyWithImpl<_433>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _433&&(identical(other.formation, formation) || other.formation == formation)&&(identical(other.map, map) || other.map == map));
}


@override
int get hashCode => Object.hash(runtimeType,formation,map);

@override
String toString() {
  return 'TacticalSetup.formation433(formation: $formation, map: $map)';
}


}

/// @nodoc
abstract mixin class _$433CopyWith<$Res> implements $TacticalSetupCopyWith<$Res> {
  factory _$433CopyWith(_433 value, $Res Function(_433) _then) = __$433CopyWithImpl;
@override @useResult
$Res call({
 Formation formation, TacticalZoneMap map
});




}
/// @nodoc
class __$433CopyWithImpl<$Res>
    implements _$433CopyWith<$Res> {
  __$433CopyWithImpl(this._self, this._then);

  final _433 _self;
  final $Res Function(_433) _then;

/// Create a copy of TacticalSetup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formation = null,Object? map = null,}) {
  return _then(_433(
formation: null == formation ? _self.formation : formation // ignore: cast_nullable_to_non_nullable
as Formation,map: null == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as TacticalZoneMap,
  ));
}


}

// dart format on
