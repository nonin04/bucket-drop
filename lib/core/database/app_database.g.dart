// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BucketCategoriesTable extends BucketCategories
    with TableInfo<$BucketCategoriesTable, BucketCategoryTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BucketCategoriesTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumnWithTypeConverter<BalanceType, String> balanceType =
      GeneratedColumn<String>(
        'balance_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<BalanceType>(
        $BucketCategoriesTable.$converterbalanceType,
      );
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
    'sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    balanceType,
    sort,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bucket_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<BucketCategoryTable> instance, {
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
    if (data.containsKey('sort')) {
      context.handle(
        _sortMeta,
        sort.isAcceptableOrUnknown(data['sort']!, _sortMeta),
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
  BucketCategoryTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BucketCategoryTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      balanceType: $BucketCategoriesTable.$converterbalanceType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}balance_type'],
        )!,
      ),
      sort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort'],
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
  $BucketCategoriesTable createAlias(String alias) {
    return $BucketCategoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BalanceType, String, String> $converterbalanceType =
      const EnumNameConverter<BalanceType>(BalanceType.values);
}

class BucketCategoryTable extends DataClass
    implements Insertable<BucketCategoryTable> {
  final int id;
  final String name;
  final BalanceType balanceType;
  final int sort;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BucketCategoryTable({
    required this.id,
    required this.name,
    required this.balanceType,
    required this.sort,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['balance_type'] = Variable<String>(
        $BucketCategoriesTable.$converterbalanceType.toSql(balanceType),
      );
    }
    map['sort'] = Variable<int>(sort);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BucketCategoriesCompanion toCompanion(bool nullToAbsent) {
    return BucketCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      balanceType: Value(balanceType),
      sort: Value(sort),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BucketCategoryTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BucketCategoryTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      balanceType: $BucketCategoriesTable.$converterbalanceType.fromJson(
        serializer.fromJson<String>(json['balanceType']),
      ),
      sort: serializer.fromJson<int>(json['sort']),
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
      'balanceType': serializer.toJson<String>(
        $BucketCategoriesTable.$converterbalanceType.toJson(balanceType),
      ),
      'sort': serializer.toJson<int>(sort),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BucketCategoryTable copyWith({
    int? id,
    String? name,
    BalanceType? balanceType,
    int? sort,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BucketCategoryTable(
    id: id ?? this.id,
    name: name ?? this.name,
    balanceType: balanceType ?? this.balanceType,
    sort: sort ?? this.sort,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BucketCategoryTable copyWithCompanion(BucketCategoriesCompanion data) {
    return BucketCategoryTable(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      balanceType: data.balanceType.present
          ? data.balanceType.value
          : this.balanceType,
      sort: data.sort.present ? data.sort.value : this.sort,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BucketCategoryTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('balanceType: $balanceType, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, balanceType, sort, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BucketCategoryTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.balanceType == this.balanceType &&
          other.sort == this.sort &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketCategoriesCompanion extends UpdateCompanion<BucketCategoryTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<BalanceType> balanceType;
  final Value<int> sort;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.balanceType = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required BalanceType balanceType,
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       balanceType = Value(balanceType);
  static Insertable<BucketCategoryTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? balanceType,
    Expression<int>? sort,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (balanceType != null) 'balance_type': balanceType,
      if (sort != null) 'sort': sort,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BucketCategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<BalanceType>? balanceType,
    Value<int>? sort,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      balanceType: balanceType ?? this.balanceType,
      sort: sort ?? this.sort,
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
    if (balanceType.present) {
      map['balance_type'] = Variable<String>(
        $BucketCategoriesTable.$converterbalanceType.toSql(balanceType.value),
      );
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
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
    return (StringBuffer('BucketCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('balanceType: $balanceType, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $IconsTable extends Icons with TableInfo<$IconsTable, IconTable> {
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
    Insertable<IconTable> instance, {
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
  IconTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IconTable(
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

class IconTable extends DataClass implements Insertable<IconTable> {
  final int id;
  final int codePoint;
  final String fontFamily;
  final String? name;
  const IconTable({
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

  factory IconTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IconTable(
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

  IconTable copyWith({
    int? id,
    int? codePoint,
    String? fontFamily,
    Value<String?> name = const Value.absent(),
  }) => IconTable(
    id: id ?? this.id,
    codePoint: codePoint ?? this.codePoint,
    fontFamily: fontFamily ?? this.fontFamily,
    name: name.present ? name.value : this.name,
  );
  IconTable copyWithCompanion(IconsCompanion data) {
    return IconTable(
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
    return (StringBuffer('IconTable(')
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
      (other is IconTable &&
          other.id == this.id &&
          other.codePoint == this.codePoint &&
          other.fontFamily == this.fontFamily &&
          other.name == this.name);
}

class IconsCompanion extends UpdateCompanion<IconTable> {
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
  static Insertable<IconTable> custom({
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

class $BucketsTable extends Buckets with TableInfo<$BucketsTable, BucketTable> {
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
  static const VerificationMeta _bucketCategoryIdMeta = const VerificationMeta(
    'bucketCategoryId',
  );
  @override
  late final GeneratedColumn<int> bucketCategoryId = GeneratedColumn<int>(
    'bucket_category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bucket_categories (id)',
    ),
  );
  static const VerificationMeta _iconIdMeta = const VerificationMeta('iconId');
  @override
  late final GeneratedColumn<int> iconId = GeneratedColumn<int>(
    'icon_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
    'sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isDefaultExpenseMeta = const VerificationMeta(
    'isDefaultExpense',
  );
  @override
  late final GeneratedColumn<bool> isDefaultExpense = GeneratedColumn<bool>(
    'is_default_expense',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default_expense" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isDefaultIncomeMeta = const VerificationMeta(
    'isDefaultIncome',
  );
  @override
  late final GeneratedColumn<bool> isDefaultIncome = GeneratedColumn<bool>(
    'is_default_income',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default_income" IN (0, 1))',
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
    bucketCategoryId,
    iconId,
    notes,
    sort,
    isDefaultExpense,
    isDefaultIncome,
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
    Insertable<BucketTable> instance, {
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
    if (data.containsKey('bucket_category_id')) {
      context.handle(
        _bucketCategoryIdMeta,
        bucketCategoryId.isAcceptableOrUnknown(
          data['bucket_category_id']!,
          _bucketCategoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bucketCategoryIdMeta);
    }
    if (data.containsKey('icon_id')) {
      context.handle(
        _iconIdMeta,
        iconId.isAcceptableOrUnknown(data['icon_id']!, _iconIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('sort')) {
      context.handle(
        _sortMeta,
        sort.isAcceptableOrUnknown(data['sort']!, _sortMeta),
      );
    }
    if (data.containsKey('is_default_expense')) {
      context.handle(
        _isDefaultExpenseMeta,
        isDefaultExpense.isAcceptableOrUnknown(
          data['is_default_expense']!,
          _isDefaultExpenseMeta,
        ),
      );
    }
    if (data.containsKey('is_default_income')) {
      context.handle(
        _isDefaultIncomeMeta,
        isDefaultIncome.isAcceptableOrUnknown(
          data['is_default_income']!,
          _isDefaultIncomeMeta,
        ),
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
  BucketTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BucketTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      bucketCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bucket_category_id'],
      )!,
      iconId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      sort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort'],
      )!,
      isDefaultExpense: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default_expense'],
      ),
      isDefaultIncome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default_income'],
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
}

class BucketTable extends DataClass implements Insertable<BucketTable> {
  final int id;
  final String name;
  final int bucketCategoryId;
  final int? iconId;
  final String? notes;
  final int sort;
  final bool? isDefaultExpense;
  final bool? isDefaultIncome;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BucketTable({
    required this.id,
    required this.name,
    required this.bucketCategoryId,
    this.iconId,
    this.notes,
    required this.sort,
    this.isDefaultExpense,
    this.isDefaultIncome,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['bucket_category_id'] = Variable<int>(bucketCategoryId);
    if (!nullToAbsent || iconId != null) {
      map['icon_id'] = Variable<int>(iconId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['sort'] = Variable<int>(sort);
    if (!nullToAbsent || isDefaultExpense != null) {
      map['is_default_expense'] = Variable<bool>(isDefaultExpense);
    }
    if (!nullToAbsent || isDefaultIncome != null) {
      map['is_default_income'] = Variable<bool>(isDefaultIncome);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BucketsCompanion toCompanion(bool nullToAbsent) {
    return BucketsCompanion(
      id: Value(id),
      name: Value(name),
      bucketCategoryId: Value(bucketCategoryId),
      iconId: iconId == null && nullToAbsent
          ? const Value.absent()
          : Value(iconId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      sort: Value(sort),
      isDefaultExpense: isDefaultExpense == null && nullToAbsent
          ? const Value.absent()
          : Value(isDefaultExpense),
      isDefaultIncome: isDefaultIncome == null && nullToAbsent
          ? const Value.absent()
          : Value(isDefaultIncome),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BucketTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BucketTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      bucketCategoryId: serializer.fromJson<int>(json['bucketCategoryId']),
      iconId: serializer.fromJson<int?>(json['iconId']),
      notes: serializer.fromJson<String?>(json['notes']),
      sort: serializer.fromJson<int>(json['sort']),
      isDefaultExpense: serializer.fromJson<bool?>(json['isDefaultExpense']),
      isDefaultIncome: serializer.fromJson<bool?>(json['isDefaultIncome']),
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
      'bucketCategoryId': serializer.toJson<int>(bucketCategoryId),
      'iconId': serializer.toJson<int?>(iconId),
      'notes': serializer.toJson<String?>(notes),
      'sort': serializer.toJson<int>(sort),
      'isDefaultExpense': serializer.toJson<bool?>(isDefaultExpense),
      'isDefaultIncome': serializer.toJson<bool?>(isDefaultIncome),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BucketTable copyWith({
    int? id,
    String? name,
    int? bucketCategoryId,
    Value<int?> iconId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    int? sort,
    Value<bool?> isDefaultExpense = const Value.absent(),
    Value<bool?> isDefaultIncome = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BucketTable(
    id: id ?? this.id,
    name: name ?? this.name,
    bucketCategoryId: bucketCategoryId ?? this.bucketCategoryId,
    iconId: iconId.present ? iconId.value : this.iconId,
    notes: notes.present ? notes.value : this.notes,
    sort: sort ?? this.sort,
    isDefaultExpense: isDefaultExpense.present
        ? isDefaultExpense.value
        : this.isDefaultExpense,
    isDefaultIncome: isDefaultIncome.present
        ? isDefaultIncome.value
        : this.isDefaultIncome,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BucketTable copyWithCompanion(BucketsCompanion data) {
    return BucketTable(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      bucketCategoryId: data.bucketCategoryId.present
          ? data.bucketCategoryId.value
          : this.bucketCategoryId,
      iconId: data.iconId.present ? data.iconId.value : this.iconId,
      notes: data.notes.present ? data.notes.value : this.notes,
      sort: data.sort.present ? data.sort.value : this.sort,
      isDefaultExpense: data.isDefaultExpense.present
          ? data.isDefaultExpense.value
          : this.isDefaultExpense,
      isDefaultIncome: data.isDefaultIncome.present
          ? data.isDefaultIncome.value
          : this.isDefaultIncome,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BucketTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('bucketCategoryId: $bucketCategoryId, ')
          ..write('iconId: $iconId, ')
          ..write('notes: $notes, ')
          ..write('sort: $sort, ')
          ..write('isDefaultExpense: $isDefaultExpense, ')
          ..write('isDefaultIncome: $isDefaultIncome, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    bucketCategoryId,
    iconId,
    notes,
    sort,
    isDefaultExpense,
    isDefaultIncome,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BucketTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.bucketCategoryId == this.bucketCategoryId &&
          other.iconId == this.iconId &&
          other.notes == this.notes &&
          other.sort == this.sort &&
          other.isDefaultExpense == this.isDefaultExpense &&
          other.isDefaultIncome == this.isDefaultIncome &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketsCompanion extends UpdateCompanion<BucketTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> bucketCategoryId;
  final Value<int?> iconId;
  final Value<String?> notes;
  final Value<int> sort;
  final Value<bool?> isDefaultExpense;
  final Value<bool?> isDefaultIncome;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.bucketCategoryId = const Value.absent(),
    this.iconId = const Value.absent(),
    this.notes = const Value.absent(),
    this.sort = const Value.absent(),
    this.isDefaultExpense = const Value.absent(),
    this.isDefaultIncome = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int bucketCategoryId,
    this.iconId = const Value.absent(),
    this.notes = const Value.absent(),
    this.sort = const Value.absent(),
    this.isDefaultExpense = const Value.absent(),
    this.isDefaultIncome = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       bucketCategoryId = Value(bucketCategoryId);
  static Insertable<BucketTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? bucketCategoryId,
    Expression<int>? iconId,
    Expression<String>? notes,
    Expression<int>? sort,
    Expression<bool>? isDefaultExpense,
    Expression<bool>? isDefaultIncome,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (bucketCategoryId != null) 'bucket_category_id': bucketCategoryId,
      if (iconId != null) 'icon_id': iconId,
      if (notes != null) 'notes': notes,
      if (sort != null) 'sort': sort,
      if (isDefaultExpense != null) 'is_default_expense': isDefaultExpense,
      if (isDefaultIncome != null) 'is_default_income': isDefaultIncome,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BucketsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? bucketCategoryId,
    Value<int?>? iconId,
    Value<String?>? notes,
    Value<int>? sort,
    Value<bool?>? isDefaultExpense,
    Value<bool?>? isDefaultIncome,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      bucketCategoryId: bucketCategoryId ?? this.bucketCategoryId,
      iconId: iconId ?? this.iconId,
      notes: notes ?? this.notes,
      sort: sort ?? this.sort,
      isDefaultExpense: isDefaultExpense ?? this.isDefaultExpense,
      isDefaultIncome: isDefaultIncome ?? this.isDefaultIncome,
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
    if (bucketCategoryId.present) {
      map['bucket_category_id'] = Variable<int>(bucketCategoryId.value);
    }
    if (iconId.present) {
      map['icon_id'] = Variable<int>(iconId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (isDefaultExpense.present) {
      map['is_default_expense'] = Variable<bool>(isDefaultExpense.value);
    }
    if (isDefaultIncome.present) {
      map['is_default_income'] = Variable<bool>(isDefaultIncome.value);
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
          ..write('bucketCategoryId: $bucketCategoryId, ')
          ..write('iconId: $iconId, ')
          ..write('notes: $notes, ')
          ..write('sort: $sort, ')
          ..write('isDefaultExpense: $isDefaultExpense, ')
          ..write('isDefaultIncome: $isDefaultIncome, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BucketSnapshotsTable extends BucketSnapshots
    with TableInfo<$BucketSnapshotsTable, BucketSnapshotTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BucketSnapshotsTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'bucket_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<BucketSnapshotTable> instance, {
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
  BucketSnapshotTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BucketSnapshotTable(
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
  $BucketSnapshotsTable createAlias(String alias) {
    return $BucketSnapshotsTable(attachedDatabase, alias);
  }
}

class BucketSnapshotTable extends DataClass
    implements Insertable<BucketSnapshotTable> {
  final int id;
  final int bucketId;
  final int balance;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BucketSnapshotTable({
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

  BucketSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return BucketSnapshotsCompanion(
      id: Value(id),
      bucketId: Value(bucketId),
      balance: Value(balance),
      date: Value(date),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BucketSnapshotTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BucketSnapshotTable(
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

  BucketSnapshotTable copyWith({
    int? id,
    int? bucketId,
    int? balance,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BucketSnapshotTable(
    id: id ?? this.id,
    bucketId: bucketId ?? this.bucketId,
    balance: balance ?? this.balance,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BucketSnapshotTable copyWithCompanion(BucketSnapshotsCompanion data) {
    return BucketSnapshotTable(
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
    return (StringBuffer('BucketSnapshotTable(')
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
      (other is BucketSnapshotTable &&
          other.id == this.id &&
          other.bucketId == this.bucketId &&
          other.balance == this.balance &&
          other.date == this.date &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketSnapshotsCompanion extends UpdateCompanion<BucketSnapshotTable> {
  final Value<int> id;
  final Value<int> bucketId;
  final Value<int> balance;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketSnapshotsCompanion({
    this.id = const Value.absent(),
    this.bucketId = const Value.absent(),
    this.balance = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketSnapshotsCompanion.insert({
    this.id = const Value.absent(),
    required int bucketId,
    required int balance,
    required DateTime date,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : bucketId = Value(bucketId),
       balance = Value(balance),
       date = Value(date);
  static Insertable<BucketSnapshotTable> custom({
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

  BucketSnapshotsCompanion copyWith({
    Value<int>? id,
    Value<int>? bucketId,
    Value<int>? balance,
    Value<DateTime>? date,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketSnapshotsCompanion(
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
    return (StringBuffer('BucketSnapshotsCompanion(')
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

class $DropCategoriesTable extends DropCategories
    with TableInfo<$DropCategoriesTable, DropCategoryTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DropCategoriesTable(this.attachedDatabase, [this._alias]);
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DropType, String> dropType =
      GeneratedColumn<String>(
        'drop_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DropType>($DropCategoriesTable.$converterdropType);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
    'sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    iconId,
    name,
    dropType,
    note,
    sort,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drop_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<DropCategoryTable> instance, {
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
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('sort')) {
      context.handle(
        _sortMeta,
        sort.isAcceptableOrUnknown(data['sort']!, _sortMeta),
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
  DropCategoryTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DropCategoryTable(
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
      )!,
      dropType: $DropCategoriesTable.$converterdropType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}drop_type'],
        )!,
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      sort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort'],
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
  $DropCategoriesTable createAlias(String alias) {
    return $DropCategoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DropType, String, String> $converterdropType =
      const EnumNameConverter<DropType>(DropType.values);
}

class DropCategoryTable extends DataClass
    implements Insertable<DropCategoryTable> {
  final int id;
  final int iconId;
  final String name;
  final DropType dropType;
  final String? note;
  final int sort;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DropCategoryTable({
    required this.id,
    required this.iconId,
    required this.name,
    required this.dropType,
    this.note,
    required this.sort,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['icon_id'] = Variable<int>(iconId);
    map['name'] = Variable<String>(name);
    {
      map['drop_type'] = Variable<String>(
        $DropCategoriesTable.$converterdropType.toSql(dropType),
      );
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['sort'] = Variable<int>(sort);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DropCategoriesCompanion toCompanion(bool nullToAbsent) {
    return DropCategoriesCompanion(
      id: Value(id),
      iconId: Value(iconId),
      name: Value(name),
      dropType: Value(dropType),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      sort: Value(sort),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DropCategoryTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DropCategoryTable(
      id: serializer.fromJson<int>(json['id']),
      iconId: serializer.fromJson<int>(json['iconId']),
      name: serializer.fromJson<String>(json['name']),
      dropType: $DropCategoriesTable.$converterdropType.fromJson(
        serializer.fromJson<String>(json['dropType']),
      ),
      note: serializer.fromJson<String?>(json['note']),
      sort: serializer.fromJson<int>(json['sort']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'iconId': serializer.toJson<int>(iconId),
      'name': serializer.toJson<String>(name),
      'dropType': serializer.toJson<String>(
        $DropCategoriesTable.$converterdropType.toJson(dropType),
      ),
      'note': serializer.toJson<String?>(note),
      'sort': serializer.toJson<int>(sort),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DropCategoryTable copyWith({
    int? id,
    int? iconId,
    String? name,
    DropType? dropType,
    Value<String?> note = const Value.absent(),
    int? sort,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DropCategoryTable(
    id: id ?? this.id,
    iconId: iconId ?? this.iconId,
    name: name ?? this.name,
    dropType: dropType ?? this.dropType,
    note: note.present ? note.value : this.note,
    sort: sort ?? this.sort,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DropCategoryTable copyWithCompanion(DropCategoriesCompanion data) {
    return DropCategoryTable(
      id: data.id.present ? data.id.value : this.id,
      iconId: data.iconId.present ? data.iconId.value : this.iconId,
      name: data.name.present ? data.name.value : this.name,
      dropType: data.dropType.present ? data.dropType.value : this.dropType,
      note: data.note.present ? data.note.value : this.note,
      sort: data.sort.present ? data.sort.value : this.sort,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DropCategoryTable(')
          ..write('id: $id, ')
          ..write('iconId: $iconId, ')
          ..write('name: $name, ')
          ..write('dropType: $dropType, ')
          ..write('note: $note, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, iconId, name, dropType, note, sort, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DropCategoryTable &&
          other.id == this.id &&
          other.iconId == this.iconId &&
          other.name == this.name &&
          other.dropType == this.dropType &&
          other.note == this.note &&
          other.sort == this.sort &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DropCategoriesCompanion extends UpdateCompanion<DropCategoryTable> {
  final Value<int> id;
  final Value<int> iconId;
  final Value<String> name;
  final Value<DropType> dropType;
  final Value<String?> note;
  final Value<int> sort;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DropCategoriesCompanion({
    this.id = const Value.absent(),
    this.iconId = const Value.absent(),
    this.name = const Value.absent(),
    this.dropType = const Value.absent(),
    this.note = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DropCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required int iconId,
    required String name,
    required DropType dropType,
    this.note = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : iconId = Value(iconId),
       name = Value(name),
       dropType = Value(dropType);
  static Insertable<DropCategoryTable> custom({
    Expression<int>? id,
    Expression<int>? iconId,
    Expression<String>? name,
    Expression<String>? dropType,
    Expression<String>? note,
    Expression<int>? sort,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (iconId != null) 'icon_id': iconId,
      if (name != null) 'name': name,
      if (dropType != null) 'drop_type': dropType,
      if (note != null) 'note': note,
      if (sort != null) 'sort': sort,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DropCategoriesCompanion copyWith({
    Value<int>? id,
    Value<int>? iconId,
    Value<String>? name,
    Value<DropType>? dropType,
    Value<String?>? note,
    Value<int>? sort,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DropCategoriesCompanion(
      id: id ?? this.id,
      iconId: iconId ?? this.iconId,
      name: name ?? this.name,
      dropType: dropType ?? this.dropType,
      note: note ?? this.note,
      sort: sort ?? this.sort,
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
    if (iconId.present) {
      map['icon_id'] = Variable<int>(iconId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dropType.present) {
      map['drop_type'] = Variable<String>(
        $DropCategoriesTable.$converterdropType.toSql(dropType.value),
      );
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
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
    return (StringBuffer('DropCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('iconId: $iconId, ')
          ..write('name: $name, ')
          ..write('dropType: $dropType, ')
          ..write('note: $note, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DropsTable extends Drops with TableInfo<$DropsTable, DropTable> {
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
  static const VerificationMeta _dropCategoryIdMeta = const VerificationMeta(
    'dropCategoryId',
  );
  @override
  late final GeneratedColumn<int> dropCategoryId = GeneratedColumn<int>(
    'drop_category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES drop_categories (id)',
    ),
  );
  static const VerificationMeta _bucketIdMeta = const VerificationMeta(
    'bucketId',
  );
  @override
  late final GeneratedColumn<int> bucketId = GeneratedColumn<int>(
    'bucket_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
    title,
    amount,
    dropCategoryId,
    bucketId,
    toBucketId,
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
    Insertable<DropTable> instance, {
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
    if (data.containsKey('drop_category_id')) {
      context.handle(
        _dropCategoryIdMeta,
        dropCategoryId.isAcceptableOrUnknown(
          data['drop_category_id']!,
          _dropCategoryIdMeta,
        ),
      );
    }
    if (data.containsKey('bucket_id')) {
      context.handle(
        _bucketIdMeta,
        bucketId.isAcceptableOrUnknown(data['bucket_id']!, _bucketIdMeta),
      );
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
  DropTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DropTable(
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
      dropCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}drop_category_id'],
      ),
      bucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bucket_id'],
      ),
      toBucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_bucket_id'],
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
}

class DropTable extends DataClass implements Insertable<DropTable> {
  final int id;
  final String title;
  final int amount;
  final int? dropCategoryId;
  final int? bucketId;
  final int? toBucketId;
  final DateTime date;
  final String? notes;
  final int? parentDropId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DropTable({
    required this.id,
    required this.title,
    required this.amount,
    this.dropCategoryId,
    this.bucketId,
    this.toBucketId,
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
    if (!nullToAbsent || dropCategoryId != null) {
      map['drop_category_id'] = Variable<int>(dropCategoryId);
    }
    if (!nullToAbsent || bucketId != null) {
      map['bucket_id'] = Variable<int>(bucketId);
    }
    if (!nullToAbsent || toBucketId != null) {
      map['to_bucket_id'] = Variable<int>(toBucketId);
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
      dropCategoryId: dropCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(dropCategoryId),
      bucketId: bucketId == null && nullToAbsent
          ? const Value.absent()
          : Value(bucketId),
      toBucketId: toBucketId == null && nullToAbsent
          ? const Value.absent()
          : Value(toBucketId),
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

  factory DropTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DropTable(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<int>(json['amount']),
      dropCategoryId: serializer.fromJson<int?>(json['dropCategoryId']),
      bucketId: serializer.fromJson<int?>(json['bucketId']),
      toBucketId: serializer.fromJson<int?>(json['toBucketId']),
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
      'dropCategoryId': serializer.toJson<int?>(dropCategoryId),
      'bucketId': serializer.toJson<int?>(bucketId),
      'toBucketId': serializer.toJson<int?>(toBucketId),
      'date': serializer.toJson<DateTime>(date),
      'notes': serializer.toJson<String?>(notes),
      'parentDropId': serializer.toJson<int?>(parentDropId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DropTable copyWith({
    int? id,
    String? title,
    int? amount,
    Value<int?> dropCategoryId = const Value.absent(),
    Value<int?> bucketId = const Value.absent(),
    Value<int?> toBucketId = const Value.absent(),
    DateTime? date,
    Value<String?> notes = const Value.absent(),
    Value<int?> parentDropId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DropTable(
    id: id ?? this.id,
    title: title ?? this.title,
    amount: amount ?? this.amount,
    dropCategoryId: dropCategoryId.present
        ? dropCategoryId.value
        : this.dropCategoryId,
    bucketId: bucketId.present ? bucketId.value : this.bucketId,
    toBucketId: toBucketId.present ? toBucketId.value : this.toBucketId,
    date: date ?? this.date,
    notes: notes.present ? notes.value : this.notes,
    parentDropId: parentDropId.present ? parentDropId.value : this.parentDropId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DropTable copyWithCompanion(DropsCompanion data) {
    return DropTable(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      amount: data.amount.present ? data.amount.value : this.amount,
      dropCategoryId: data.dropCategoryId.present
          ? data.dropCategoryId.value
          : this.dropCategoryId,
      bucketId: data.bucketId.present ? data.bucketId.value : this.bucketId,
      toBucketId: data.toBucketId.present
          ? data.toBucketId.value
          : this.toBucketId,
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
    return (StringBuffer('DropTable(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('dropCategoryId: $dropCategoryId, ')
          ..write('bucketId: $bucketId, ')
          ..write('toBucketId: $toBucketId, ')
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
    dropCategoryId,
    bucketId,
    toBucketId,
    date,
    notes,
    parentDropId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DropTable &&
          other.id == this.id &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.dropCategoryId == this.dropCategoryId &&
          other.bucketId == this.bucketId &&
          other.toBucketId == this.toBucketId &&
          other.date == this.date &&
          other.notes == this.notes &&
          other.parentDropId == this.parentDropId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DropsCompanion extends UpdateCompanion<DropTable> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> amount;
  final Value<int?> dropCategoryId;
  final Value<int?> bucketId;
  final Value<int?> toBucketId;
  final Value<DateTime> date;
  final Value<String?> notes;
  final Value<int?> parentDropId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DropsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.dropCategoryId = const Value.absent(),
    this.bucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
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
    this.dropCategoryId = const Value.absent(),
    this.bucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    required DateTime date,
    this.notes = const Value.absent(),
    this.parentDropId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : title = Value(title),
       amount = Value(amount),
       date = Value(date);
  static Insertable<DropTable> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? amount,
    Expression<int>? dropCategoryId,
    Expression<int>? bucketId,
    Expression<int>? toBucketId,
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
      if (dropCategoryId != null) 'drop_category_id': dropCategoryId,
      if (bucketId != null) 'bucket_id': bucketId,
      if (toBucketId != null) 'to_bucket_id': toBucketId,
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
    Value<int?>? dropCategoryId,
    Value<int?>? bucketId,
    Value<int?>? toBucketId,
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
      dropCategoryId: dropCategoryId ?? this.dropCategoryId,
      bucketId: bucketId ?? this.bucketId,
      toBucketId: toBucketId ?? this.toBucketId,
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
    if (dropCategoryId.present) {
      map['drop_category_id'] = Variable<int>(dropCategoryId.value);
    }
    if (bucketId.present) {
      map['bucket_id'] = Variable<int>(bucketId.value);
    }
    if (toBucketId.present) {
      map['to_bucket_id'] = Variable<int>(toBucketId.value);
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
          ..write('dropCategoryId: $dropCategoryId, ')
          ..write('bucketId: $bucketId, ')
          ..write('toBucketId: $toBucketId, ')
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
  late final $BucketCategoriesTable bucketCategories = $BucketCategoriesTable(
    this,
  );
  late final $IconsTable icons = $IconsTable(this);
  late final $BucketsTable buckets = $BucketsTable(this);
  late final $BucketSnapshotsTable bucketSnapshots = $BucketSnapshotsTable(
    this,
  );
  late final $DropCategoriesTable dropCategories = $DropCategoriesTable(this);
  late final $DropsTable drops = $DropsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    bucketCategories,
    icons,
    buckets,
    bucketSnapshots,
    dropCategories,
    drops,
  ];
}

typedef $$BucketCategoriesTableCreateCompanionBuilder =
    BucketCategoriesCompanion Function({
      Value<int> id,
      required String name,
      required BalanceType balanceType,
      Value<int> sort,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$BucketCategoriesTableUpdateCompanionBuilder =
    BucketCategoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<BalanceType> balanceType,
      Value<int> sort,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$BucketCategoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BucketCategoriesTable,
          BucketCategoryTable
        > {
  $$BucketCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$BucketsTable, List<BucketTable>>
  _bucketsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.buckets,
    aliasName: 'bucket_categories__id__buckets__bucket_category_id',
  );

  $$BucketsTableProcessedTableManager get bucketsRefs {
    final manager = $$BucketsTableTableManager(
      $_db,
      $_db.buckets,
    ).filter((f) => f.bucketCategoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_bucketsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BucketCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $BucketCategoriesTable> {
  $$BucketCategoriesTableFilterComposer({
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

  ColumnWithTypeConverterFilters<BalanceType, BalanceType, String>
  get balanceType => $composableBuilder(
    column: $table.balanceType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get sort => $composableBuilder(
    column: $table.sort,
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

  Expression<bool> bucketsRefs(
    Expression<bool> Function($$BucketsTableFilterComposer f) f,
  ) {
    final $$BucketsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.bucketCategoryId,
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
}

class $$BucketCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $BucketCategoriesTable> {
  $$BucketCategoriesTableOrderingComposer({
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

  ColumnOrderings<String> get balanceType => $composableBuilder(
    column: $table.balanceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sort => $composableBuilder(
    column: $table.sort,
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
}

class $$BucketCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BucketCategoriesTable> {
  $$BucketCategoriesTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<BalanceType, String> get balanceType =>
      $composableBuilder(
        column: $table.balanceType,
        builder: (column) => column,
      );

  GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> bucketsRefs<T extends Object>(
    Expression<T> Function($$BucketsTableAnnotationComposer a) f,
  ) {
    final $$BucketsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buckets,
      getReferencedColumn: (t) => t.bucketCategoryId,
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
}

class $$BucketCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BucketCategoriesTable,
          BucketCategoryTable,
          $$BucketCategoriesTableFilterComposer,
          $$BucketCategoriesTableOrderingComposer,
          $$BucketCategoriesTableAnnotationComposer,
          $$BucketCategoriesTableCreateCompanionBuilder,
          $$BucketCategoriesTableUpdateCompanionBuilder,
          (BucketCategoryTable, $$BucketCategoriesTableReferences),
          BucketCategoryTable,
          PrefetchHooks Function({bool bucketsRefs})
        > {
  $$BucketCategoriesTableTableManager(
    _$AppDatabase db,
    $BucketCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BucketCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BucketCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BucketCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<BalanceType> balanceType = const Value.absent(),
                Value<int> sort = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketCategoriesCompanion(
                id: id,
                name: name,
                balanceType: balanceType,
                sort: sort,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required BalanceType balanceType,
                Value<int> sort = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketCategoriesCompanion.insert(
                id: id,
                name: name,
                balanceType: balanceType,
                sort: sort,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BucketCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bucketsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (bucketsRefs) db.buckets],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bucketsRefs)
                    await $_getPrefetchedData<
                      BucketCategoryTable,
                      $BucketCategoriesTable,
                      BucketTable
                    >(
                      currentTable: table,
                      referencedTable: $$BucketCategoriesTableReferences
                          ._bucketsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BucketCategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).bucketsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.bucketCategoryId == item.id,
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

typedef $$BucketCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BucketCategoriesTable,
      BucketCategoryTable,
      $$BucketCategoriesTableFilterComposer,
      $$BucketCategoriesTableOrderingComposer,
      $$BucketCategoriesTableAnnotationComposer,
      $$BucketCategoriesTableCreateCompanionBuilder,
      $$BucketCategoriesTableUpdateCompanionBuilder,
      (BucketCategoryTable, $$BucketCategoriesTableReferences),
      BucketCategoryTable,
      PrefetchHooks Function({bool bucketsRefs})
    >;
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
    extends BaseReferences<_$AppDatabase, $IconsTable, IconTable> {
  $$IconsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BucketsTable, List<BucketTable>>
  _bucketsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
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

  static MultiTypedResultKey<$DropCategoriesTable, List<DropCategoryTable>>
  _dropCategoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dropCategories,
    aliasName: 'icons__id__drop_categories__icon_id',
  );

  $$DropCategoriesTableProcessedTableManager get dropCategoriesRefs {
    final manager = $$DropCategoriesTableTableManager(
      $_db,
      $_db.dropCategories,
    ).filter((f) => f.iconId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dropCategoriesRefsTable($_db));
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

  Expression<bool> dropCategoriesRefs(
    Expression<bool> Function($$DropCategoriesTableFilterComposer f) f,
  ) {
    final $$DropCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dropCategories,
      getReferencedColumn: (t) => t.iconId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.dropCategories,
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

  Expression<T> dropCategoriesRefs<T extends Object>(
    Expression<T> Function($$DropCategoriesTableAnnotationComposer a) f,
  ) {
    final $$DropCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dropCategories,
      getReferencedColumn: (t) => t.iconId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dropCategories,
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
          IconTable,
          $$IconsTableFilterComposer,
          $$IconsTableOrderingComposer,
          $$IconsTableAnnotationComposer,
          $$IconsTableCreateCompanionBuilder,
          $$IconsTableUpdateCompanionBuilder,
          (IconTable, $$IconsTableReferences),
          IconTable,
          PrefetchHooks Function({bool bucketsRefs, bool dropCategoriesRefs})
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
              ({bucketsRefs = false, dropCategoriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (bucketsRefs) db.buckets,
                    if (dropCategoriesRefs) db.dropCategories,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (bucketsRefs)
                        await $_getPrefetchedData<
                          IconTable,
                          $IconsTable,
                          BucketTable
                        >(
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
                      if (dropCategoriesRefs)
                        await $_getPrefetchedData<
                          IconTable,
                          $IconsTable,
                          DropCategoryTable
                        >(
                          currentTable: table,
                          referencedTable: $$IconsTableReferences
                              ._dropCategoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IconsTableReferences(
                                db,
                                table,
                                p0,
                              ).dropCategoriesRefs,
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
      IconTable,
      $$IconsTableFilterComposer,
      $$IconsTableOrderingComposer,
      $$IconsTableAnnotationComposer,
      $$IconsTableCreateCompanionBuilder,
      $$IconsTableUpdateCompanionBuilder,
      (IconTable, $$IconsTableReferences),
      IconTable,
      PrefetchHooks Function({bool bucketsRefs, bool dropCategoriesRefs})
    >;
typedef $$BucketsTableCreateCompanionBuilder =
    BucketsCompanion Function({
      Value<int> id,
      required String name,
      required int bucketCategoryId,
      Value<int?> iconId,
      Value<String?> notes,
      Value<int> sort,
      Value<bool?> isDefaultExpense,
      Value<bool?> isDefaultIncome,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$BucketsTableUpdateCompanionBuilder =
    BucketsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> bucketCategoryId,
      Value<int?> iconId,
      Value<String?> notes,
      Value<int> sort,
      Value<bool?> isDefaultExpense,
      Value<bool?> isDefaultIncome,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$BucketsTableReferences
    extends BaseReferences<_$AppDatabase, $BucketsTable, BucketTable> {
  $$BucketsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BucketCategoriesTable _bucketCategoryIdTable(_$AppDatabase db) => db
      .bucketCategories
      .createAlias('buckets__bucket_category_id__bucket_categories__id');

  $$BucketCategoriesTableProcessedTableManager get bucketCategoryId {
    final $_column = $_itemColumn<int>('bucket_category_id')!;

    final manager = $$BucketCategoriesTableTableManager(
      $_db,
      $_db.bucketCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bucketCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IconsTable _iconIdTable(_$AppDatabase db) =>
      db.icons.createAlias('buckets__icon_id__icons__id');

  $$IconsTableProcessedTableManager? get iconId {
    final $_column = $_itemColumn<int>('icon_id');
    if ($_column == null) return null;
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

  static MultiTypedResultKey<$BucketSnapshotsTable, List<BucketSnapshotTable>>
  _bucketSnapshotsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bucketSnapshots,
    aliasName: 'buckets__id__bucket_snapshots__bucket_id',
  );

  $$BucketSnapshotsTableProcessedTableManager get bucketSnapshotsRefs {
    final manager = $$BucketSnapshotsTableTableManager(
      $_db,
      $_db.bucketSnapshots,
    ).filter((f) => f.bucketId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _bucketSnapshotsRefsTable($_db),
    );
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

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sort => $composableBuilder(
    column: $table.sort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefaultExpense => $composableBuilder(
    column: $table.isDefaultExpense,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefaultIncome => $composableBuilder(
    column: $table.isDefaultIncome,
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

  $$BucketCategoriesTableFilterComposer get bucketCategoryId {
    final $$BucketCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketCategoryId,
      referencedTable: $db.bucketCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.bucketCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

  Expression<bool> bucketSnapshotsRefs(
    Expression<bool> Function($$BucketSnapshotsTableFilterComposer f) f,
  ) {
    final $$BucketSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bucketSnapshots,
      getReferencedColumn: (t) => t.bucketId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.bucketSnapshots,
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

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sort => $composableBuilder(
    column: $table.sort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefaultExpense => $composableBuilder(
    column: $table.isDefaultExpense,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefaultIncome => $composableBuilder(
    column: $table.isDefaultIncome,
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

  $$BucketCategoriesTableOrderingComposer get bucketCategoryId {
    final $$BucketCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketCategoryId,
      referencedTable: $db.bucketCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.bucketCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

  GeneratedColumn<bool> get isDefaultExpense => $composableBuilder(
    column: $table.isDefaultExpense,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDefaultIncome => $composableBuilder(
    column: $table.isDefaultIncome,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$BucketCategoriesTableAnnotationComposer get bucketCategoryId {
    final $$BucketCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bucketCategoryId,
      referencedTable: $db.bucketCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.bucketCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

  Expression<T> bucketSnapshotsRefs<T extends Object>(
    Expression<T> Function($$BucketSnapshotsTableAnnotationComposer a) f,
  ) {
    final $$BucketSnapshotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bucketSnapshots,
      getReferencedColumn: (t) => t.bucketId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BucketSnapshotsTableAnnotationComposer(
            $db: $db,
            $table: $db.bucketSnapshots,
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
          BucketTable,
          $$BucketsTableFilterComposer,
          $$BucketsTableOrderingComposer,
          $$BucketsTableAnnotationComposer,
          $$BucketsTableCreateCompanionBuilder,
          $$BucketsTableUpdateCompanionBuilder,
          (BucketTable, $$BucketsTableReferences),
          BucketTable,
          PrefetchHooks Function({
            bool bucketCategoryId,
            bool iconId,
            bool bucketSnapshotsRefs,
          })
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
                Value<int> bucketCategoryId = const Value.absent(),
                Value<int?> iconId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> sort = const Value.absent(),
                Value<bool?> isDefaultExpense = const Value.absent(),
                Value<bool?> isDefaultIncome = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketsCompanion(
                id: id,
                name: name,
                bucketCategoryId: bucketCategoryId,
                iconId: iconId,
                notes: notes,
                sort: sort,
                isDefaultExpense: isDefaultExpense,
                isDefaultIncome: isDefaultIncome,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int bucketCategoryId,
                Value<int?> iconId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> sort = const Value.absent(),
                Value<bool?> isDefaultExpense = const Value.absent(),
                Value<bool?> isDefaultIncome = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketsCompanion.insert(
                id: id,
                name: name,
                bucketCategoryId: bucketCategoryId,
                iconId: iconId,
                notes: notes,
                sort: sort,
                isDefaultExpense: isDefaultExpense,
                isDefaultIncome: isDefaultIncome,
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
              ({
                bucketCategoryId = false,
                iconId = false,
                bucketSnapshotsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (bucketSnapshotsRefs) db.bucketSnapshots,
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
                        if (bucketCategoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.bucketCategoryId,
                                    referencedTable: $$BucketsTableReferences
                                        ._bucketCategoryIdTable(db),
                                    referencedColumn: $$BucketsTableReferences
                                        ._bucketCategoryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
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
                      if (bucketSnapshotsRefs)
                        await $_getPrefetchedData<
                          BucketTable,
                          $BucketsTable,
                          BucketSnapshotTable
                        >(
                          currentTable: table,
                          referencedTable: $$BucketsTableReferences
                              ._bucketSnapshotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BucketsTableReferences(
                                db,
                                table,
                                p0,
                              ).bucketSnapshotsRefs,
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
      BucketTable,
      $$BucketsTableFilterComposer,
      $$BucketsTableOrderingComposer,
      $$BucketsTableAnnotationComposer,
      $$BucketsTableCreateCompanionBuilder,
      $$BucketsTableUpdateCompanionBuilder,
      (BucketTable, $$BucketsTableReferences),
      BucketTable,
      PrefetchHooks Function({
        bool bucketCategoryId,
        bool iconId,
        bool bucketSnapshotsRefs,
      })
    >;
typedef $$BucketSnapshotsTableCreateCompanionBuilder =
    BucketSnapshotsCompanion Function({
      Value<int> id,
      required int bucketId,
      required int balance,
      required DateTime date,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$BucketSnapshotsTableUpdateCompanionBuilder =
    BucketSnapshotsCompanion Function({
      Value<int> id,
      Value<int> bucketId,
      Value<int> balance,
      Value<DateTime> date,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$BucketSnapshotsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BucketSnapshotsTable,
          BucketSnapshotTable
        > {
  $$BucketSnapshotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BucketsTable _bucketIdTable(_$AppDatabase db) =>
      db.buckets.createAlias('bucket_snapshots__bucket_id__buckets__id');

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

class $$BucketSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $BucketSnapshotsTable> {
  $$BucketSnapshotsTableFilterComposer({
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

class $$BucketSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $BucketSnapshotsTable> {
  $$BucketSnapshotsTableOrderingComposer({
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

class $$BucketSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BucketSnapshotsTable> {
  $$BucketSnapshotsTableAnnotationComposer({
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

class $$BucketSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BucketSnapshotsTable,
          BucketSnapshotTable,
          $$BucketSnapshotsTableFilterComposer,
          $$BucketSnapshotsTableOrderingComposer,
          $$BucketSnapshotsTableAnnotationComposer,
          $$BucketSnapshotsTableCreateCompanionBuilder,
          $$BucketSnapshotsTableUpdateCompanionBuilder,
          (BucketSnapshotTable, $$BucketSnapshotsTableReferences),
          BucketSnapshotTable,
          PrefetchHooks Function({bool bucketId})
        > {
  $$BucketSnapshotsTableTableManager(
    _$AppDatabase db,
    $BucketSnapshotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BucketSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BucketSnapshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BucketSnapshotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> bucketId = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BucketSnapshotsCompanion(
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
              }) => BucketSnapshotsCompanion.insert(
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
                  $$BucketSnapshotsTableReferences(db, table, e),
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
                                referencedTable:
                                    $$BucketSnapshotsTableReferences
                                        ._bucketIdTable(db),
                                referencedColumn:
                                    $$BucketSnapshotsTableReferences
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

typedef $$BucketSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BucketSnapshotsTable,
      BucketSnapshotTable,
      $$BucketSnapshotsTableFilterComposer,
      $$BucketSnapshotsTableOrderingComposer,
      $$BucketSnapshotsTableAnnotationComposer,
      $$BucketSnapshotsTableCreateCompanionBuilder,
      $$BucketSnapshotsTableUpdateCompanionBuilder,
      (BucketSnapshotTable, $$BucketSnapshotsTableReferences),
      BucketSnapshotTable,
      PrefetchHooks Function({bool bucketId})
    >;
typedef $$DropCategoriesTableCreateCompanionBuilder =
    DropCategoriesCompanion Function({
      Value<int> id,
      required int iconId,
      required String name,
      required DropType dropType,
      Value<String?> note,
      Value<int> sort,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$DropCategoriesTableUpdateCompanionBuilder =
    DropCategoriesCompanion Function({
      Value<int> id,
      Value<int> iconId,
      Value<String> name,
      Value<DropType> dropType,
      Value<String?> note,
      Value<int> sort,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$DropCategoriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $DropCategoriesTable, DropCategoryTable> {
  $$DropCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IconsTable _iconIdTable(_$AppDatabase db) =>
      db.icons.createAlias('drop_categories__icon_id__icons__id');

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

  static MultiTypedResultKey<$DropsTable, List<DropTable>> _dropsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.drops,
    aliasName: 'drop_categories__id__drops__drop_category_id',
  );

  $$DropsTableProcessedTableManager get dropsRefs {
    final manager = $$DropsTableTableManager(
      $_db,
      $_db.drops,
    ).filter((f) => f.dropCategoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dropsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DropCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $DropCategoriesTable> {
  $$DropCategoriesTableFilterComposer({
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

  ColumnWithTypeConverterFilters<DropType, DropType, String> get dropType =>
      $composableBuilder(
        column: $table.dropType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sort => $composableBuilder(
    column: $table.sort,
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

  Expression<bool> dropsRefs(
    Expression<bool> Function($$DropsTableFilterComposer f) f,
  ) {
    final $$DropsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.drops,
      getReferencedColumn: (t) => t.dropCategoryId,
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

class $$DropCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DropCategoriesTable> {
  $$DropCategoriesTableOrderingComposer({
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

  ColumnOrderings<String> get dropType => $composableBuilder(
    column: $table.dropType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sort => $composableBuilder(
    column: $table.sort,
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

class $$DropCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DropCategoriesTable> {
  $$DropCategoriesTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<DropType, String> get dropType =>
      $composableBuilder(column: $table.dropType, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

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

  Expression<T> dropsRefs<T extends Object>(
    Expression<T> Function($$DropsTableAnnotationComposer a) f,
  ) {
    final $$DropsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.drops,
      getReferencedColumn: (t) => t.dropCategoryId,
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

class $$DropCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DropCategoriesTable,
          DropCategoryTable,
          $$DropCategoriesTableFilterComposer,
          $$DropCategoriesTableOrderingComposer,
          $$DropCategoriesTableAnnotationComposer,
          $$DropCategoriesTableCreateCompanionBuilder,
          $$DropCategoriesTableUpdateCompanionBuilder,
          (DropCategoryTable, $$DropCategoriesTableReferences),
          DropCategoryTable,
          PrefetchHooks Function({bool iconId, bool dropsRefs})
        > {
  $$DropCategoriesTableTableManager(
    _$AppDatabase db,
    $DropCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DropCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DropCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DropCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> iconId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DropType> dropType = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> sort = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DropCategoriesCompanion(
                id: id,
                iconId: iconId,
                name: name,
                dropType: dropType,
                note: note,
                sort: sort,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int iconId,
                required String name,
                required DropType dropType,
                Value<String?> note = const Value.absent(),
                Value<int> sort = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DropCategoriesCompanion.insert(
                id: id,
                iconId: iconId,
                name: name,
                dropType: dropType,
                note: note,
                sort: sort,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DropCategoriesTableReferences(db, table, e),
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
                                referencedTable: $$DropCategoriesTableReferences
                                    ._iconIdTable(db),
                                referencedColumn:
                                    $$DropCategoriesTableReferences
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
                    await $_getPrefetchedData<
                      DropCategoryTable,
                      $DropCategoriesTable,
                      DropTable
                    >(
                      currentTable: table,
                      referencedTable: $$DropCategoriesTableReferences
                          ._dropsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DropCategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).dropsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.dropCategoryId == item.id,
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

typedef $$DropCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DropCategoriesTable,
      DropCategoryTable,
      $$DropCategoriesTableFilterComposer,
      $$DropCategoriesTableOrderingComposer,
      $$DropCategoriesTableAnnotationComposer,
      $$DropCategoriesTableCreateCompanionBuilder,
      $$DropCategoriesTableUpdateCompanionBuilder,
      (DropCategoryTable, $$DropCategoriesTableReferences),
      DropCategoryTable,
      PrefetchHooks Function({bool iconId, bool dropsRefs})
    >;
typedef $$DropsTableCreateCompanionBuilder =
    DropsCompanion Function({
      Value<int> id,
      required String title,
      required int amount,
      Value<int?> dropCategoryId,
      Value<int?> bucketId,
      Value<int?> toBucketId,
      required DateTime date,
      Value<String?> notes,
      Value<int?> parentDropId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$DropsTableUpdateCompanionBuilder =
    DropsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<int> amount,
      Value<int?> dropCategoryId,
      Value<int?> bucketId,
      Value<int?> toBucketId,
      Value<DateTime> date,
      Value<String?> notes,
      Value<int?> parentDropId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$DropsTableReferences
    extends BaseReferences<_$AppDatabase, $DropsTable, DropTable> {
  $$DropsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DropCategoriesTable _dropCategoryIdTable(_$AppDatabase db) => db
      .dropCategories
      .createAlias('drops__drop_category_id__drop_categories__id');

  $$DropCategoriesTableProcessedTableManager? get dropCategoryId {
    final $_column = $_itemColumn<int>('drop_category_id');
    if ($_column == null) return null;
    final manager = $$DropCategoriesTableTableManager(
      $_db,
      $_db.dropCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dropCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BucketsTable _bucketIdTable(_$AppDatabase db) =>
      db.buckets.createAlias('drops__bucket_id__buckets__id');

  $$BucketsTableProcessedTableManager? get bucketId {
    final $_column = $_itemColumn<int>('bucket_id');
    if ($_column == null) return null;
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

  $$DropCategoriesTableFilterComposer get dropCategoryId {
    final $$DropCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dropCategoryId,
      referencedTable: $db.dropCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.dropCategories,
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

  $$DropCategoriesTableOrderingComposer get dropCategoryId {
    final $$DropCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dropCategoryId,
      referencedTable: $db.dropCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.dropCategories,
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

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DropCategoriesTableAnnotationComposer get dropCategoryId {
    final $$DropCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dropCategoryId,
      referencedTable: $db.dropCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DropCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dropCategories,
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
          DropTable,
          $$DropsTableFilterComposer,
          $$DropsTableOrderingComposer,
          $$DropsTableAnnotationComposer,
          $$DropsTableCreateCompanionBuilder,
          $$DropsTableUpdateCompanionBuilder,
          (DropTable, $$DropsTableReferences),
          DropTable,
          PrefetchHooks Function({
            bool dropCategoryId,
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
                Value<int?> dropCategoryId = const Value.absent(),
                Value<int?> bucketId = const Value.absent(),
                Value<int?> toBucketId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> parentDropId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DropsCompanion(
                id: id,
                title: title,
                amount: amount,
                dropCategoryId: dropCategoryId,
                bucketId: bucketId,
                toBucketId: toBucketId,
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
                Value<int?> dropCategoryId = const Value.absent(),
                Value<int?> bucketId = const Value.absent(),
                Value<int?> toBucketId = const Value.absent(),
                required DateTime date,
                Value<String?> notes = const Value.absent(),
                Value<int?> parentDropId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DropsCompanion.insert(
                id: id,
                title: title,
                amount: amount,
                dropCategoryId: dropCategoryId,
                bucketId: bucketId,
                toBucketId: toBucketId,
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
                dropCategoryId = false,
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
                        if (dropCategoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dropCategoryId,
                                    referencedTable: $$DropsTableReferences
                                        ._dropCategoryIdTable(db),
                                    referencedColumn: $$DropsTableReferences
                                        ._dropCategoryIdTable(db)
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
      DropTable,
      $$DropsTableFilterComposer,
      $$DropsTableOrderingComposer,
      $$DropsTableAnnotationComposer,
      $$DropsTableCreateCompanionBuilder,
      $$DropsTableUpdateCompanionBuilder,
      (DropTable, $$DropsTableReferences),
      DropTable,
      PrefetchHooks Function({
        bool dropCategoryId,
        bool bucketId,
        bool toBucketId,
        bool parentDropId,
      })
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BucketCategoriesTableTableManager get bucketCategories =>
      $$BucketCategoriesTableTableManager(_db, _db.bucketCategories);
  $$IconsTableTableManager get icons =>
      $$IconsTableTableManager(_db, _db.icons);
  $$BucketsTableTableManager get buckets =>
      $$BucketsTableTableManager(_db, _db.buckets);
  $$BucketSnapshotsTableTableManager get bucketSnapshots =>
      $$BucketSnapshotsTableTableManager(_db, _db.bucketSnapshots);
  $$DropCategoriesTableTableManager get dropCategories =>
      $$DropCategoriesTableTableManager(_db, _db.dropCategories);
  $$DropsTableTableManager get drops =>
      $$DropsTableTableManager(_db, _db.drops);
}
