// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bucket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Bucket {

 int get id; String get name; int get bucketCategoryId; int get sort; int? get iconId; String? get notes; bool? get isDefaultExpense; bool? get isDefaultIncome; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BucketCopyWith<Bucket> get copyWith => _$BucketCopyWithImpl<Bucket>(this as Bucket, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bucket&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bucketCategoryId, bucketCategoryId) || other.bucketCategoryId == bucketCategoryId)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.iconId, iconId) || other.iconId == iconId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isDefaultExpense, isDefaultExpense) || other.isDefaultExpense == isDefaultExpense)&&(identical(other.isDefaultIncome, isDefaultIncome) || other.isDefaultIncome == isDefaultIncome)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,bucketCategoryId,sort,iconId,notes,isDefaultExpense,isDefaultIncome,createdAt,updatedAt);

@override
String toString() {
  return 'Bucket(id: $id, name: $name, bucketCategoryId: $bucketCategoryId, sort: $sort, iconId: $iconId, notes: $notes, isDefaultExpense: $isDefaultExpense, isDefaultIncome: $isDefaultIncome, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BucketCopyWith<$Res>  {
  factory $BucketCopyWith(Bucket value, $Res Function(Bucket) _then) = _$BucketCopyWithImpl;
@useResult
$Res call({
 int id, String name, int bucketCategoryId, int sort, int? iconId, String? notes, bool? isDefaultExpense, bool? isDefaultIncome, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$BucketCopyWithImpl<$Res>
    implements $BucketCopyWith<$Res> {
  _$BucketCopyWithImpl(this._self, this._then);

  final Bucket _self;
  final $Res Function(Bucket) _then;

/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bucketCategoryId = null,Object? sort = null,Object? iconId = freezed,Object? notes = freezed,Object? isDefaultExpense = freezed,Object? isDefaultIncome = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bucketCategoryId: null == bucketCategoryId ? _self.bucketCategoryId : bucketCategoryId // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,iconId: freezed == iconId ? _self.iconId : iconId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isDefaultExpense: freezed == isDefaultExpense ? _self.isDefaultExpense : isDefaultExpense // ignore: cast_nullable_to_non_nullable
as bool?,isDefaultIncome: freezed == isDefaultIncome ? _self.isDefaultIncome : isDefaultIncome // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Bucket].
extension BucketPatterns on Bucket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bucket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bucket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bucket value)  $default,){
final _that = this;
switch (_that) {
case _Bucket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bucket value)?  $default,){
final _that = this;
switch (_that) {
case _Bucket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int bucketCategoryId,  int sort,  int? iconId,  String? notes,  bool? isDefaultExpense,  bool? isDefaultIncome,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bucket() when $default != null:
return $default(_that.id,_that.name,_that.bucketCategoryId,_that.sort,_that.iconId,_that.notes,_that.isDefaultExpense,_that.isDefaultIncome,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int bucketCategoryId,  int sort,  int? iconId,  String? notes,  bool? isDefaultExpense,  bool? isDefaultIncome,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Bucket():
return $default(_that.id,_that.name,_that.bucketCategoryId,_that.sort,_that.iconId,_that.notes,_that.isDefaultExpense,_that.isDefaultIncome,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int bucketCategoryId,  int sort,  int? iconId,  String? notes,  bool? isDefaultExpense,  bool? isDefaultIncome,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Bucket() when $default != null:
return $default(_that.id,_that.name,_that.bucketCategoryId,_that.sort,_that.iconId,_that.notes,_that.isDefaultExpense,_that.isDefaultIncome,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Bucket implements Bucket {
  const _Bucket({required this.id, required this.name, required this.bucketCategoryId, required this.sort, this.iconId, this.notes, this.isDefaultExpense, this.isDefaultIncome, this.createdAt, this.updatedAt});
  

@override final  int id;
@override final  String name;
@override final  int bucketCategoryId;
@override final  int sort;
@override final  int? iconId;
@override final  String? notes;
@override final  bool? isDefaultExpense;
@override final  bool? isDefaultIncome;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BucketCopyWith<_Bucket> get copyWith => __$BucketCopyWithImpl<_Bucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bucket&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bucketCategoryId, bucketCategoryId) || other.bucketCategoryId == bucketCategoryId)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.iconId, iconId) || other.iconId == iconId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isDefaultExpense, isDefaultExpense) || other.isDefaultExpense == isDefaultExpense)&&(identical(other.isDefaultIncome, isDefaultIncome) || other.isDefaultIncome == isDefaultIncome)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,bucketCategoryId,sort,iconId,notes,isDefaultExpense,isDefaultIncome,createdAt,updatedAt);

@override
String toString() {
  return 'Bucket(id: $id, name: $name, bucketCategoryId: $bucketCategoryId, sort: $sort, iconId: $iconId, notes: $notes, isDefaultExpense: $isDefaultExpense, isDefaultIncome: $isDefaultIncome, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BucketCopyWith<$Res> implements $BucketCopyWith<$Res> {
  factory _$BucketCopyWith(_Bucket value, $Res Function(_Bucket) _then) = __$BucketCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int bucketCategoryId, int sort, int? iconId, String? notes, bool? isDefaultExpense, bool? isDefaultIncome, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$BucketCopyWithImpl<$Res>
    implements _$BucketCopyWith<$Res> {
  __$BucketCopyWithImpl(this._self, this._then);

  final _Bucket _self;
  final $Res Function(_Bucket) _then;

/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bucketCategoryId = null,Object? sort = null,Object? iconId = freezed,Object? notes = freezed,Object? isDefaultExpense = freezed,Object? isDefaultIncome = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Bucket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bucketCategoryId: null == bucketCategoryId ? _self.bucketCategoryId : bucketCategoryId // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,iconId: freezed == iconId ? _self.iconId : iconId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isDefaultExpense: freezed == isDefaultExpense ? _self.isDefaultExpense : isDefaultExpense // ignore: cast_nullable_to_non_nullable
as bool?,isDefaultIncome: freezed == isDefaultIncome ? _self.isDefaultIncome : isDefaultIncome // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
