// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bucket_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BucketCategory {

 int get id; String get name; BalanceType get balanceType; int get sort; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of BucketCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BucketCategoryCopyWith<BucketCategory> get copyWith => _$BucketCategoryCopyWithImpl<BucketCategory>(this as BucketCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BucketCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balanceType, balanceType) || other.balanceType == balanceType)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,balanceType,sort,createdAt,updatedAt);

@override
String toString() {
  return 'BucketCategory(id: $id, name: $name, balanceType: $balanceType, sort: $sort, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BucketCategoryCopyWith<$Res>  {
  factory $BucketCategoryCopyWith(BucketCategory value, $Res Function(BucketCategory) _then) = _$BucketCategoryCopyWithImpl;
@useResult
$Res call({
 int id, String name, BalanceType balanceType, int sort, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$BucketCategoryCopyWithImpl<$Res>
    implements $BucketCategoryCopyWith<$Res> {
  _$BucketCategoryCopyWithImpl(this._self, this._then);

  final BucketCategory _self;
  final $Res Function(BucketCategory) _then;

/// Create a copy of BucketCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? balanceType = null,Object? sort = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balanceType: null == balanceType ? _self.balanceType : balanceType // ignore: cast_nullable_to_non_nullable
as BalanceType,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BucketCategory].
extension BucketCategoryPatterns on BucketCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BucketCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BucketCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BucketCategory value)  $default,){
final _that = this;
switch (_that) {
case _BucketCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BucketCategory value)?  $default,){
final _that = this;
switch (_that) {
case _BucketCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  BalanceType balanceType,  int sort,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BucketCategory() when $default != null:
return $default(_that.id,_that.name,_that.balanceType,_that.sort,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  BalanceType balanceType,  int sort,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BucketCategory():
return $default(_that.id,_that.name,_that.balanceType,_that.sort,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  BalanceType balanceType,  int sort,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BucketCategory() when $default != null:
return $default(_that.id,_that.name,_that.balanceType,_that.sort,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _BucketCategory implements BucketCategory {
  const _BucketCategory({required this.id, required this.name, required this.balanceType, required this.sort, this.createdAt, this.updatedAt});
  

@override final  int id;
@override final  String name;
@override final  BalanceType balanceType;
@override final  int sort;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of BucketCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BucketCategoryCopyWith<_BucketCategory> get copyWith => __$BucketCategoryCopyWithImpl<_BucketCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BucketCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balanceType, balanceType) || other.balanceType == balanceType)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,balanceType,sort,createdAt,updatedAt);

@override
String toString() {
  return 'BucketCategory(id: $id, name: $name, balanceType: $balanceType, sort: $sort, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BucketCategoryCopyWith<$Res> implements $BucketCategoryCopyWith<$Res> {
  factory _$BucketCategoryCopyWith(_BucketCategory value, $Res Function(_BucketCategory) _then) = __$BucketCategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, BalanceType balanceType, int sort, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$BucketCategoryCopyWithImpl<$Res>
    implements _$BucketCategoryCopyWith<$Res> {
  __$BucketCategoryCopyWithImpl(this._self, this._then);

  final _BucketCategory _self;
  final $Res Function(_BucketCategory) _then;

/// Create a copy of BucketCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balanceType = null,Object? sort = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BucketCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balanceType: null == balanceType ? _self.balanceType : balanceType // ignore: cast_nullable_to_non_nullable
as BalanceType,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
