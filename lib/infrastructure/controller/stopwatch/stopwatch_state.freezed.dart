// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stopwatch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StopwatchState {

 Duration get actualTotalTime; Duration get actualLapTime; bool get isRunning; List<LapTime> get previousLaps;
/// Create a copy of StopwatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StopwatchStateCopyWith<StopwatchState> get copyWith => _$StopwatchStateCopyWithImpl<StopwatchState>(this as StopwatchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopwatchState&&(identical(other.actualTotalTime, actualTotalTime) || other.actualTotalTime == actualTotalTime)&&(identical(other.actualLapTime, actualLapTime) || other.actualLapTime == actualLapTime)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&const DeepCollectionEquality().equals(other.previousLaps, previousLaps));
}


@override
int get hashCode => Object.hash(runtimeType,actualTotalTime,actualLapTime,isRunning,const DeepCollectionEquality().hash(previousLaps));

@override
String toString() {
  return 'StopwatchState(actualTotalTime: $actualTotalTime, actualLapTime: $actualLapTime, isRunning: $isRunning, previousLaps: $previousLaps)';
}


}

/// @nodoc
abstract mixin class $StopwatchStateCopyWith<$Res>  {
  factory $StopwatchStateCopyWith(StopwatchState value, $Res Function(StopwatchState) _then) = _$StopwatchStateCopyWithImpl;
@useResult
$Res call({
 Duration actualTotalTime, Duration actualLapTime, bool isRunning, List<LapTime> previousLaps
});




}
/// @nodoc
class _$StopwatchStateCopyWithImpl<$Res>
    implements $StopwatchStateCopyWith<$Res> {
  _$StopwatchStateCopyWithImpl(this._self, this._then);

  final StopwatchState _self;
  final $Res Function(StopwatchState) _then;

/// Create a copy of StopwatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? actualTotalTime = null,Object? actualLapTime = null,Object? isRunning = null,Object? previousLaps = null,}) {
  return _then(_self.copyWith(
actualTotalTime: null == actualTotalTime ? _self.actualTotalTime : actualTotalTime // ignore: cast_nullable_to_non_nullable
as Duration,actualLapTime: null == actualLapTime ? _self.actualLapTime : actualLapTime // ignore: cast_nullable_to_non_nullable
as Duration,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,previousLaps: null == previousLaps ? _self.previousLaps : previousLaps // ignore: cast_nullable_to_non_nullable
as List<LapTime>,
  ));
}

}


/// Adds pattern-matching-related methods to [StopwatchState].
extension StopwatchStatePatterns on StopwatchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StopwatchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StopwatchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StopwatchState value)  $default,){
final _that = this;
switch (_that) {
case _StopwatchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StopwatchState value)?  $default,){
final _that = this;
switch (_that) {
case _StopwatchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration actualTotalTime,  Duration actualLapTime,  bool isRunning,  List<LapTime> previousLaps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StopwatchState() when $default != null:
return $default(_that.actualTotalTime,_that.actualLapTime,_that.isRunning,_that.previousLaps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration actualTotalTime,  Duration actualLapTime,  bool isRunning,  List<LapTime> previousLaps)  $default,) {final _that = this;
switch (_that) {
case _StopwatchState():
return $default(_that.actualTotalTime,_that.actualLapTime,_that.isRunning,_that.previousLaps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration actualTotalTime,  Duration actualLapTime,  bool isRunning,  List<LapTime> previousLaps)?  $default,) {final _that = this;
switch (_that) {
case _StopwatchState() when $default != null:
return $default(_that.actualTotalTime,_that.actualLapTime,_that.isRunning,_that.previousLaps);case _:
  return null;

}
}

}

/// @nodoc


class _StopwatchState implements StopwatchState {
  const _StopwatchState({required this.actualTotalTime, required this.actualLapTime, required this.isRunning, required final  List<LapTime> previousLaps}): _previousLaps = previousLaps;
  

@override final  Duration actualTotalTime;
@override final  Duration actualLapTime;
@override final  bool isRunning;
 final  List<LapTime> _previousLaps;
@override List<LapTime> get previousLaps {
  if (_previousLaps is EqualUnmodifiableListView) return _previousLaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previousLaps);
}


/// Create a copy of StopwatchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopwatchStateCopyWith<_StopwatchState> get copyWith => __$StopwatchStateCopyWithImpl<_StopwatchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopwatchState&&(identical(other.actualTotalTime, actualTotalTime) || other.actualTotalTime == actualTotalTime)&&(identical(other.actualLapTime, actualLapTime) || other.actualLapTime == actualLapTime)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&const DeepCollectionEquality().equals(other._previousLaps, _previousLaps));
}


@override
int get hashCode => Object.hash(runtimeType,actualTotalTime,actualLapTime,isRunning,const DeepCollectionEquality().hash(_previousLaps));

@override
String toString() {
  return 'StopwatchState(actualTotalTime: $actualTotalTime, actualLapTime: $actualLapTime, isRunning: $isRunning, previousLaps: $previousLaps)';
}


}

/// @nodoc
abstract mixin class _$StopwatchStateCopyWith<$Res> implements $StopwatchStateCopyWith<$Res> {
  factory _$StopwatchStateCopyWith(_StopwatchState value, $Res Function(_StopwatchState) _then) = __$StopwatchStateCopyWithImpl;
@override @useResult
$Res call({
 Duration actualTotalTime, Duration actualLapTime, bool isRunning, List<LapTime> previousLaps
});




}
/// @nodoc
class __$StopwatchStateCopyWithImpl<$Res>
    implements _$StopwatchStateCopyWith<$Res> {
  __$StopwatchStateCopyWithImpl(this._self, this._then);

  final _StopwatchState _self;
  final $Res Function(_StopwatchState) _then;

/// Create a copy of StopwatchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? actualTotalTime = null,Object? actualLapTime = null,Object? isRunning = null,Object? previousLaps = null,}) {
  return _then(_StopwatchState(
actualTotalTime: null == actualTotalTime ? _self.actualTotalTime : actualTotalTime // ignore: cast_nullable_to_non_nullable
as Duration,actualLapTime: null == actualLapTime ? _self.actualLapTime : actualLapTime // ignore: cast_nullable_to_non_nullable
as Duration,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,previousLaps: null == previousLaps ? _self._previousLaps : previousLaps // ignore: cast_nullable_to_non_nullable
as List<LapTime>,
  ));
}


}

// dart format on
