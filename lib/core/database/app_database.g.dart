// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $IconsTable extends Icons with TableInfo<$IconsTable, Icon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IconsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codePointMeta = const VerificationMeta(
    'codePoint',
  );
  @override
  late final GeneratedColumn<int> codePoint = GeneratedColumn<int>(
    'code_point',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fontFamilyMeta = const VerificationMeta(
    'fontFamily',
  );
  @override
  late final GeneratedColumn<String> fontFamily = GeneratedColumn<String>(
    'font_family',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('MaterialIcons'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, codePoint, fontFamily, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'icons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Icon> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code_point')) {
      context.handle(
        _codePointMeta,
        codePoint.isAcceptableOrUnknown(data['code_point']!, _codePointMeta),
      );
    } else if (isInserting) {
      context.missing(_codePointMeta);
    }
    if (data.containsKey('font_family')) {
      context.handle(
        _fontFamilyMeta,
        fontFamily.isAcceptableOrUnknown(data['font_family']!, _fontFamilyMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Icon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Icon(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      codePoint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}code_point'],
      )!,
      fontFamily: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}font_family'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
    );
  }

  @override
  $IconsTable createAlias(String alias) {
    return $IconsTable(attachedDatabase, alias);
  }
}

class Icon extends DataClass implements Insertable<Icon> {
  final int id;
  final int codePoint;
  final String fontFamily;
  final String? name;
  const Icon({
    required this.id,
    required this.codePoint,
    required this.fontFamily,
    this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code_point'] = Variable<int>(codePoint);
    map['font_family'] = Variable<String>(fontFamily);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  IconsCompanion toCompanion(bool nullToAbsent) {
    return IconsCompanion(
      id: Value(id),
      codePoint: Value(codePoint),
      fontFamily: Value(fontFamily),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Icon.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Icon(
      id: serializer.fromJson<int>(json['id']),
      codePoint: serializer.fromJson<int>(json['codePoint']),
      fontFamily: serializer.fromJson<String>(json['fontFamily']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'codePoint': serializer.toJson<int>(codePoint),
      'fontFamily': serializer.toJson<String>(fontFamily),
      'name': serializer.toJson<String?>(name),
    };
  }

  Icon copyWith({
    int? id,
    int? codePoint,
    String? fontFamily,
    Value<String?> name = const Value.absent(),
  }) => Icon(
    id: id ?? this.id,
    codePoint: codePoint ?? this.codePoint,
    fontFamily: fontFamily ?? this.fontFamily,
    name: name.present ? name.value : this.name,
  );
  Icon copyWithCompanion(IconsCompanion data) {
    return Icon(
      id: data.id.present ? data.id.value : this.id,
      codePoint: data.codePoint.present ? data.codePoint.value : this.codePoint,
      fontFamily: data.fontFamily.present
          ? data.fontFamily.value
          : this.fontFamily,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Icon(')
          ..write('id: $id, ')
          ..write('codePoint: $codePoint, ')
          ..write('fontFamily: $fontFamily, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, codePoint, fontFamily, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Icon &&
          other.id == this.id &&
          other.codePoint == this.codePoint &&
          other.fontFamily == this.fontFamily &&
          other.name == this.name);
}

class IconsCompanion extends UpdateCompanion<Icon> {
  final Value<int> id;
  final Value<int> codePoint;
  final Value<String> fontFamily;
  final Value<String?> name;
  const IconsCompanion({
    this.id = const Value.absent(),
    this.codePoint = const Value.absent(),
    this.fontFamily = const Value.absent(),
    this.name = const Value.absent(),
  });
  IconsCompanion.insert({
    this.id = const Value.absent(),
    required int codePoint,
    this.fontFamily = const Value.absent(),
    this.name = const Value.absent(),
  }) : codePoint = Value(codePoint);
  static Insertable<Icon> custom({
    Expression<int>? id,
    Expression<int>? codePoint,
    Expression<String>? fontFamily,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codePoint != null) 'code_point': codePoint,
      if (fontFamily != null) 'font_family': fontFamily,
      if (name != null) 'name': name,
    });
  }

  IconsCompanion copyWith({
    Value<int>? id,
    Value<int>? codePoint,
    Value<String>? fontFamily,
    Value<String?>? name,
  }) {
    return IconsCompanion(
      id: id ?? this.id,
      codePoint: codePoint ?? this.codePoint,
      fontFamily: fontFamily ?? this.fontFamily,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (codePoint.present) {
      map['code_point'] = Variable<int>(codePoint.value);
    }
    if (fontFamily.present) {
      map['font_family'] = Variable<String>(fontFamily.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IconsCompanion(')
          ..write('id: $id, ')
          ..write('codePoint: $codePoint, ')
          ..write('fontFamily: $fontFamily, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $BucketsTable extends Buckets with TableInfo<$BucketsTable, Bucket> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BucketsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<BucketType, String> bucketType =
      GeneratedColumn<String>(
        'bucket_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<BucketType>($BucketsTable.$converterbucketType);
  static const VerificationMeta _iconIdMeta = const VerificationMeta('iconId');
  @override
  late final GeneratedColumn<int> iconId = GeneratedColumn<int>(
    'icon_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES icons (id)',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    bucketType,
    iconId,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buckets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Bucket> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_id')) {
      context.handle(
        _iconIdMeta,
        iconId.isAcceptableOrUnknown(data['icon_id']!, _iconIdMeta),
      );
    } else if (isInserting) {
      context.missing(_iconIdMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bucket map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bucket(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      bucketType: $BucketsTable.$converterbucketType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}bucket_type'],
        )!,
      ),
      iconId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_id'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BucketsTable createAlias(String alias) {
    return $BucketsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BucketType, String, String> $converterbucketType =
      const EnumNameConverter<BucketType>(BucketType.values);
}

class Bucket extends DataClass implements Insertable<Bucket> {
  final int id;
  final String name;
  final BucketType bucketType;
  final int iconId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Bucket({
    required this.id,
    required this.name,
    required this.bucketType,
    required this.iconId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['bucket_type'] = Variable<String>(
        $BucketsTable.$converterbucketType.toSql(bucketType),
      );
    }
    map['icon_id'] = Variable<int>(iconId);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BucketsCompanion toCompanion(bool nullToAbsent) {
    return BucketsCompanion(
      id: Value(id),
      name: Value(name),
      bucketType: Value(bucketType),
      iconId: Value(iconId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Bucket.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bucket(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      bucketType: $BucketsTable.$converterbucketType.fromJson(
        serializer.fromJson<String>(json['bucketType']),
      ),
      iconId: serializer.fromJson<int>(json['iconId']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'bucketType': serializer.toJson<String>(
        $BucketsTable.$converterbucketType.toJson(bucketType),
      ),
      'iconId': serializer.toJson<int>(iconId),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Bucket copyWith({
    int? id,
    String? name,
    BucketType? bucketType,
    int? iconId,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Bucket(
    id: id ?? this.id,
    name: name ?? this.name,
    bucketType: bucketType ?? this.bucketType,
    iconId: iconId ?? this.iconId,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Bucket copyWithCompanion(BucketsCompanion data) {
    return Bucket(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      bucketType: data.bucketType.present
          ? data.bucketType.value
          : this.bucketType,
      iconId: data.iconId.present ? data.iconId.value : this.iconId,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Bucket(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('bucketType: $bucketType, ')
          ..write('iconId: $iconId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, bucketType, iconId, notes, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bucket &&
          other.id == this.id &&
          other.name == this.name &&
          other.bucketType == this.bucketType &&
          other.iconId == this.iconId &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketsCompanion extends UpdateCompanion<Bucket> {
  final Value<int> id;
  final Value<String> name;
  final Value<BucketType> bucketType;
  final Value<int> iconId;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.bucketType = const Value.absent(),
    this.iconId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required BucketType bucketType,
    required int iconId,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       bucketType = Value(bucketType),
       iconId = Value(iconId);
  static Insertable<Bucket> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? bucketType,
    Expression<int>? iconId,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (bucketType != null) 'bucket_type': bucketType,
      if (iconId != null) 'icon_id': iconId,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BucketsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<BucketType>? bucketType,
    Value<int>? iconId,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      bucketType: bucketType ?? this.bucketType,
      iconId: iconId ?? this.iconId,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (bucketType.present) {
      map['bucket_type'] = Variable<String>(
        $BucketsTable.$converterbucketType.toSql(bucketType.value),
      );
    }
    if (iconId.present) {
      map['icon_id'] = Variable<int>(iconId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BucketsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('bucketType: $bucketType, ')
          ..write('iconId: $iconId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BucketBalancesTable extends BucketBalances
    with TableInfo<$BucketBalancesTable, BucketBalance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BucketBalancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _bucketIdMeta = const VerificationMeta(
    'bucketId',
  );
  @override
  late final GeneratedColumn<int> bucketId = GeneratedColumn<int>(
    'bucket_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buckets (id)',
    ),
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    bucketId,
    balance,
    date,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bucket_balances';
  @override
  VerificationContext validateIntegrity(
    Insertable<BucketBalance> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bucket_id')) {
      context.handle(
        _bucketIdMeta,
        bucketId.isAcceptableOrUnknown(data['bucket_id']!, _bucketIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bucketIdMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BucketBalance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BucketBalance(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      bucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bucket_id'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BucketBalancesTable createAlias(String alias) {
    return $BucketBalancesTable(attachedDatabase, alias);
  }
}

class BucketBalance extends DataClass implements Insertable<BucketBalance> {
  final int id;
  final int bucketId;
  final int balance;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BucketBalance({
    required this.id,
    required this.bucketId,
    required this.balance,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bucket_id'] = Variable<int>(bucketId);
    map['balance'] = Variable<int>(balance);
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BucketBalancesCompanion toCompanion(bool nullToAbsent) {
    return BucketBalancesCompanion(
      id: Value(id),
      bucketId: Value(bucketId),
      balance: Value(balance),
      date: Value(date),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BucketBalance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BucketBalance(
      id: serializer.fromJson<int>(json['id']),
      bucketId: serializer.fromJson<int>(json['bucketId']),
      balance: serializer.fromJson<int>(json['balance']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bucketId': serializer.toJson<int>(bucketId),
      'balance': serializer.toJson<int>(balance),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BucketBalance copyWith({
    int? id,
    int? bucketId,
    int? balance,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BucketBalance(
    id: id ?? this.id,
    bucketId: bucketId ?? this.bucketId,
    balance: balance ?? this.balance,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BucketBalance copyWithCompanion(BucketBalancesCompanion data) {
    return BucketBalance(
      id: data.id.present ? data.id.value : this.id,
      bucketId: data.bucketId.present ? data.bucketId.value : this.bucketId,
      balance: data.balance.present ? data.balance.value : this.balance,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BucketBalance(')
          ..write('id: $id, ')
          ..write('bucketId: $bucketId, ')
          ..write('balance: $balance, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, bucketId, balance, date, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BucketBalance &&
          other.id == this.id &&
          other.bucketId == this.bucketId &&
          other.balance == this.balance &&
          other.date == this.date &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketBalancesCompanion extends UpdateCompanion<BucketBalance> {
  final Value<int> id;
  final Value<int> bucketId;
  final Value<int> balance;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketBalancesCompanion({
    this.id = const Value.absent(),
    this.bucketId = const Value.absent(),
    this.balance = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketBalancesCompanion.insert({
    this.id = const Value.absent(),
    required int bucketId,
    required int balance,
    required DateTime date,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : bucketId = Value(bucketId),
       balance = Value(balance),
       date = Value(date);
  static Insertable<BucketBalance> custom({
    Expression<int>? id,
    Expression<int>? bucketId,
    Expression<int>? balance,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bucketId != null) 'bucket_id': bucketId,
      if (balance != null) 'balance': balance,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BucketBalancesCompanion copyWith({
    Value<int>? id,
    Value<int>? bucketId,
    Value<int>? balance,
    Value<DateTime>? date,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketBalancesCompanion(
      id: id ?? this.id,
      bucketId: bucketId ?? this.bucketId,
      balance: balance ?? this.balance,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bucketId.present) {
      map['bucket_id'] = Variable<int>(bucketId.value);
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BucketBalancesCompanion(')
          ..write('id: $id, ')
          ..write('bucketId: $bucketId, ')
          ..write('balance: $balance, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _iconIdMeta = const VerificationMeta('iconId');
  @override
  late final GeneratedColumn<int> iconId = GeneratedColumn<int>(
    'icon_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES icons (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, iconId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('icon_id')) {
      context.handle(
        _iconIdMeta,
        iconId.isAcceptableOrUnknown(data['icon_id']!, _iconIdMeta),
      );
    } else if (isInserting) {
      context.missing(_iconIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      iconId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final int iconId;
  final String? name;
  const Category({required this.id, required this.iconId, this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['icon_id'] = Variable<int>(iconId);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      iconId: Value(iconId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      iconId: serializer.fromJson<int>(json['iconId']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'iconId': serializer.toJson<int>(iconId),
      'name': serializer.toJson<String?>(name),
    };
  }

  Category copyWith({
    int? id,
    int? iconId,
    Value<String?> name = const Value.absent(),
  }) => Category(
    id: id ?? this.id,
    iconId: iconId ?? this.iconId,
    name: name.present ? name.value : this.name,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      iconId: data.iconId.present ? data.iconId.value : this.iconId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('iconId: $iconId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, iconId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.iconId == this.iconId &&
          other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<int> iconId;
  final Value<String?> name;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.iconId = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required int iconId,
    this.name = const Value.absent(),
  }) : iconId = Value(iconId);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<int>? iconId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (iconId != null) 'icon_id': iconId,
      if (name != null) 'name': name,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<int>? iconId,
    Value<String?>? name,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      iconId: iconId ?? this.iconId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (iconId.present) {
      map['icon_id'] = Variable<int>(iconId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('iconId: $iconId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $DropsTable extends Drops with TableInfo<$DropsTable, Drop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DropsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id)',
    ),
  );
  static const VerificationMeta _bucketIdMeta = const VerificationMeta(
    'bucketId',
  );
  @override
  late final GeneratedColumn<int> bucketId = GeneratedColumn<int>(
    'bucket_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buckets (id)',
    ),
  );
  static const VerificationMeta _toBucketIdMeta = const VerificationMeta(
    'toBucketId',
  );
  @override
  late final GeneratedColumn<int> toBucketId = GeneratedColumn<int>(
    'to_bucket_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buckets (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DropType, String> dropType =
      GeneratedColumn<String>(
        'drop_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DropType>($DropsTable.$converterdropType);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parentDropIdMeta = const VerificationMeta(
    'parentDropId',
  );
  @override
  late final GeneratedColumn<int> parentDropId = GeneratedColumn<int>(
    'parent_drop_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES drops (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    amount,
    categoryId,
    bucketId,
    toBucketId,
    dropType,
    date,
    notes,
    parentDropId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drops';
  @override
  VerificationContext validateIntegrity(
    Insertable<Drop> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('bucket_id')) {
      context.handle(
        _bucketIdMeta,
        bucketId.isAcceptableOrUnknown(data['bucket_id']!, _bucketIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bucketIdMeta);
    }
    if (data.containsKey('to_bucket_id')) {
      context.handle(
        _toBucketIdMeta,
        toBucketId.isAcceptableOrUnknown(
          data['to_bucket_id']!,
          _toBucketIdMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('parent_drop_id')) {
      context.handle(
        _parentDropIdMeta,
        parentDropId.isAcceptableOrUnknown(
          data['parent_drop_id']!,
          _parentDropIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Drop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Drop(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      bucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bucket_id'],
      )!,
      toBucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_bucket_id'],
      ),
      dropType: $DropsTable.$converterdropType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}drop_type'],
        )!,
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      parentDropId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_drop_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DropsTable createAlias(String alias) {
    return $DropsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DropType, String, String> $converterdropType =
      const EnumNameConverter<DropType>(DropType.values);
}

class Drop extends DataClass implements Insertable<Drop> {
  final int id;
  final String title;
  final int amount;
  final int categoryId;
  final int bucketId;
  final int? toBucketId;
  final DropType dropType;
  final DateTime date;
  final String? notes;
  final int? parentDropId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Drop({
    required this.id,
    required this.title,
    required this.amount,
    required this.categoryId,
    required this.bucketId,
    this.toBucketId,
    required this.dropType,
    required this.date,
    this.notes,
    this.parentDropId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<int>(amount);
    map['category_id'] = Variable<int>(categoryId);
    map['bucket_id'] = Variable<int>(bucketId);
    if (!nullToAbsent || toBucketId != null) {
      map['to_bucket_id'] = Variable<int>(toBucketId);
    }
    {
      map['drop_type'] = Variable<String>(
        $DropsTable.$converterdropType.toSql(dropType),
      );
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || parentDropId != null) {
      map['parent_drop_id'] = Variable<int>(parentDropId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DropsCompanion toCompanion(bool nullToAbsent) {
    return DropsCompanion(
      id: Value(id),
      title: Value(title),
      amount: Value(amount),
      categoryId: Value(categoryId),
      bucketId: Value(bucketId),
      toBucketId: toBucketId == null && nullToAbsent
          ? const Value.absent()
          : Value(toBucketId),
      dropType: Value(dropType),
      date: Value(date),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      parentDropId: parentDropId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentDropId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Drop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Drop(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<int>(json['amount']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      bucketId: serializer.fromJson<int>(json['bucketId']),
      toBucketId: serializer.fromJson<int?>(json['toBucketId']),
      dropType: $DropsTable.$converterdropType.fromJson(
        serializer.fromJson<String>(json['dropType']),
      ),
      date: serializer.fromJson<DateTime>(json['date']),
      notes: serializer.fromJson<String?>(json['notes']),
      parentDropId: serializer.fromJson<int?>(json['parentDropId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<int>(amount),
      'categoryId': serializer.toJson<int>(categoryId),
      'bucketId': serializer.toJson<int>(bucketId),
      'toBucketId': serializer.toJson<int?>(toBucketId),
      'dropType': serializer.toJson<String>(
        $DropsTable.$converterdropType.toJson(dropType),
      ),
      'date': serializer.toJson<DateTime>(date),
      'notes': serializer.toJson<String?>(notes),
      'parentDropId': serializer.toJson<int?>(parentDropId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Drop copyWith({
    int? id,
    String? title,
    int? amount,
    int? categoryId,
    int? bucketId,
    Value<int?> toBucketId = const Value.absent(),
    DropType? dropType,
    DateTime? date,
    Value<String?> notes = const Value.absent(),
    Value<int?> parentDropId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Drop(
    id: id ?? this.id,
    title: title ?? this.title,
    amount: amount ?? this.amount,
    categoryId: categoryId ?? this.categoryId,
    bucketId: bucketId ?? this.bucketId,
    toBucketId: toBucketId.present ? toBucketId.value : this.toBucketId,
    dropType: dropType ?? this.dropType,
    date: date ?? this.date,
    notes: notes.present ? notes.value : this.notes,
    parentDropId: parentDropId.present ? parentDropId.value : this.parentDropId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Drop copyWithCompanion(DropsCompanion data) {
    return Drop(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      amount: data.amount.present ? data.amount.value : this.amount,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      bucketId: data.bucketId.present ? data.bucketId.value : this.bucketId,
      toBucketId: data.toBucketId.present
          ? data.toBucketId.value
          : this.toBucketId,
      dropType: data.dropType.present ? data.dropType.value : this.dropType,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
      parentDropId: data.parentDropId.present
          ? data.parentDropId.value
          : this.parentDropId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Drop(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('categoryId: $categoryId, ')
          ..write('bucketId: $bucketId, ')
          ..write('toBucketId: $toBucketId, ')
          ..write('dropType: $dropType, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('parentDropId: $parentDropId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    amount,
    categoryId,
    bucketId,
    toBucketId,
    dropType,
    date,
    notes,
    parentDropId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Drop &&
          other.id == this.id &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.categoryId == this.categoryId &&
          other.bucketId == this.bucketId &&
          other.toBucketId == this.toBucketId &&
          other.dropType == this.dropType &&
          other.date == this.date &&
          other.notes == this.notes &&
          other.parentDropId == this.parentDropId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DropsCompanion extends UpdateCompanion<Drop> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> amount;
  final Value<int> categoryId;
  final Value<int> bucketId;
  final Value<int?> toBucketId;
  final Value<DropType> dropType;
  final Value<DateTime> date;
  final Value<String?> notes;
  final Value<int?> parentDropId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DropsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.bucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    this.dropType = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.parentDropId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DropsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int amount,
    required int categoryId,
    required int bucketId,
    this.toBucketId = const Value.absent(),
    required DropType dropType,
    required DateTime date,
    this.notes = const Value.absent(),
    this.parentDropId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : title = Value(title),
       amount = Value(amount),
       categoryId = Value(categoryId),
       bucketId = Value(bucketId),
       dropType = Value(dropType),
       date = Value(date),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Drop> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? amount,
    Expression<int>? categoryId,
    Expression<int>? bucketId,
    Expression<int>? toBucketId,
    Expression<String>? dropType,
    Expression<DateTime>? date,
    Expression<String>? notes,
    Expression<int>? parentDropId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (categoryId != null) 'category_id': categoryId,
      if (bucketId != null) 'bucket_id': bucketId,
      if (toBucketId != null) 'to_bucket_id': toBucketId,
      if (dropType != null) 'drop_type': dropType,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (parentDropId != null) 'parent_drop_id': parentDropId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DropsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<int>? amount,
    Value<int>? categoryId,
    Value<int>? bucketId,
    Value<int?>? toBucketId,
    Value<DropType>? dropType,
    Value<DateTime>? date,
    Value<String?>? notes,
    Value<int?>? parentDropId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DropsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      categoryId: categoryId ?? this.categoryId,
      bucketId: bucketId ?? this.bucketId,
      toBucketId: toBucketId ?? this.toBucketId,
      dropType: dropType ?? this.dropType,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      parentDropId: parentDropId ?? this.parentDropId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (bucketId.present) {
      map['bucket_id'] = Variable<int>(bucketId.value);
    }
    if (toBucketId.present) {
      map['to_bucket_id'] = Variable<int>(toBucketId.value);
    }
    if (dropType.present) {
      map['drop_type'] = Variable<String>(
        $DropsTable.$converterdropType.toSql(dropType.value),
      );
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (parentDropId.present) {
      map['parent_drop_id'] = Variable<int>(parentDropId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DropsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('categoryId: $categoryId, ')
          ..write('bucketId: $bucketId, ')
          ..write('toBucketId: $toBucketId, ')
          ..write('dropType: $dropType, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('parentDropId: $parentDropId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $IconsTable icons = $IconsTable(this);
  late final $BucketsTable buckets = $BucketsTable(this);
  late final $BucketBalancesTable bucketBalances = $BucketBalancesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $DropsTable drops = $DropsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    icons,
    buckets,
    bucketBalances,
    categories,
    drops,
  ];
}

typedef $$IconsTableCreateCompanionBuilder =
    IconsCompanion Function({
      Value<int> id,
      required int codePoint,
      Value<String> fontFamily,
      Value<String?> name,
    });
typedef $$IconsTableUpdateCompanionBuilder =
    IconsCompanion Function({
      Value<int> id,
      Value<int> codePoint,
      Value<String> fontFamily,
      Value<String?> name,
    });

final class $$IconsTableReferences
    extends BaseReferences<_$AppDatabase, $IconsTable, Icon> {
  $$IconsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BucketsTable, List<Bucket>> _bucketsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.buckets,
    aliasName: 'icons__id__buckets__icon_id',
  );

  $$BucketsTableProcessedTableManager get bucketsRefs {
    final manager = $$BucketsTableTableManager(
      $_db,
      $_db.buckets,
    ).filter((f) => f.iconId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bucketsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CategoriesTable, List<Category>>
  _categoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.categories,
    aliasName: 'icons__id__categories__icon_id',
  );

  $$CategoriesTableProcessedTableManager get categoriesRefs {
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.iconId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_categoriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IconsTableFilterComposer extends Composer<_$AppDatabase, $IconsTable> {
  $$IconsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get codePoint => $composableBuilder(
    column: $table.codePoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fontFamily => $composableBuilder(
    column: $table.fontFamily,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bucketsRefs(
    Expression<bool> Function($$BucketsTableFilterComposer f) f,
  ) {
    final $$BucketsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.iconId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableFilterComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> categoriesRefs(
    Expression<bool> Function($$CategoriesTableFilterComposer f) f,
  ) {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.iconId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IconsTableOrderingComposer
    extends Composer<_$AppDatabase, $IconsTable> {
  $$IconsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get codePoint => $composableBuilder(
    column: $table.codePoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fontFamily => $composableBuilder(
    column: $table.fontFamily,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IconsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IconsTable> {
  $$IconsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get codePoint =>
      $composableBuilder(column: $table.codePoint, builder: (column) => column);

  GeneratedColumn<String> get fontFamily => $composableBuilder(
    column: $table.fontFamily,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> bucketsRefs<T extends Object>(
    Expression<T> Function($$BucketsTableAnnotationComposer a) f,
  ) {
    final $$BucketsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.iconId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableAnnotationComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> categoriesRefs<T extends Object>(
    Expression<T> Function($$CategoriesTableAnnotationComposer a) f,
  ) {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.iconId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IconsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IconsTable,
          Icon,
          $$IconsTableFilterComposer,
          $$IconsTableOrderingComposer,
          $$IconsTableAnnotationComposer,
          $$IconsTableCreateCompanionBuilder,
          $$IconsTableUpdateCompanionBuilder,
          (Icon, $$IconsTableReferences),
          Icon,
          PrefetchHooks Function({bool bucketsRefs, bool categoriesRefs})
        > {
  $$IconsTableTableManager(_$AppDatabase db, $IconsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IconsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IconsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IconsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> codePoint = const Value.absent(),
                Value<String> fontFamily = const Value.absent(),
                Value<String?> name = const Value.absent(),
              }) => IconsCompanion(
                id: id,
                codePoint: codePoint,
                fontFamily: fontFamily,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int codePoint,
                Value<String> fontFamily = const Value.absent(),
                Value<String?> name = const Value.absent(),
              }) => IconsCompanion.insert(
                id: id,
                codePoint: codePoint,
                fontFamily: fontFamily,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$IconsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({bucketsRefs = false, categoriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (bucketsRefs) db.buckets,
                    if (categoriesRefs) db.categories,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (bucketsRefs)
                        await $_getPrefetchedData<Icon, $IconsTable, Bucket>(
                          currentTable: table,
                          referencedTable: $$IconsTableReferences
                              ._bucketsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IconsTableReferences(db, table, p0).bucketsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.iconId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (categoriesRefs)
                        await $_getPrefetchedData<Icon, $IconsTable, Category>(
                          currentTable: table,
                          referencedTable: $$IconsTableReferences
                              ._categoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IconsTableReferences(
                                db,
                                table,
                                p0,
                              ).categoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.iconId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IconsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IconsTable,
      Icon,
      $$IconsTableFilterComposer,
      $$IconsTableOrderingComposer,
      $$IconsTableAnnotationComposer,
      $$IconsTableCreateCompanionBuilder,
      $$IconsTableUpdateCompanionBuilder,
      (Icon, $$IconsTableReferences),
      Icon,
      PrefetchHooks Function({bool bucketsRefs, bool categoriesRefs})
    >;
typedef $$BucketsTableCreateCompanionBuilder =
    BucketsCompanion Function({
      Value<int> id,
      required String name,
      required BucketType bucketType,
      required int iconId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$BucketsTableUpdateCompanionBuilder =
    BucketsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<BucketType> bucketType,
      Value<int> iconId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$BucketsTableReferences
    extends BaseReferences<_$AppDatabase, $BucketsTable, Bucket> {
  $$BucketsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $IconsTable _iconIdTable(_$AppDatabase db) =>
      db.icons.createAlias('buckets__icon_id__icons__id');

  $$IconsTableProcessedTableManager get iconId {
    final $_column = $_itemColumn<int>('icon_id')!;

    final manager = $$IconsTableTableManager(
      $_db,
      $_db.icons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_iconIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$BucketBalancesTable, List<BucketBalance>>
  _bucketBalancesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bucketBalances,
    aliasName: 'buckets__id__bucket_balances__bucket_id',
  );

  $$BucketBalancesTableProcessedTableManager get bucketBalancesRefs {
    final manager = $$BucketBalancesTableTableManager(
      $_db,
      $_db.bucketBalances,
    ).filter((f) => f.bucketId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bucketBalancesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BucketsTableFilterComposer
    extends Composer<_$AppDatabase, $BucketsTable> {
  $$BucketsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<BucketType, BucketType, String>
  get bucketType => $composableBuilder(
    column: $table.bucketType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$IconsTableFilterComposer get iconId {
    final $$IconsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.iconId,
      referencedTable: $db.icons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IconsTableFilterComposer(
            $db: $db,
            $table: $db.icons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> bucketBalancesRefs(
    Expression<bool> Function($$BucketBalancesTableFilterComposer f) f,
  ) {
    final $$BucketBalancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bucketBalances,
      getReferencedColumn: (t) => t.bucketId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketBalancesTableFilterComposer(
            $db: $db,
            $table: $db.bucketBalances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BucketsTableOrderingComposer
    extends Composer<_$AppDatabase, $BucketsTable> {
  $$BucketsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bucketType => $composableBuilder(
    column: $table.bucketType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$IconsTableOrderingComposer get iconId {
    final $$IconsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.iconId,
      referencedTable: $db.icons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IconsTableOrderingComposer(
            $db: $db,
            $table: $db.icons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BucketsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BucketsTable> {
  $$BucketsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BucketType, String> get bucketType =>
      $composableBuilder(
        column: $table.bucketType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$IconsTableAnnotationComposer get iconId {
    final $$IconsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.iconId,
      referencedTable: $db.icons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IconsTableAnnotationComposer(
            $db: $db,
            $table: $db.icons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> bucketBalancesRefs<T extends Object>(
    Expression<T> Function($$BucketBalancesTableAnnotationComposer a) f,
  ) {
    final $$BucketBalancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bucketBalances,
      getReferencedColumn: (t) => t.bucketId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketBalancesTableAnnotationComposer(
            $db: $db,
            $table: $db.bucketBalances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BucketsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BucketsTable,
          Bucket,
          $$BucketsTableFilterComposer,
          $$BucketsTableOrderingComposer,
          $$BucketsTableAnnotationComposer,
          $$BucketsTableCreateCompanionBuilder,
          $$BucketsTableUpdateCompanionBuilder,
          (Bucket, $$BucketsTableReferences),
          Bucket,
          PrefetchHooks Function({bool iconId, bool bucketBalancesRefs})
        > {
  $$BucketsTableTableManager(_$AppDatabase db, $BucketsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BucketsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BucketsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BucketsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<BucketType> bucketType = const Value.absent(),
                Value<int> iconId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketsCompanion(
                id: id,
                name: name,
                bucketType: bucketType,
                iconId: iconId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required BucketType bucketType,
                required int iconId,
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketsCompanion.insert(
                id: id,
                name: name,
                bucketType: bucketType,
                iconId: iconId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BucketsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({iconId = false, bucketBalancesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (bucketBalancesRefs) db.bucketBalances,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (iconId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.iconId,
                                    referencedTable: $$BucketsTableReferences
                                        ._iconIdTable(db),
                                    referencedColumn: $$BucketsTableReferences
                                        ._iconIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (bucketBalancesRefs)
                        await $_getPrefetchedData<
                          Bucket,
                          $BucketsTable,
                          BucketBalance
                        >(
                          currentTable: table,
                          referencedTable: $$BucketsTableReferences
                              ._bucketBalancesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BucketsTableReferences(
                                db,
                                table,
                                p0,
                              ).bucketBalancesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.bucketId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BucketsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BucketsTable,
      Bucket,
      $$BucketsTableFilterComposer,
      $$BucketsTableOrderingComposer,
      $$BucketsTableAnnotationComposer,
      $$BucketsTableCreateCompanionBuilder,
      $$BucketsTableUpdateCompanionBuilder,
      (Bucket, $$BucketsTableReferences),
      Bucket,
      PrefetchHooks Function({bool iconId, bool bucketBalancesRefs})
    >;
typedef $$BucketBalancesTableCreateCompanionBuilder =
    BucketBalancesCompanion Function({
      Value<int> id,
      required int bucketId,
      required int balance,
      required DateTime date,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$BucketBalancesTableUpdateCompanionBuilder =
    BucketBalancesCompanion Function({
      Value<int> id,
      Value<int> bucketId,
      Value<int> balance,
      Value<DateTime> date,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$BucketBalancesTableReferences
    extends BaseReferences<_$AppDatabase, $BucketBalancesTable, BucketBalance> {
  $$BucketBalancesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BucketsTable _bucketIdTable(_$AppDatabase db) =>
      db.buckets.createAlias('bucket_balances__bucket_id__buckets__id');

  $$BucketsTableProcessedTableManager get bucketId {
    final $_column = $_itemColumn<int>('bucket_id')!;

    final manager = $$BucketsTableTableManager(
      $_db,
      $_db.buckets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bucketIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BucketBalancesTableFilterComposer
    extends Composer<_$AppDatabase, $BucketBalancesTable> {
  $$BucketBalancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BucketsTableFilterComposer get bucketId {
    final $$BucketsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableFilterComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BucketBalancesTableOrderingComposer
    extends Composer<_$AppDatabase, $BucketBalancesTable> {
  $$BucketBalancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BucketsTableOrderingComposer get bucketId {
    final $$BucketsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableOrderingComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BucketBalancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BucketBalancesTable> {
  $$BucketBalancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$BucketsTableAnnotationComposer get bucketId {
    final $$BucketsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableAnnotationComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BucketBalancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BucketBalancesTable,
          BucketBalance,
          $$BucketBalancesTableFilterComposer,
          $$BucketBalancesTableOrderingComposer,
          $$BucketBalancesTableAnnotationComposer,
          $$BucketBalancesTableCreateCompanionBuilder,
          $$BucketBalancesTableUpdateCompanionBuilder,
          (BucketBalance, $$BucketBalancesTableReferences),
          BucketBalance,
          PrefetchHooks Function({bool bucketId})
        > {
  $$BucketBalancesTableTableManager(
    _$AppDatabase db,
    $BucketBalancesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BucketBalancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BucketBalancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BucketBalancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> bucketId = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketBalancesCompanion(
                id: id,
                bucketId: bucketId,
                balance: balance,
                date: date,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int bucketId,
                required int balance,
                required DateTime date,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketBalancesCompanion.insert(
                id: id,
                bucketId: bucketId,
                balance: balance,
                date: date,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BucketBalancesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bucketId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (bucketId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.bucketId,
                                referencedTable: $$BucketBalancesTableReferences
                                    ._bucketIdTable(db),
                                referencedColumn:
                                    $$BucketBalancesTableReferences
                                        ._bucketIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BucketBalancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BucketBalancesTable,
      BucketBalance,
      $$BucketBalancesTableFilterComposer,
      $$BucketBalancesTableOrderingComposer,
      $$BucketBalancesTableAnnotationComposer,
      $$BucketBalancesTableCreateCompanionBuilder,
      $$BucketBalancesTableUpdateCompanionBuilder,
      (BucketBalance, $$BucketBalancesTableReferences),
      BucketBalance,
      PrefetchHooks Function({bool bucketId})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required int iconId,
      Value<String?> name,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<int> iconId,
      Value<String?> name,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $IconsTable _iconIdTable(_$AppDatabase db) =>
      db.icons.createAlias('categories__icon_id__icons__id');

  $$IconsTableProcessedTableManager get iconId {
    final $_column = $_itemColumn<int>('icon_id')!;

    final manager = $$IconsTableTableManager(
      $_db,
      $_db.icons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_iconIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DropsTable, List<Drop>> _dropsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.drops,
    aliasName: 'categories__id__drops__category_id',
  );

  $$DropsTableProcessedTableManager get dropsRefs {
    final manager = $$DropsTableTableManager(
      $_db,
      $_db.drops,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dropsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$IconsTableFilterComposer get iconId {
    final $$IconsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.iconId,
      referencedTable: $db.icons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IconsTableFilterComposer(
            $db: $db,
            $table: $db.icons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dropsRefs(
    Expression<bool> Function($$DropsTableFilterComposer f) f,
  ) {
    final $$DropsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.drops,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropsTableFilterComposer(
            $db: $db,
            $table: $db.drops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$IconsTableOrderingComposer get iconId {
    final $$IconsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.iconId,
      referencedTable: $db.icons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IconsTableOrderingComposer(
            $db: $db,
            $table: $db.icons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$IconsTableAnnotationComposer get iconId {
    final $$IconsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.iconId,
      referencedTable: $db.icons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IconsTableAnnotationComposer(
            $db: $db,
            $table: $db.icons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dropsRefs<T extends Object>(
    Expression<T> Function($$DropsTableAnnotationComposer a) f,
  ) {
    final $$DropsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.drops,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropsTableAnnotationComposer(
            $db: $db,
            $table: $db.drops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool iconId, bool dropsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> iconId = const Value.absent(),
                Value<String?> name = const Value.absent(),
              }) => CategoriesCompanion(id: id, iconId: iconId, name: name),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int iconId,
                Value<String?> name = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                iconId: iconId,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({iconId = false, dropsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dropsRefs) db.drops],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (iconId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.iconId,
                                referencedTable: $$CategoriesTableReferences
                                    ._iconIdTable(db),
                                referencedColumn: $$CategoriesTableReferences
                                    ._iconIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dropsRefs)
                    await $_getPrefetchedData<Category, $CategoriesTable, Drop>(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._dropsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(db, table, p0).dropsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool iconId, bool dropsRefs})
    >;
typedef $$DropsTableCreateCompanionBuilder =
    DropsCompanion Function({
      Value<int> id,
      required String title,
      required int amount,
      required int categoryId,
      required int bucketId,
      Value<int?> toBucketId,
      required DropType dropType,
      required DateTime date,
      Value<String?> notes,
      Value<int?> parentDropId,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$DropsTableUpdateCompanionBuilder =
    DropsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<int> amount,
      Value<int> categoryId,
      Value<int> bucketId,
      Value<int?> toBucketId,
      Value<DropType> dropType,
      Value<DateTime> date,
      Value<String?> notes,
      Value<int?> parentDropId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$DropsTableReferences
    extends BaseReferences<_$AppDatabase, $DropsTable, Drop> {
  $$DropsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('drops__category_id__categories__id');

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BucketsTable _bucketIdTable(_$AppDatabase db) =>
      db.buckets.createAlias('drops__bucket_id__buckets__id');

  $$BucketsTableProcessedTableManager get bucketId {
    final $_column = $_itemColumn<int>('bucket_id')!;

    final manager = $$BucketsTableTableManager(
      $_db,
      $_db.buckets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bucketIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BucketsTable _toBucketIdTable(_$AppDatabase db) =>
      db.buckets.createAlias('drops__to_bucket_id__buckets__id');

  $$BucketsTableProcessedTableManager? get toBucketId {
    final $_column = $_itemColumn<int>('to_bucket_id');
    if ($_column == null) return null;
    final manager = $$BucketsTableTableManager(
      $_db,
      $_db.buckets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toBucketIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DropsTable _parentDropIdTable(_$AppDatabase db) =>
      db.drops.createAlias('drops__parent_drop_id__drops__id');

  $$DropsTableProcessedTableManager? get parentDropId {
    final $_column = $_itemColumn<int>('parent_drop_id');
    if ($_column == null) return null;
    final manager = $$DropsTableTableManager(
      $_db,
      $_db.drops,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentDropIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DropsTableFilterComposer extends Composer<_$AppDatabase, $DropsTable> {
  $$DropsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DropType, DropType, String> get dropType =>
      $composableBuilder(
        column: $table.dropType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BucketsTableFilterComposer get bucketId {
    final $$BucketsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableFilterComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BucketsTableFilterComposer get toBucketId {
    final $$BucketsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toBucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableFilterComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DropsTableFilterComposer get parentDropId {
    final $$DropsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentDropId,
      referencedTable: $db.drops,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropsTableFilterComposer(
            $db: $db,
            $table: $db.drops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DropsTableOrderingComposer
    extends Composer<_$AppDatabase, $DropsTable> {
  $$DropsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dropType => $composableBuilder(
    column: $table.dropType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BucketsTableOrderingComposer get bucketId {
    final $$BucketsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableOrderingComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BucketsTableOrderingComposer get toBucketId {
    final $$BucketsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toBucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableOrderingComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DropsTableOrderingComposer get parentDropId {
    final $$DropsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentDropId,
      referencedTable: $db.drops,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropsTableOrderingComposer(
            $db: $db,
            $table: $db.drops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DropsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DropsTable> {
  $$DropsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DropType, String> get dropType =>
      $composableBuilder(column: $table.dropType, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BucketsTableAnnotationComposer get bucketId {
    final $$BucketsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableAnnotationComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BucketsTableAnnotationComposer get toBucketId {
    final $$BucketsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toBucketId,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketsTableAnnotationComposer(
            $db: $db,
            $table: $db.buckets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DropsTableAnnotationComposer get parentDropId {
    final $$DropsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentDropId,
      referencedTable: $db.drops,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropsTableAnnotationComposer(
            $db: $db,
            $table: $db.drops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DropsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DropsTable,
          Drop,
          $$DropsTableFilterComposer,
          $$DropsTableOrderingComposer,
          $$DropsTableAnnotationComposer,
          $$DropsTableCreateCompanionBuilder,
          $$DropsTableUpdateCompanionBuilder,
          (Drop, $$DropsTableReferences),
          Drop,
          PrefetchHooks Function({
            bool categoryId,
            bool bucketId,
            bool toBucketId,
            bool parentDropId,
          })
        > {
  $$DropsTableTableManager(_$AppDatabase db, $DropsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DropsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DropsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DropsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> bucketId = const Value.absent(),
                Value<int?> toBucketId = const Value.absent(),
                Value<DropType> dropType = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> parentDropId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DropsCompanion(
                id: id,
                title: title,
                amount: amount,
                categoryId: categoryId,
                bucketId: bucketId,
                toBucketId: toBucketId,
                dropType: dropType,
                date: date,
                notes: notes,
                parentDropId: parentDropId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required int amount,
                required int categoryId,
                required int bucketId,
                Value<int?> toBucketId = const Value.absent(),
                required DropType dropType,
                required DateTime date,
                Value<String?> notes = const Value.absent(),
                Value<int?> parentDropId = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => DropsCompanion.insert(
                id: id,
                title: title,
                amount: amount,
                categoryId: categoryId,
                bucketId: bucketId,
                toBucketId: toBucketId,
                dropType: dropType,
                date: date,
                notes: notes,
                parentDropId: parentDropId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$DropsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                categoryId = false,
                bucketId = false,
                toBucketId = false,
                parentDropId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable: $$DropsTableReferences
                                        ._categoryIdTable(db),
                                    referencedColumn: $$DropsTableReferences
                                        ._categoryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (bucketId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.bucketId,
                                    referencedTable: $$DropsTableReferences
                                        ._bucketIdTable(db),
                                    referencedColumn: $$DropsTableReferences
                                        ._bucketIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (toBucketId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.toBucketId,
                                    referencedTable: $$DropsTableReferences
                                        ._toBucketIdTable(db),
                                    referencedColumn: $$DropsTableReferences
                                        ._toBucketIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (parentDropId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.parentDropId,
                                    referencedTable: $$DropsTableReferences
                                        ._parentDropIdTable(db),
                                    referencedColumn: $$DropsTableReferences
                                        ._parentDropIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$DropsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DropsTable,
      Drop,
      $$DropsTableFilterComposer,
      $$DropsTableOrderingComposer,
      $$DropsTableAnnotationComposer,
      $$DropsTableCreateCompanionBuilder,
      $$DropsTableUpdateCompanionBuilder,
      (Drop, $$DropsTableReferences),
      Drop,
      PrefetchHooks Function({
        bool categoryId,
        bool bucketId,
        bool toBucketId,
        bool parentDropId,
      })
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$IconsTableTableManager get icons =>
      $$IconsTableTableManager(_db, _db.icons);
  $$BucketsTableTableManager get buckets =>
      $$BucketsTableTableManager(_db, _db.buckets);
  $$BucketBalancesTableTableManager get bucketBalances =>
      $$BucketBalancesTableTableManager(_db, _db.bucketBalances);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$DropsTableTableManager get drops =>
      $$DropsTableTableManager(_db, _db.drops);
}
