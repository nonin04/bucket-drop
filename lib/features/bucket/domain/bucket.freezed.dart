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

 int get id; String get name; bool get isIncomeDefault; bool get isExpenseDefault; String get bucketCategory; double get expectedRate; int get sort; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BucketCopyWith<Bucket> get copyWith => _$BucketCopyWithImpl<Bucket>(this as Bucket, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bucket&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isIncomeDefault, isIncomeDefault) || other.isIncomeDefault == isIncomeDefault)&&(identical(other.isExpenseDefault, isExpenseDefault) || other.isExpenseDefault == isExpenseDefault)&&(identical(other.bucketCategory, bucketCategory) || other.bucketCategory == bucketCategory)&&(identical(other.expectedRate, expectedRate) || other.expectedRate == expectedRate)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,isIncomeDefault,isExpenseDefault,bucketCategory,expectedRate,sort,createdAt,updatedAt);

@override
String toString() {
  return 'Bucket(id: $id, name: $name, isIncomeDefault: $isIncomeDefault, isExpenseDefault: $isExpenseDefault, bucketCategory: $bucketCategory, expectedRate: $expectedRate, sort: $sort, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BucketCopyWith<$Res>  {
  factory $BucketCopyWith(Bucket value, $Res Function(Bucket) _then) = _$BucketCopyWithImpl;
@useResult
$Res call({
 int id, String name, bool isIncomeDefault, bool isExpenseDefault, String bucketCategory, double expectedRate, int sort, DateTime createdAt, DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isIncomeDefault = null,Object? isExpenseDefault = null,Object? bucketCategory = null,Object? expectedRate = null,Object? sort = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isIncomeDefault: null == isIncomeDefault ? _self.isIncomeDefault : isIncomeDefault // ignore: cast_nullable_to_non_nullable
as bool,isExpenseDefault: null == isExpenseDefault ? _self.isExpenseDefault : isExpenseDefault // ignore: cast_nullable_to_non_nullable
as bool,bucketCategory: null == bucketCategory ? _self.bucketCategory : bucketCategory // ignore: cast_nullable_to_non_nullable
as String,expectedRate: null == expectedRate ? _self.expectedRate : expectedRate // ignore: cast_nullable_to_non_nullable
as double,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  bool isIncomeDefault,  bool isExpenseDefault,  String bucketCategory,  double expectedRate,  int sort,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bucket() when $default != null:
return $default(_that.id,_that.name,_that.isIncomeDefault,_that.isExpenseDefault,_that.bucketCategory,_that.expectedRate,_that.sort,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  bool isIncomeDefault,  bool isExpenseDefault,  String bucketCategory,  double expectedRate,  int sort,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Bucket():
return $default(_that.id,_that.name,_that.isIncomeDefault,_that.isExpenseDefault,_that.bucketCategory,_that.expectedRate,_that.sort,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  bool isIncomeDefault,  bool isExpenseDefault,  String bucketCategory,  double expectedRate,  int sort,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Bucket() when $default != null:
return $default(_that.id,_that.name,_that.isIncomeDefault,_that.isExpenseDefault,_that.bucketCategory,_that.expectedRate,_that.sort,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Bucket implements Bucket {
  const _Bucket({required this.id, required this.name, required this.isIncomeDefault, required this.isExpenseDefault, required this.bucketCategory, required this.expectedRate, required this.sort, required this.createdAt, required this.updatedAt});
  

@override final  int id;
@override final  String name;
@override final  bool isIncomeDefault;
@override final  bool isExpenseDefault;
@override final  String bucketCategory;
@override final  double expectedRate;
@override final  int sort;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BucketCopyWith<_Bucket> get copyWith => __$BucketCopyWithImpl<_Bucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bucket&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isIncomeDefault, isIncomeDefault) || other.isIncomeDefault == isIncomeDefault)&&(identical(other.isExpenseDefault, isExpenseDefault) || other.isExpenseDefault == isExpenseDefault)&&(identical(other.bucketCategory, bucketCategory) || other.bucketCategory == bucketCategory)&&(identical(other.expectedRate, expectedRate) || other.expectedRate == expectedRate)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,isIncomeDefault,isExpenseDefault,bucketCategory,expectedRate,sort,createdAt,updatedAt);

@override
String toString() {
  return 'Bucket(id: $id, name: $name, isIncomeDefault: $isIncomeDefault, isExpenseDefault: $isExpenseDefault, bucketCategory: $bucketCategory, expectedRate: $expectedRate, sort: $sort, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BucketCopyWith<$Res> implements $BucketCopyWith<$Res> {
  factory _$BucketCopyWith(_Bucket value, $Res Function(_Bucket) _then) = __$BucketCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, bool isIncomeDefault, bool isExpenseDefault, String bucketCategory, double expectedRate, int sort, DateTime createdAt, DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isIncomeDefault = null,Object? isExpenseDefault = null,Object? bucketCategory = null,Object? expectedRate = null,Object? sort = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Bucket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isIncomeDefault: null == isIncomeDefault ? _self.isIncomeDefault : isIncomeDefault // ignore: cast_nullable_to_non_nullable
as bool,isExpenseDefault: null == isExpenseDefault ? _self.isExpenseDefault : isExpenseDefault // ignore: cast_nullable_to_non_nullable
as bool,bucketCategory: null == bucketCategory ? _self.bucketCategory : bucketCategory // ignore: cast_nullable_to_non_nullable
as String,expectedRate: null == expectedRate ? _self.expectedRate : expectedRate // ignore: cast_nullable_to_non_nullable
as double,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
