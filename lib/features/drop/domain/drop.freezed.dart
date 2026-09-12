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

 int get id; String get title; int get amount; DateTime get droppedOn; DateTime get createdAt; DateTime get updatedAt; int? get fromBucketId; int? get toBucketId; int? get dropCategoryId; int? get subscribedDropId; int? get parentDropId; String? get notes; String? get fromBucketName; String? get toBucketName; String? get dropCategoryName; AppIcons? get dropCategoryIcon; String? get subscribedDropTitle; String? get subscribedDropName; String? get subscribedDropNotes;
/// Create a copy of Drop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropCopyWith<Drop> get copyWith => _$DropCopyWithImpl<Drop>(this as Drop, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Drop&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.droppedOn, droppedOn) || other.droppedOn == droppedOn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fromBucketId, fromBucketId) || other.fromBucketId == fromBucketId)&&(identical(other.toBucketId, toBucketId) || other.toBucketId == toBucketId)&&(identical(other.dropCategoryId, dropCategoryId) || other.dropCategoryId == dropCategoryId)&&(identical(other.subscribedDropId, subscribedDropId) || other.subscribedDropId == subscribedDropId)&&(identical(other.parentDropId, parentDropId) || other.parentDropId == parentDropId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.fromBucketName, fromBucketName) || other.fromBucketName == fromBucketName)&&(identical(other.toBucketName, toBucketName) || other.toBucketName == toBucketName)&&(identical(other.dropCategoryName, dropCategoryName) || other.dropCategoryName == dropCategoryName)&&(identical(other.dropCategoryIcon, dropCategoryIcon) || other.dropCategoryIcon == dropCategoryIcon)&&(identical(other.subscribedDropTitle, subscribedDropTitle) || other.subscribedDropTitle == subscribedDropTitle)&&(identical(other.subscribedDropName, subscribedDropName) || other.subscribedDropName == subscribedDropName)&&(identical(other.subscribedDropNotes, subscribedDropNotes) || other.subscribedDropNotes == subscribedDropNotes));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,amount,droppedOn,createdAt,updatedAt,fromBucketId,toBucketId,dropCategoryId,subscribedDropId,parentDropId,notes,fromBucketName,toBucketName,dropCategoryName,dropCategoryIcon,subscribedDropTitle,subscribedDropName,subscribedDropNotes]);

@override
String toString() {
  return 'Drop(id: $id, title: $title, amount: $amount, droppedOn: $droppedOn, createdAt: $createdAt, updatedAt: $updatedAt, fromBucketId: $fromBucketId, toBucketId: $toBucketId, dropCategoryId: $dropCategoryId, subscribedDropId: $subscribedDropId, parentDropId: $parentDropId, notes: $notes, fromBucketName: $fromBucketName, toBucketName: $toBucketName, dropCategoryName: $dropCategoryName, dropCategoryIcon: $dropCategoryIcon, subscribedDropTitle: $subscribedDropTitle, subscribedDropName: $subscribedDropName, subscribedDropNotes: $subscribedDropNotes)';
}


}

