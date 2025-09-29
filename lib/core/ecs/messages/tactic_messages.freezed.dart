// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactic_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TacticMessage {

 void Function()? get onAck; bool get requiresAck; Zone get targetZone;
/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TacticMessageCopyWith<TacticMessage> get copyWith => _$TacticMessageCopyWithImpl<TacticMessage>(this as TacticMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticMessage&&(identical(other.onAck, onAck) || other.onAck == onAck)&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.targetZone, targetZone) || other.targetZone == targetZone));
}


@override
int get hashCode => Object.hash(runtimeType,onAck,requiresAck,targetZone);

@override
String toString() {
  return 'TacticMessage(onAck: $onAck, requiresAck: $requiresAck, targetZone: $targetZone)';
}


}

/// @nodoc
abstract mixin class $TacticMessageCopyWith<$Res>  {
  factory $TacticMessageCopyWith(TacticMessage value, $Res Function(TacticMessage) _then) = _$TacticMessageCopyWithImpl;
@useResult
$Res call({
 void Function()? onAck, bool requiresAck, Zone targetZone
});


$ZoneCopyWith<$Res> get targetZone;

}
/// @nodoc
class _$TacticMessageCopyWithImpl<$Res>
    implements $TacticMessageCopyWith<$Res> {
  _$TacticMessageCopyWithImpl(this._self, this._then);

  final TacticMessage _self;
  final $Res Function(TacticMessage) _then;

/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onAck = freezed,Object? requiresAck = null,Object? targetZone = null,}) {
  return _then(_self.copyWith(
onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,targetZone: null == targetZone ? _self.targetZone : targetZone // ignore: cast_nullable_to_non_nullable
as Zone,
  ));
}
/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneCopyWith<$Res> get targetZone {
  
  return $ZoneCopyWith<$Res>(_self.targetZone, (value) {
    return _then(_self.copyWith(targetZone: value));
  });
}
}


/// Adds pattern-matching-related methods to [TacticMessage].
extension TacticMessagePatterns on TacticMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MoveToZone value)?  moveToZone,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MoveToZone() when moveToZone != null:
return moveToZone(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MoveToZone value)  moveToZone,}){
final _that = this;
switch (_that) {
case MoveToZone():
return moveToZone(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MoveToZone value)?  moveToZone,}){
final _that = this;
switch (_that) {
case MoveToZone() when moveToZone != null:
return moveToZone(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( void Function()? onAck,  bool requiresAck,  Zone targetZone)?  moveToZone,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MoveToZone() when moveToZone != null:
return moveToZone(_that.onAck,_that.requiresAck,_that.targetZone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( void Function()? onAck,  bool requiresAck,  Zone targetZone)  moveToZone,}) {final _that = this;
switch (_that) {
case MoveToZone():
return moveToZone(_that.onAck,_that.requiresAck,_that.targetZone);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( void Function()? onAck,  bool requiresAck,  Zone targetZone)?  moveToZone,}) {final _that = this;
switch (_that) {
case MoveToZone() when moveToZone != null:
return moveToZone(_that.onAck,_that.requiresAck,_that.targetZone);case _:
  return null;

}
}

}

/// @nodoc


class MoveToZone implements TacticMessage {
  const MoveToZone({this.onAck, this.requiresAck = false, required this.targetZone});
  

@override final  void Function()? onAck;
@override@JsonKey() final  bool requiresAck;
@override final  Zone targetZone;

/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveToZoneCopyWith<MoveToZone> get copyWith => _$MoveToZoneCopyWithImpl<MoveToZone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveToZone&&(identical(other.onAck, onAck) || other.onAck == onAck)&&(identical(other.requiresAck, requiresAck) || other.requiresAck == requiresAck)&&(identical(other.targetZone, targetZone) || other.targetZone == targetZone));
}


@override
int get hashCode => Object.hash(runtimeType,onAck,requiresAck,targetZone);

@override
String toString() {
  return 'TacticMessage.moveToZone(onAck: $onAck, requiresAck: $requiresAck, targetZone: $targetZone)';
}


}

/// @nodoc
abstract mixin class $MoveToZoneCopyWith<$Res> implements $TacticMessageCopyWith<$Res> {
  factory $MoveToZoneCopyWith(MoveToZone value, $Res Function(MoveToZone) _then) = _$MoveToZoneCopyWithImpl;
@override @useResult
$Res call({
 void Function()? onAck, bool requiresAck, Zone targetZone
});


@override $ZoneCopyWith<$Res> get targetZone;

}
/// @nodoc
class _$MoveToZoneCopyWithImpl<$Res>
    implements $MoveToZoneCopyWith<$Res> {
  _$MoveToZoneCopyWithImpl(this._self, this._then);

  final MoveToZone _self;
  final $Res Function(MoveToZone) _then;

/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onAck = freezed,Object? requiresAck = null,Object? targetZone = null,}) {
  return _then(MoveToZone(
onAck: freezed == onAck ? _self.onAck : onAck // ignore: cast_nullable_to_non_nullable
as void Function()?,requiresAck: null == requiresAck ? _self.requiresAck : requiresAck // ignore: cast_nullable_to_non_nullable
as bool,targetZone: null == targetZone ? _self.targetZone : targetZone // ignore: cast_nullable_to_non_nullable
as Zone,
  ));
}

/// Create a copy of TacticMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneCopyWith<$Res> get targetZone {
  
  return $ZoneCopyWith<$Res>(_self.targetZone, (value) {
    return _then(_self.copyWith(targetZone: value));
  });
}
}

// dart format on
