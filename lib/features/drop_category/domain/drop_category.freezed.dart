// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DropCategory {

 int get id; String get name; AppIcons get icon; DropType get dropType; int get budget; int get sort; bool get isSystem; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of DropCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropCategoryCopyWith<DropCategory> get copyWith => _$DropCategoryCopyWithImpl<DropCategory>(this as DropCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.dropType, dropType) || other.dropType == dropType)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon,dropType,budget,sort,isSystem,createdAt,updatedAt);

@override
String toString() {
  return 'DropCategory(id: $id, name: $name, icon: $icon, dropType: $dropType, budget: $budget, sort: $sort, isSystem: $isSystem, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DropCategoryCopyWith<$Res>  {
  factory $DropCategoryCopyWith(DropCategory value, $Res Function(DropCategory) _then) = _$DropCategoryCopyWithImpl;
@useResult
$Res call({
 int id, String name, AppIcons icon, DropType dropType, int budget, int sort, bool isSystem, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$DropCategoryCopyWithImpl<$Res>
    implements $DropCategoryCopyWith<$Res> {
  _$DropCategoryCopyWithImpl(this._self, this._then);

  final DropCategory _self;
  final $Res Function(DropCategory) _then;

/// Create a copy of DropCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = null,Object? dropType = null,Object? budget = null,Object? sort = null,Object? isSystem = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as AppIcons,dropType: null == dropType ? _self.dropType : dropType // ignore: cast_nullable_to_non_nullable
as DropType,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DropCategory].
extension DropCategoryPatterns on DropCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DropCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DropCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DropCategory value)  $default,){
final _that = this;
switch (_that) {
case _DropCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DropCategory value)?  $default,){
final _that = this;
switch (_that) {
case _DropCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  AppIcons icon,  DropType dropType,  int budget,  int sort,  bool isSystem,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DropCategory() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.dropType,_that.budget,_that.sort,_that.isSystem,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  AppIcons icon,  DropType dropType,  int budget,  int sort,  bool isSystem,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DropCategory():
return $default(_that.id,_that.name,_that.icon,_that.dropType,_that.budget,_that.sort,_that.isSystem,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  AppIcons icon,  DropType dropType,  int budget,  int sort,  bool isSystem,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DropCategory() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.dropType,_that.budget,_that.sort,_that.isSystem,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _DropCategory implements DropCategory {
  const _DropCategory({required this.id, required this.name, required this.icon, required this.dropType, required this.budget, required this.sort, required this.isSystem, required this.createdAt, required this.updatedAt});
  

@override final  int id;
@override final  String name;
@override final  AppIcons icon;
@override final  DropType dropType;
@override final  int budget;
@override final  int sort;
@override final  bool isSystem;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of DropCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropCategoryCopyWith<_DropCategory> get copyWith => __$DropCategoryCopyWithImpl<_DropCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.dropType, dropType) || other.dropType == dropType)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon,dropType,budget,sort,isSystem,createdAt,updatedAt);

@override
String toString() {
  return 'DropCategory(id: $id, name: $name, icon: $icon, dropType: $dropType, budget: $budget, sort: $sort, isSystem: $isSystem, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DropCategoryCopyWith<$Res> implements $DropCategoryCopyWith<$Res> {
  factory _$DropCategoryCopyWith(_DropCategory value, $Res Function(_DropCategory) _then) = __$DropCategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, AppIcons icon, DropType dropType, int budget, int sort, bool isSystem, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$DropCategoryCopyWithImpl<$Res>
    implements _$DropCategoryCopyWith<$Res> {
  __$DropCategoryCopyWithImpl(this._self, this._then);

  final _DropCategory _self;
  final $Res Function(_DropCategory) _then;

/// Create a copy of DropCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = null,Object? dropType = null,Object? budget = null,Object? sort = null,Object? isSystem = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DropCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as AppIcons,dropType: null == dropType ? _self.dropType : dropType // ignore: cast_nullable_to_non_nullable
as DropType,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