/// @nodoc
abstract mixin class $DropCopyWith<$Res>  {
  factory $DropCopyWith(Drop value, $Res Function(Drop) _then) = _$DropCopyWithImpl;
@useResult
$Res call({
 int id, String title, int amount, DateTime droppedOn, DateTime createdAt, DateTime updatedAt, int? fromBucketId, int? toBucketId, int? dropCategoryId, int? subscribedDropId, int? parentDropId, String? notes, String? fromBucketName, String? toBucketName, String? dropCategoryName, AppIcons? dropCategoryIcon, String? subscribedDropTitle, String? subscribedDropName, String? subscribedDropNotes
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? droppedOn = null,Object? createdAt = null,Object? updatedAt = null,Object? fromBucketId = freezed,Object? toBucketId = freezed,Object? dropCategoryId = freezed,Object? subscribedDropId = freezed,Object? parentDropId = freezed,Object? notes = freezed,Object? fromBucketName = freezed,Object? toBucketName = freezed,Object? dropCategoryName = freezed,Object? dropCategoryIcon = freezed,Object? subscribedDropTitle = freezed,Object? subscribedDropName = freezed,Object? subscribedDropNotes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,droppedOn: null == droppedOn ? _self.droppedOn : droppedOn // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fromBucketId: freezed == fromBucketId ? _self.fromBucketId : fromBucketId // ignore: cast_nullable_to_non_nullable
as int?,toBucketId: freezed == toBucketId ? _self.toBucketId : toBucketId // ignore: cast_nullable_to_non_nullable
as int?,dropCategoryId: freezed == dropCategoryId ? _self.dropCategoryId : dropCategoryId // ignore: cast_nullable_to_non_nullable
as int?,subscribedDropId: freezed == subscribedDropId ? _self.subscribedDropId : subscribedDropId // ignore: cast_nullable_to_non_nullable
as int?,parentDropId: freezed == parentDropId ? _self.parentDropId : parentDropId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,fromBucketName: freezed == fromBucketName ? _self.fromBucketName : fromBucketName // ignore: cast_nullable_to_non_nullable
as String?,toBucketName: freezed == toBucketName ? _self.toBucketName : toBucketName // ignore: cast_nullable_to_non_nullable
as String?,dropCategoryName: freezed == dropCategoryName ? _self.dropCategoryName : dropCategoryName // ignore: cast_nullable_to_non_nullable
as String?,dropCategoryIcon: freezed == dropCategoryIcon ? _self.dropCategoryIcon : dropCategoryIcon // ignore: cast_nullable_to_non_nullable
as AppIcons?,subscribedDropTitle: freezed == subscribedDropTitle ? _self.subscribedDropTitle : subscribedDropTitle // ignore: cast_nullable_to_non_nullable
as String?,subscribedDropName: freezed == subscribedDropName ? _self.subscribedDropName : subscribedDropName // ignore: cast_nullable_to_non_nullable
as String?,subscribedDropNotes: freezed == subscribedDropNotes ? _self.subscribedDropNotes : subscribedDropNotes // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  int amount,  DateTime droppedOn,  DateTime createdAt,  DateTime updatedAt,  int? fromBucketId,  int? toBucketId,  int? dropCategoryId,  int? subscribedDropId,  int? parentDropId,  String? notes,  String? fromBucketName,  String? toBucketName,  String? dropCategoryName,  AppIcons? dropCategoryIcon,  String? subscribedDropTitle,  String? subscribedDropName,  String? subscribedDropNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Drop() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.droppedOn,_that.createdAt,_that.updatedAt,_that.fromBucketId,_that.toBucketId,_that.dropCategoryId,_that.subscribedDropId,_that.parentDropId,_that.notes,_that.fromBucketName,_that.toBucketName,_that.dropCategoryName,_that.dropCategoryIcon,_that.subscribedDropTitle,_that.subscribedDropName,_that.subscribedDropNotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  int amount,  DateTime droppedOn,  DateTime createdAt,  DateTime updatedAt,  int? fromBucketId,  int? toBucketId,  int? dropCategoryId,  int? subscribedDropId,  int? parentDropId,  String? notes,  String? fromBucketName,  String? toBucketName,  String? dropCategoryName,  AppIcons? dropCategoryIcon,  String? subscribedDropTitle,  String? subscribedDropName,  String? subscribedDropNotes)  $default,) {final _that = this;
switch (_that) {
case _Drop():
return $default(_that.id,_that.title,_that.amount,_that.droppedOn,_that.createdAt,_that.updatedAt,_that.fromBucketId,_that.toBucketId,_that.dropCategoryId,_that.subscribedDropId,_that.parentDropId,_that.notes,_that.fromBucketName,_that.toBucketName,_that.dropCategoryName,_that.dropCategoryIcon,_that.subscribedDropTitle,_that.subscribedDropName,_that.subscribedDropNotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  int amount,  DateTime droppedOn,  DateTime createdAt,  DateTime updatedAt,  int? fromBucketId,  int? toBucketId,  int? dropCategoryId,  int? subscribedDropId,  int? parentDropId,  String? notes,  String? fromBucketName,  String? toBucketName,  String? dropCategoryName,  AppIcons? dropCategoryIcon,  String? subscribedDropTitle,  String? subscribedDropName,  String? subscribedDropNotes)?  $default,) {final _that = this;
switch (_that) {
case _Drop() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.droppedOn,_that.createdAt,_that.updatedAt,_that.fromBucketId,_that.toBucketId,_that.dropCategoryId,_that.subscribedDropId,_that.parentDropId,_that.notes,_that.fromBucketName,_that.toBucketName,_that.dropCategoryName,_that.dropCategoryIcon,_that.subscribedDropTitle,_that.subscribedDropName,_that.subscribedDropNotes);case _:
  return null;

}
}

}

/// @nodoc


class _Drop implements Drop {
  const _Drop({required this.id, required this.title, required this.amount, required this.droppedOn, required this.createdAt, required this.updatedAt, this.fromBucketId, this.toBucketId, this.dropCategoryId, this.subscribedDropId, this.parentDropId, this.notes, this.fromBucketName, this.toBucketName, this.dropCategoryName, this.dropCategoryIcon, this.subscribedDropTitle, this.subscribedDropName, this.subscribedDropNotes});
  

@override final  int id;
@override final  String title;
@override final  int amount;
@override final  DateTime droppedOn;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? fromBucketId;
@override final  int? toBucketId;
@override final  int? dropCategoryId;
@override final  int? subscribedDropId;
@override final  int? parentDropId;
@override final  String? notes;
@override final  String? fromBucketName;
@override final  String? toBucketName;
@override final  String? dropCategoryName;
@override final  AppIcons? dropCategoryIcon;
@override final  String? subscribedDropTitle;
@override final  String? subscribedDropName;
@override final  String? subscribedDropNotes;

/// Create a copy of Drop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropCopyWith<_Drop> get copyWith => __$DropCopyWithImpl<_Drop>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Drop&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.droppedOn, droppedOn) || other.droppedOn == droppedOn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fromBucketId, fromBucketId) || other.fromBucketId == fromBucketId)&&(identical(other.toBucketId, toBucketId) || other.toBucketId == toBucketId)&&(identical(other.dropCategoryId, dropCategoryId) || other.dropCategoryId == dropCategoryId)&&(identical(other.subscribedDropId, subscribedDropId) || other.subscribedDropId == subscribedDropId)&&(identical(other.parentDropId, parentDropId) || other.parentDropId == parentDropId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.fromBucketName, fromBucketName) || other.fromBucketName == fromBucketName)&&(identical(other.toBucketName, toBucketName) || other.toBucketName == toBucketName)&&(identical(other.dropCategoryName, dropCategoryName) || other.dropCategoryName == dropCategoryName)&&(identical(other.dropCategoryIcon, dropCategoryIcon) || other.dropCategoryIcon == dropCategoryIcon)&&(identical(other.subscribedDropTitle, subscribedDropTitle) || other.subscribedDropTitle == subscribedDropTitle)&&(identical(other.subscribedDropName, subscribedDropName) || other.subscribedDropName == subscribedDropName)&&(identical(other.subscribedDropNotes, subscribedDropNotes) || other.subscribedDropNotes == subscribedDropNotes));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,amount,droppedOn,createdAt,updatedAt,fromBucketId,toBucketId,dropCategoryId,subscribedDropId,parentDropId,notes,fromBucketName,toBucketName,dropCategoryName,dropCategoryIcon,subscribedDropTitle,subscribedDropName,subscribedDropNotes]);

@override
String toString() {
  return 'Drop(id: $id, title: $title, amount: $amount, droppedOn: $droppedOn, createdAt: $createdAt, updatedAt: $updatedAt, fromBucketId: $fromBucketId, toBucketId: $toBucketId, dropCategoryId: $dropCategoryId, subscribedDropId: $subscribedDropId, parentDropId: $parentDropId, notes: $notes, fromBucketName: $fromBucketName, toBucketName: $toBucketName, dropCategoryName: $dropCategoryName, dropCategoryIcon: $dropCategoryIcon, subscribedDropTitle: $subscribedDropTitle, subscribedDropName: $subscribedDropName, subscribedDropNotes: $subscribedDropNotes)';
}


}

/// @nodoc
abstract mixin class _$DropCopyWith<$Res> implements $DropCopyWith<$Res> {
  factory _$DropCopyWith(_Drop value, $Res Function(_Drop) _then) = __$DropCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, int amount, DateTime droppedOn, DateTime createdAt, DateTime updatedAt, int? fromBucketId, int? toBucketId, int? dropCategoryId, int? subscribedDropId, int? parentDropId, String? notes, String? fromBucketName, String? toBucketName, String? dropCategoryName, AppIcons? dropCategoryIcon, String? subscribedDropTitle, String? subscribedDropName, String? subscribedDropNotes
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? droppedOn = null,Object? createdAt = null,Object? updatedAt = null,Object? fromBucketId = freezed,Object? toBucketId = freezed,Object? dropCategoryId = freezed,Object? subscribedDropId = freezed,Object? parentDropId = freezed,Object? notes = freezed,Object? fromBucketName = freezed,Object? toBucketName = freezed,Object? dropCategoryName = freezed,Object? dropCategoryIcon = freezed,Object? subscribedDropTitle = freezed,Object? subscribedDropName = freezed,Object? subscribedDropNotes = freezed,}) {
  return _then(_Drop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,droppedOn: null == droppedOn ? _self.droppedOn : droppedOn // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fromBucketId: freezed == fromBucketId ? _self.fromBucketId : fromBucketId // ignore: cast_nullable_to_non_nullable
as int?,toBucketId: freezed == toBucketId ? _self.toBucketId : toBucketId // ignore: cast_nullable_to_non_nullable
as int?,dropCategoryId: freezed == dropCategoryId ? _self.dropCategoryId : dropCategoryId // ignore: cast_nullable_to_non_nullable
as int?,subscribedDropId: freezed == subscribedDropId ? _self.subscribedDropId : subscribedDropId // ignore: cast_nullable_to_non_nullable
as int?,parentDropId: freezed == parentDropId ? _self.parentDropId : parentDropId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,fromBucketName: freezed == fromBucketName ? _self.fromBucketName : fromBucketName // ignore: cast_nullable_to_non_nullable
as String?,toBucketName: freezed == toBucketName ? _self.toBucketName : toBucketName // ignore: cast_nullable_to_non_nullable
as String?,dropCategoryName: freezed == dropCategoryName ? _self.dropCategoryName : dropCategoryName // ignore: cast_nullable_to_non_nullable
as String?,dropCategoryIcon: freezed == dropCategoryIcon ? _self.dropCategoryIcon : dropCategoryIcon // ignore: cast_nullable_to_non_nullable
as AppIcons?,subscribedDropTitle: freezed == subscribedDropTitle ? _self.subscribedDropTitle : subscribedDropTitle // ignore: cast_nullable_to_non_nullable
as String?,subscribedDropName: freezed == subscribedDropName ? _self.subscribedDropName : subscribedDropName // ignore: cast_nullable_to_non_nullable
as String?,subscribedDropNotes: freezed == subscribedDropNotes ? _self.subscribedDropNotes : subscribedDropNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
