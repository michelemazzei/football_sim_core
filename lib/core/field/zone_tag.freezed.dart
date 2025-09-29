// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ZoneTag {

 String get name;
/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneTagCopyWith<ZoneTag> get copyWith => _$ZoneTagCopyWithImpl<ZoneTag>(this as ZoneTag, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneTag&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ZoneTag(name: $name)';
}


}

/// @nodoc
abstract mixin class $ZoneTagCopyWith<$Res>  {
  factory $ZoneTagCopyWith(ZoneTag value, $Res Function(ZoneTag) _then) = _$ZoneTagCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$ZoneTagCopyWithImpl<$Res>
    implements $ZoneTagCopyWith<$Res> {
  _$ZoneTagCopyWithImpl(this._self, this._then);

  final ZoneTag _self;
  final $Res Function(ZoneTag) _then;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoneTag].
extension ZoneTagPatterns on ZoneTag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneTag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneTag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneTag value)  $default,){
final _that = this;
switch (_that) {
case _ZoneTag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneTag value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneTag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneTag() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _ZoneTag():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _ZoneTag() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _ZoneTag implements ZoneTag {
   _ZoneTag(this.name);
  

@override final  String name;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneTagCopyWith<_ZoneTag> get copyWith => __$ZoneTagCopyWithImpl<_ZoneTag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneTag&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ZoneTag(name: $name)';
}


}

/// @nodoc
abstract mixin class _$ZoneTagCopyWith<$Res> implements $ZoneTagCopyWith<$Res> {
  factory _$ZoneTagCopyWith(_ZoneTag value, $Res Function(_ZoneTag) _then) = __$ZoneTagCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$ZoneTagCopyWithImpl<$Res>
    implements _$ZoneTagCopyWith<$Res> {
  __$ZoneTagCopyWithImpl(this._self, this._then);

  final _ZoneTag _self;
  final $Res Function(_ZoneTag) _then;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_ZoneTag(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
