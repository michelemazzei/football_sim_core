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

 String? get name;
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
name: null == name ? _self.name! : name // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneTag value)?  $default,{TResult Function( GoalTag value)?  goal,TResult Function( PenaltyTag value)?  penalty,TResult Function( LeftTag value)?  left,TResult Function( CenterTag value)?  center,TResult Function( RightTag value)?  right,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GoalTag() when goal != null:
return goal(_that);case PenaltyTag() when penalty != null:
return penalty(_that);case LeftTag() when left != null:
return left(_that);case CenterTag() when center != null:
return center(_that);case RightTag() when right != null:
return right(_that);case _ZoneTag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneTag value)  $default,{required TResult Function( GoalTag value)  goal,required TResult Function( PenaltyTag value)  penalty,required TResult Function( LeftTag value)  left,required TResult Function( CenterTag value)  center,required TResult Function( RightTag value)  right,}){
final _that = this;
switch (_that) {
case GoalTag():
return goal(_that);case PenaltyTag():
return penalty(_that);case LeftTag():
return left(_that);case CenterTag():
return center(_that);case RightTag():
return right(_that);case _ZoneTag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneTag value)?  $default,{TResult? Function( GoalTag value)?  goal,TResult? Function( PenaltyTag value)?  penalty,TResult? Function( LeftTag value)?  left,TResult? Function( CenterTag value)?  center,TResult? Function( RightTag value)?  right,}){
final _that = this;
switch (_that) {
case GoalTag() when goal != null:
return goal(_that);case PenaltyTag() when penalty != null:
return penalty(_that);case LeftTag() when left != null:
return left(_that);case CenterTag() when center != null:
return center(_that);case RightTag() when right != null:
return right(_that);case _ZoneTag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{TResult Function( String? name)?  goal,TResult Function( String? name)?  penalty,TResult Function( String? name)?  left,TResult Function( String? name)?  center,TResult Function( String? name)?  right,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GoalTag() when goal != null:
return goal(_that.name);case PenaltyTag() when penalty != null:
return penalty(_that.name);case LeftTag() when left != null:
return left(_that.name);case CenterTag() when center != null:
return center(_that.name);case RightTag() when right != null:
return right(_that.name);case _ZoneTag() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,{required TResult Function( String? name)  goal,required TResult Function( String? name)  penalty,required TResult Function( String? name)  left,required TResult Function( String? name)  center,required TResult Function( String? name)  right,}) {final _that = this;
switch (_that) {
case GoalTag():
return goal(_that.name);case PenaltyTag():
return penalty(_that.name);case LeftTag():
return left(_that.name);case CenterTag():
return center(_that.name);case RightTag():
return right(_that.name);case _ZoneTag():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,{TResult? Function( String? name)?  goal,TResult? Function( String? name)?  penalty,TResult? Function( String? name)?  left,TResult? Function( String? name)?  center,TResult? Function( String? name)?  right,}) {final _that = this;
switch (_that) {
case GoalTag() when goal != null:
return goal(_that.name);case PenaltyTag() when penalty != null:
return penalty(_that.name);case LeftTag() when left != null:
return left(_that.name);case CenterTag() when center != null:
return center(_that.name);case RightTag() when right != null:
return right(_that.name);case _ZoneTag() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class GoalTag implements ZoneTag {
   GoalTag({this.name = 'GOAL'});
  

@override@JsonKey() final  String? name;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalTagCopyWith<GoalTag> get copyWith => _$GoalTagCopyWithImpl<GoalTag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalTag&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ZoneTag.goal(name: $name)';
}


}

/// @nodoc
abstract mixin class $GoalTagCopyWith<$Res> implements $ZoneTagCopyWith<$Res> {
  factory $GoalTagCopyWith(GoalTag value, $Res Function(GoalTag) _then) = _$GoalTagCopyWithImpl;
@override @useResult
$Res call({
 String? name
});




}
/// @nodoc
class _$GoalTagCopyWithImpl<$Res>
    implements $GoalTagCopyWith<$Res> {
  _$GoalTagCopyWithImpl(this._self, this._then);

  final GoalTag _self;
  final $Res Function(GoalTag) _then;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(GoalTag(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PenaltyTag implements ZoneTag {
   PenaltyTag({this.name = 'PENALTY'});
  

@override@JsonKey() final  String? name;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenaltyTagCopyWith<PenaltyTag> get copyWith => _$PenaltyTagCopyWithImpl<PenaltyTag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenaltyTag&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ZoneTag.penalty(name: $name)';
}


}

/// @nodoc
abstract mixin class $PenaltyTagCopyWith<$Res> implements $ZoneTagCopyWith<$Res> {
  factory $PenaltyTagCopyWith(PenaltyTag value, $Res Function(PenaltyTag) _then) = _$PenaltyTagCopyWithImpl;
@override @useResult
$Res call({
 String? name
});




}
/// @nodoc
class _$PenaltyTagCopyWithImpl<$Res>
    implements $PenaltyTagCopyWith<$Res> {
  _$PenaltyTagCopyWithImpl(this._self, this._then);

  final PenaltyTag _self;
  final $Res Function(PenaltyTag) _then;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(PenaltyTag(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LeftTag implements ZoneTag {
   LeftTag({this.name = 'LEFT'});
  

@override@JsonKey() final  String? name;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeftTagCopyWith<LeftTag> get copyWith => _$LeftTagCopyWithImpl<LeftTag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeftTag&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ZoneTag.left(name: $name)';
}


}

/// @nodoc
abstract mixin class $LeftTagCopyWith<$Res> implements $ZoneTagCopyWith<$Res> {
  factory $LeftTagCopyWith(LeftTag value, $Res Function(LeftTag) _then) = _$LeftTagCopyWithImpl;
@override @useResult
$Res call({
 String? name
});




}
/// @nodoc
class _$LeftTagCopyWithImpl<$Res>
    implements $LeftTagCopyWith<$Res> {
  _$LeftTagCopyWithImpl(this._self, this._then);

  final LeftTag _self;
  final $Res Function(LeftTag) _then;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(LeftTag(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CenterTag implements ZoneTag {
   CenterTag({this.name = 'CENTER'});
  

@override@JsonKey() final  String? name;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CenterTagCopyWith<CenterTag> get copyWith => _$CenterTagCopyWithImpl<CenterTag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CenterTag&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ZoneTag.center(name: $name)';
}


}

/// @nodoc
abstract mixin class $CenterTagCopyWith<$Res> implements $ZoneTagCopyWith<$Res> {
  factory $CenterTagCopyWith(CenterTag value, $Res Function(CenterTag) _then) = _$CenterTagCopyWithImpl;
@override @useResult
$Res call({
 String? name
});




}
/// @nodoc
class _$CenterTagCopyWithImpl<$Res>
    implements $CenterTagCopyWith<$Res> {
  _$CenterTagCopyWithImpl(this._self, this._then);

  final CenterTag _self;
  final $Res Function(CenterTag) _then;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(CenterTag(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RightTag implements ZoneTag {
   RightTag({this.name = 'RIGHT'});
  

@override@JsonKey() final  String? name;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RightTagCopyWith<RightTag> get copyWith => _$RightTagCopyWithImpl<RightTag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RightTag&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ZoneTag.right(name: $name)';
}


}

/// @nodoc
abstract mixin class $RightTagCopyWith<$Res> implements $ZoneTagCopyWith<$Res> {
  factory $RightTagCopyWith(RightTag value, $Res Function(RightTag) _then) = _$RightTagCopyWithImpl;
@override @useResult
$Res call({
 String? name
});




}
/// @nodoc
class _$RightTagCopyWithImpl<$Res>
    implements $RightTagCopyWith<$Res> {
  _$RightTagCopyWithImpl(this._self, this._then);

  final RightTag _self;
  final $Res Function(RightTag) _then;

/// Create a copy of ZoneTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(RightTag(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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
