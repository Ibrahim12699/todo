// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskState()';
}


}

/// @nodoc
class $TaskStateCopyWith<$Res>  {
$TaskStateCopyWith(TaskState _, $Res Function(TaskState) __);
}


/// @nodoc


class _Initial implements TaskState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskState.initial()';
}


}




/// @nodoc


class CreateLoading implements TaskState {
  const CreateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskState.createLoading()';
}


}




/// @nodoc


class CreateSuccess implements TaskState {
  const CreateSuccess(this.success);
  

 final  bool success;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSuccessCopyWith<CreateSuccess> get copyWith => _$CreateSuccessCopyWithImpl<CreateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSuccess&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'TaskState.createSuccess(success: $success)';
}


}

/// @nodoc
abstract mixin class $CreateSuccessCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $CreateSuccessCopyWith(CreateSuccess value, $Res Function(CreateSuccess) _then) = _$CreateSuccessCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$CreateSuccessCopyWithImpl<$Res>
    implements $CreateSuccessCopyWith<$Res> {
  _$CreateSuccessCopyWithImpl(this._self, this._then);

  final CreateSuccess _self;
  final $Res Function(CreateSuccess) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(CreateSuccess(
null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CreateError implements TaskState {
  const CreateError(this.error);
  

 final  FirebaseException error;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateErrorCopyWith<CreateError> get copyWith => _$CreateErrorCopyWithImpl<CreateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TaskState.createError(error: $error)';
}


}

/// @nodoc
abstract mixin class $CreateErrorCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $CreateErrorCopyWith(CreateError value, $Res Function(CreateError) _then) = _$CreateErrorCopyWithImpl;
@useResult
$Res call({
 FirebaseException error
});




}
/// @nodoc
class _$CreateErrorCopyWithImpl<$Res>
    implements $CreateErrorCopyWith<$Res> {
  _$CreateErrorCopyWithImpl(this._self, this._then);

  final CreateError _self;
  final $Res Function(CreateError) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CreateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as FirebaseException,
  ));
}


}

/// @nodoc


class UpdateLoading implements TaskState {
  const UpdateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskState.updateLoading()';
}


}




/// @nodoc


class UpdateSuccess implements TaskState {
  const UpdateSuccess(this.success);
  

 final  bool success;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSuccessCopyWith<UpdateSuccess> get copyWith => _$UpdateSuccessCopyWithImpl<UpdateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSuccess&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'TaskState.updateSuccess(success: $success)';
}


}

/// @nodoc
abstract mixin class $UpdateSuccessCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $UpdateSuccessCopyWith(UpdateSuccess value, $Res Function(UpdateSuccess) _then) = _$UpdateSuccessCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$UpdateSuccessCopyWithImpl<$Res>
    implements $UpdateSuccessCopyWith<$Res> {
  _$UpdateSuccessCopyWithImpl(this._self, this._then);

  final UpdateSuccess _self;
  final $Res Function(UpdateSuccess) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(UpdateSuccess(
null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class UpdateError implements TaskState {
  const UpdateError(this.error);
  

 final  FirebaseException error;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateErrorCopyWith<UpdateError> get copyWith => _$UpdateErrorCopyWithImpl<UpdateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TaskState.updateError(error: $error)';
}


}

/// @nodoc
abstract mixin class $UpdateErrorCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $UpdateErrorCopyWith(UpdateError value, $Res Function(UpdateError) _then) = _$UpdateErrorCopyWithImpl;
@useResult
$Res call({
 FirebaseException error
});




}
/// @nodoc
class _$UpdateErrorCopyWithImpl<$Res>
    implements $UpdateErrorCopyWith<$Res> {
  _$UpdateErrorCopyWithImpl(this._self, this._then);

  final UpdateError _self;
  final $Res Function(UpdateError) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(UpdateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as FirebaseException,
  ));
}


}

// dart format on
