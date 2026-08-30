// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Drop {

 String get title; int get amount; DateTime get date; int? get id; int? get categoryId; int? get bucketId; int? get toBucketId; DropType? get dropType; int? get parentDropId; String? get notes; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Drop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropCopyWith<Drop> get copyWith => _$DropCopyWithImpl<Drop>(this as Drop, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Drop&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.toBucketId, toBucketId) || other.toBucketId == toBucketId)&&(identical(other.dropType, dropType) || other.dropType == dropType)&&(identical(other.parentDropId, parentDropId) || other.parentDropId == parentDropId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,title,amount,date,id,categoryId,bucketId,toBucketId,dropType,parentDropId,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Drop(title: $title, amount: $amount, date: $date, id: $id, categoryId: $categoryId, bucketId: $bucketId, toBucketId: $toBucketId, dropType: $dropType, parentDropId: $parentDropId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DropCopyWith<$Res>  {
  factory $DropCopyWith(Drop value, $Res Function(Drop) _then) = _$DropCopyWithImpl;
@useResult
$Res call({
 String title, int amount, DateTime date, int? id, int? categoryId, int? bucketId, int? toBucketId, DropType? dropType, int? parentDropId, String? notes, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$DropCopyWithImpl<$Res>
    implements $DropCopyWith<$Res> {
  _$DropCopyWithImpl(this._self, this._then);

  final Drop _self;
  final $Res Function(Drop) _then;

/// Create a copy of Drop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? amount = null,Object? date = null,Object? id = freezed,Object? categoryId = freezed,Object? bucketId = freezed,Object? toBucketId = freezed,Object? dropType = freezed,Object? parentDropId = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,bucketId: freezed == bucketId ? _self.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as int?,toBucketId: freezed == toBucketId ? _self.toBucketId : toBucketId // ignore: cast_nullable_to_non_nullable
as int?,dropType: freezed == dropType ? _self.dropType : dropType // ignore: cast_nullable_to_non_nullable
as DropType?,parentDropId: freezed == parentDropId ? _self.parentDropId : parentDropId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Drop].
extension DropPatterns on Drop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Drop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Drop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Drop value)  $default,){
final _that = this;
switch (_that) {
case _Drop():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Drop value)?  $default,){
final _that = this;
switch (_that) {
case _Drop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int amount,  DateTime date,  int? id,  int? categoryId,  int? bucketId,  int? toBucketId,  DropType? dropType,  int? parentDropId,  String? notes,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Drop() when $default != null:
return $default(_that.title,_that.amount,_that.date,_that.id,_that.categoryId,_that.bucketId,_that.toBucketId,_that.dropType,_that.parentDropId,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int amount,  DateTime date,  int? id,  int? categoryId,  int? bucketId,  int? toBucketId,  DropType? dropType,  int? parentDropId,  String? notes,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Drop():
return $default(_that.title,_that.amount,_that.date,_that.id,_that.categoryId,_that.bucketId,_that.toBucketId,_that.dropType,_that.parentDropId,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int amount,  DateTime date,  int? id,  int? categoryId,  int? bucketId,  int? toBucketId,  DropType? dropType,  int? parentDropId,  String? notes,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Drop() when $default != null:
return $default(_that.title,_that.amount,_that.date,_that.id,_that.categoryId,_that.bucketId,_that.toBucketId,_that.dropType,_that.parentDropId,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Drop implements Drop {
  const _Drop({required this.title, required this.amount, required this.date, this.id, this.categoryId, this.bucketId, this.toBucketId, this.dropType, this.parentDropId, this.notes, this.createdAt, this.updatedAt});
  

@override final  String title;
@override final  int amount;
@override final  DateTime date;
@override final  int? id;
@override final  int? categoryId;
@override final  int? bucketId;
@override final  int? toBucketId;
@override final  DropType? dropType;
@override final  int? parentDropId;
@override final  String? notes;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Drop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropCopyWith<_Drop> get copyWith => __$DropCopyWithImpl<_Drop>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Drop&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.toBucketId, toBucketId) || other.toBucketId == toBucketId)&&(identical(other.dropType, dropType) || other.dropType == dropType)&&(identical(other.parentDropId, parentDropId) || other.parentDropId == parentDropId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,title,amount,date,id,categoryId,bucketId,toBucketId,dropType,parentDropId,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Drop(title: $title, amount: $amount, date: $date, id: $id, categoryId: $categoryId, bucketId: $bucketId, toBucketId: $toBucketId, dropType: $dropType, parentDropId: $parentDropId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DropCopyWith<$Res> implements $DropCopyWith<$Res> {
  factory _$DropCopyWith(_Drop value, $Res Function(_Drop) _then) = __$DropCopyWithImpl;
@override @useResult
$Res call({
 String title, int amount, DateTime date, int? id, int? categoryId, int? bucketId, int? toBucketId, DropType? dropType, int? parentDropId, String? notes, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$DropCopyWithImpl<$Res>
    implements _$DropCopyWith<$Res> {
  __$DropCopyWithImpl(this._self, this._then);

  final _Drop _self;
  final $Res Function(_Drop) _then;

/// Create a copy of Drop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? amount = null,Object? date = null,Object? id = freezed,Object? categoryId = freezed,Object? bucketId = freezed,Object? toBucketId = freezed,Object? dropType = freezed,Object? parentDropId = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Drop(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,bucketId: freezed == bucketId ? _self.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as int?,toBucketId: freezed == toBucketId ? _self.toBucketId : toBucketId // ignore: cast_nullable_to_non_nullable
as int?,dropType: freezed == dropType ? _self.dropType : dropType // ignore: cast_nullable_to_non_nullable
as DropType?,parentDropId: freezed == parentDropId ? _self.parentDropId : parentDropId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
