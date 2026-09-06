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
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
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
    name,
    icon,
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
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
        _sortMeta,
        sort.isAcceptableOrUnknown(data['sort']!, _sortMeta),
      );
    } else if (isInserting) {
      context.missing(_sortMeta);
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
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
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
  final String icon;
  final BalanceType balanceType;
  final int sort;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BucketCategoryTable({
    required this.id,
    required this.name,
    required this.icon,
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
    map['icon'] = Variable<String>(icon);
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
      icon: Value(icon),
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
      icon: serializer.fromJson<String>(json['icon']),
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
      'icon': serializer.toJson<String>(icon),
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
    String? icon,
    BalanceType? balanceType,
    int? sort,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BucketCategoryTable(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon,
    balanceType: balanceType ?? this.balanceType,
    sort: sort ?? this.sort,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BucketCategoryTable copyWithCompanion(BucketCategoriesCompanion data) {
    return BucketCategoryTable(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
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
          ..write('icon: $icon, ')
          ..write('balanceType: $balanceType, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, icon, balanceType, sort, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BucketCategoryTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.balanceType == this.balanceType &&
          other.sort == this.sort &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketCategoriesCompanion extends UpdateCompanion<BucketCategoryTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> icon;
  final Value<BalanceType> balanceType;
  final Value<int> sort;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.balanceType = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String icon,
    required BalanceType balanceType,
    required int sort,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       icon = Value(icon),
       balanceType = Value(balanceType),
       sort = Value(sort);
  static Insertable<BucketCategoryTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<String>? balanceType,
    Expression<int>? sort,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (balanceType != null) 'balance_type': balanceType,
      if (sort != null) 'sort': sort,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BucketCategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? icon,
    Value<BalanceType>? balanceType,
    Value<int>? sort,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
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
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
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
          ..write('icon: $icon, ')
          ..write('balanceType: $balanceType, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
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
  static const VerificationMeta _isIncomeDefaultMeta = const VerificationMeta(
    'isIncomeDefault',
  );
  @override
  late final GeneratedColumn<bool> isIncomeDefault = GeneratedColumn<bool>(
    'is_income_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_income_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isExpenseDefaultMeta = const VerificationMeta(
    'isExpenseDefault',
  );
  @override
  late final GeneratedColumn<bool> isExpenseDefault = GeneratedColumn<bool>(
    'is_expense_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_expense_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
      'REFERENCES bucket_categories (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
    'sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    name,
    isIncomeDefault,
    isExpenseDefault,
    bucketCategoryId,
    sort,
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
    if (data.containsKey('is_income_default')) {
      context.handle(
        _isIncomeDefaultMeta,
        isIncomeDefault.isAcceptableOrUnknown(
          data['is_income_default']!,
          _isIncomeDefaultMeta,
        ),
      );
    }
    if (data.containsKey('is_expense_default')) {
      context.handle(
        _isExpenseDefaultMeta,
        isExpenseDefault.isAcceptableOrUnknown(
          data['is_expense_default']!,
          _isExpenseDefaultMeta,
        ),
      );
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
    if (data.containsKey('sort')) {
      context.handle(
        _sortMeta,
        sort.isAcceptableOrUnknown(data['sort']!, _sortMeta),
      );
    } else if (isInserting) {
      context.missing(_sortMeta);
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
      isIncomeDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_income_default'],
      )!,
      isExpenseDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_expense_default'],
      )!,
      bucketCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bucket_category_id'],
      )!,
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
  $BucketsTable createAlias(String alias) {
    return $BucketsTable(attachedDatabase, alias);
  }
}

class BucketTable extends DataClass implements Insertable<BucketTable> {
  final int id;
  final String name;
  final bool isIncomeDefault;
  final bool isExpenseDefault;
  final int bucketCategoryId;
  final int sort;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BucketTable({
    required this.id,
    required this.name,
    required this.isIncomeDefault,
    required this.isExpenseDefault,
    required this.bucketCategoryId,
    required this.sort,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_income_default'] = Variable<bool>(isIncomeDefault);
    map['is_expense_default'] = Variable<bool>(isExpenseDefault);
    map['bucket_category_id'] = Variable<int>(bucketCategoryId);
    map['sort'] = Variable<int>(sort);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BucketsCompanion toCompanion(bool nullToAbsent) {
    return BucketsCompanion(
      id: Value(id),
      name: Value(name),
      isIncomeDefault: Value(isIncomeDefault),
      isExpenseDefault: Value(isExpenseDefault),
      bucketCategoryId: Value(bucketCategoryId),
      sort: Value(sort),
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
      isIncomeDefault: serializer.fromJson<bool>(json['isIncomeDefault']),
      isExpenseDefault: serializer.fromJson<bool>(json['isExpenseDefault']),
      bucketCategoryId: serializer.fromJson<int>(json['bucketCategoryId']),
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
      'isIncomeDefault': serializer.toJson<bool>(isIncomeDefault),
      'isExpenseDefault': serializer.toJson<bool>(isExpenseDefault),
      'bucketCategoryId': serializer.toJson<int>(bucketCategoryId),
      'sort': serializer.toJson<int>(sort),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BucketTable copyWith({
    int? id,
    String? name,
    bool? isIncomeDefault,
    bool? isExpenseDefault,
    int? bucketCategoryId,
    int? sort,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BucketTable(
    id: id ?? this.id,
    name: name ?? this.name,
    isIncomeDefault: isIncomeDefault ?? this.isIncomeDefault,
    isExpenseDefault: isExpenseDefault ?? this.isExpenseDefault,
    bucketCategoryId: bucketCategoryId ?? this.bucketCategoryId,
    sort: sort ?? this.sort,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BucketTable copyWithCompanion(BucketsCompanion data) {
    return BucketTable(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isIncomeDefault: data.isIncomeDefault.present
          ? data.isIncomeDefault.value
          : this.isIncomeDefault,
      isExpenseDefault: data.isExpenseDefault.present
          ? data.isExpenseDefault.value
          : this.isExpenseDefault,
      bucketCategoryId: data.bucketCategoryId.present
          ? data.bucketCategoryId.value
          : this.bucketCategoryId,
      sort: data.sort.present ? data.sort.value : this.sort,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BucketTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isIncomeDefault: $isIncomeDefault, ')
          ..write('isExpenseDefault: $isExpenseDefault, ')
          ..write('bucketCategoryId: $bucketCategoryId, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    isIncomeDefault,
    isExpenseDefault,
    bucketCategoryId,
    sort,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BucketTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.isIncomeDefault == this.isIncomeDefault &&
          other.isExpenseDefault == this.isExpenseDefault &&
          other.bucketCategoryId == this.bucketCategoryId &&
          other.sort == this.sort &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketsCompanion extends UpdateCompanion<BucketTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isIncomeDefault;
  final Value<bool> isExpenseDefault;
  final Value<int> bucketCategoryId;
  final Value<int> sort;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isIncomeDefault = const Value.absent(),
    this.isExpenseDefault = const Value.absent(),
    this.bucketCategoryId = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isIncomeDefault = const Value.absent(),
    this.isExpenseDefault = const Value.absent(),
    required int bucketCategoryId,
    required int sort,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       bucketCategoryId = Value(bucketCategoryId),
       sort = Value(sort);
  static Insertable<BucketTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isIncomeDefault,
    Expression<bool>? isExpenseDefault,
    Expression<int>? bucketCategoryId,
    Expression<int>? sort,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isIncomeDefault != null) 'is_income_default': isIncomeDefault,
      if (isExpenseDefault != null) 'is_expense_default': isExpenseDefault,
      if (bucketCategoryId != null) 'bucket_category_id': bucketCategoryId,
      if (sort != null) 'sort': sort,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BucketsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? isIncomeDefault,
    Value<bool>? isExpenseDefault,
    Value<int>? bucketCategoryId,
    Value<int>? sort,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isIncomeDefault: isIncomeDefault ?? this.isIncomeDefault,
      isExpenseDefault: isExpenseDefault ?? this.isExpenseDefault,
      bucketCategoryId: bucketCategoryId ?? this.bucketCategoryId,
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
    if (isIncomeDefault.present) {
      map['is_income_default'] = Variable<bool>(isIncomeDefault.value);
    }
    if (isExpenseDefault.present) {
      map['is_expense_default'] = Variable<bool>(isExpenseDefault.value);
    }
    if (bucketCategoryId.present) {
      map['bucket_category_id'] = Variable<int>(bucketCategoryId.value);
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
    return (StringBuffer('BucketsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isIncomeDefault: $isIncomeDefault, ')
          ..write('isExpenseDefault: $isExpenseDefault, ')
          ..write('bucketCategoryId: $bucketCategoryId, ')
          ..write('sort: $sort, ')
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
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
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<int> budget = GeneratedColumn<int>(
    'budget',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
    'sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    name,
    icon,
    dropType,
    budget,
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('budget')) {
      context.handle(
        _budgetMeta,
        budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta),
      );
    }
    if (data.containsKey('sort')) {
      context.handle(
        _sortMeta,
        sort.isAcceptableOrUnknown(data['sort']!, _sortMeta),
      );
    } else if (isInserting) {
      context.missing(_sortMeta);
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      dropType: $DropCategoriesTable.$converterdropType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}drop_type'],
        )!,
      ),
      budget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}budget'],
      )!,
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
  final String name;
  final String icon;
  final DropType dropType;
  final int budget;
  final int sort;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DropCategoryTable({
    required this.id,
    required this.name,
    required this.icon,
    required this.dropType,
    required this.budget,
    required this.sort,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    {
      map['drop_type'] = Variable<String>(
        $DropCategoriesTable.$converterdropType.toSql(dropType),
      );
    }
    map['budget'] = Variable<int>(budget);
    map['sort'] = Variable<int>(sort);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DropCategoriesCompanion toCompanion(bool nullToAbsent) {
    return DropCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      dropType: Value(dropType),
      budget: Value(budget),
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
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
      dropType: $DropCategoriesTable.$converterdropType.fromJson(
        serializer.fromJson<String>(json['dropType']),
      ),
      budget: serializer.fromJson<int>(json['budget']),
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
      'icon': serializer.toJson<String>(icon),
      'dropType': serializer.toJson<String>(
        $DropCategoriesTable.$converterdropType.toJson(dropType),
      ),
      'budget': serializer.toJson<int>(budget),
      'sort': serializer.toJson<int>(sort),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DropCategoryTable copyWith({
    int? id,
    String? name,
    String? icon,
    DropType? dropType,
    int? budget,
    int? sort,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DropCategoryTable(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon,
    dropType: dropType ?? this.dropType,
    budget: budget ?? this.budget,
    sort: sort ?? this.sort,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DropCategoryTable copyWithCompanion(DropCategoriesCompanion data) {
    return DropCategoryTable(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      dropType: data.dropType.present ? data.dropType.value : this.dropType,
      budget: data.budget.present ? data.budget.value : this.budget,
      sort: data.sort.present ? data.sort.value : this.sort,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DropCategoryTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('dropType: $dropType, ')
          ..write('budget: $budget, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, icon, dropType, budget, sort, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DropCategoryTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.dropType == this.dropType &&
          other.budget == this.budget &&
          other.sort == this.sort &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DropCategoriesCompanion extends UpdateCompanion<DropCategoryTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> icon;
  final Value<DropType> dropType;
  final Value<int> budget;
  final Value<int> sort;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DropCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.dropType = const Value.absent(),
    this.budget = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DropCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String icon,
    required DropType dropType,
    this.budget = const Value.absent(),
    required int sort,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       icon = Value(icon),
       dropType = Value(dropType),
       sort = Value(sort);
  static Insertable<DropCategoryTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<String>? dropType,
    Expression<int>? budget,
    Expression<int>? sort,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (dropType != null) 'drop_type': dropType,
      if (budget != null) 'budget': budget,
      if (sort != null) 'sort': sort,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DropCategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? icon,
    Value<DropType>? dropType,
    Value<int>? budget,
    Value<int>? sort,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DropCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      dropType: dropType ?? this.dropType,
      budget: budget ?? this.budget,
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
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (dropType.present) {
      map['drop_type'] = Variable<String>(
        $DropCategoriesTable.$converterdropType.toSql(dropType.value),
      );
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
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
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('dropType: $dropType, ')
          ..write('budget: $budget, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SubscribedDropsTable extends SubscribedDrops
    with TableInfo<$SubscribedDropsTable, SubscribedDropTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscribedDropsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _fromBucketIdMeta = const VerificationMeta(
    'fromBucketId',
  );
  @override
  late final GeneratedColumn<int> fromBucketId = GeneratedColumn<int>(
    'from_bucket_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buckets (id) ON DELETE RESTRICT',
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
      'REFERENCES buckets (id) ON DELETE RESTRICT',
    ),
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
      'REFERENCES drop_categories (id) ON DELETE SET NULL',
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
  @override
  late final GeneratedColumnWithTypeConverter<Frequency, String> frequency =
      GeneratedColumn<String>(
        'frequency',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Frequency>($SubscribedDropsTable.$converterfrequency);
  static const VerificationMeta _repeatIntervalMeta = const VerificationMeta(
    'repeatInterval',
  );
  @override
  late final GeneratedColumn<int> repeatInterval = GeneratedColumn<int>(
    'repeat_interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _startsOnMeta = const VerificationMeta(
    'startsOn',
  );
  @override
  late final GeneratedColumn<DateTime> startsOn = GeneratedColumn<DateTime>(
    'starts_on',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endsOnMeta = const VerificationMeta('endsOn');
  @override
  late final GeneratedColumn<DateTime> endsOn = GeneratedColumn<DateTime>(
    'ends_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
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
    fromBucketId,
    toBucketId,
    dropCategoryId,
    title,
    amount,
    frequency,
    repeatInterval,
    startsOn,
    endsOn,
    isActive,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscribed_drops';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubscribedDropTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('from_bucket_id')) {
      context.handle(
        _fromBucketIdMeta,
        fromBucketId.isAcceptableOrUnknown(
          data['from_bucket_id']!,
          _fromBucketIdMeta,
        ),
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
    if (data.containsKey('drop_category_id')) {
      context.handle(
        _dropCategoryIdMeta,
        dropCategoryId.isAcceptableOrUnknown(
          data['drop_category_id']!,
          _dropCategoryIdMeta,
        ),
      );
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
    if (data.containsKey('repeat_interval')) {
      context.handle(
        _repeatIntervalMeta,
        repeatInterval.isAcceptableOrUnknown(
          data['repeat_interval']!,
          _repeatIntervalMeta,
        ),
      );
    }
    if (data.containsKey('starts_on')) {
      context.handle(
        _startsOnMeta,
        startsOn.isAcceptableOrUnknown(data['starts_on']!, _startsOnMeta),
      );
    } else if (isInserting) {
      context.missing(_startsOnMeta);
    }
    if (data.containsKey('ends_on')) {
      context.handle(
        _endsOnMeta,
        endsOn.isAcceptableOrUnknown(data['ends_on']!, _endsOnMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
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
  SubscribedDropTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubscribedDropTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fromBucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}from_bucket_id'],
      ),
      toBucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_bucket_id'],
      ),
      dropCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}drop_category_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      frequency: $SubscribedDropsTable.$converterfrequency.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}frequency'],
        )!,
      ),
      repeatInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repeat_interval'],
      )!,
      startsOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}starts_on'],
      )!,
      endsOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ends_on'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
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
  $SubscribedDropsTable createAlias(String alias) {
    return $SubscribedDropsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Frequency, String, String> $converterfrequency =
      const EnumNameConverter<Frequency>(Frequency.values);
}

class SubscribedDropTable extends DataClass
    implements Insertable<SubscribedDropTable> {
  final int id;
  final int? fromBucketId;
  final int? toBucketId;
  final int? dropCategoryId;
  final String title;
  final int amount;
  final Frequency frequency;
  final int repeatInterval;
  final DateTime startsOn;
  final DateTime? endsOn;
  final bool isActive;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SubscribedDropTable({
    required this.id,
    this.fromBucketId,
    this.toBucketId,
    this.dropCategoryId,
    required this.title,
    required this.amount,
    required this.frequency,
    required this.repeatInterval,
    required this.startsOn,
    this.endsOn,
    required this.isActive,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || fromBucketId != null) {
      map['from_bucket_id'] = Variable<int>(fromBucketId);
    }
    if (!nullToAbsent || toBucketId != null) {
      map['to_bucket_id'] = Variable<int>(toBucketId);
    }
    if (!nullToAbsent || dropCategoryId != null) {
      map['drop_category_id'] = Variable<int>(dropCategoryId);
    }
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<int>(amount);
    {
      map['frequency'] = Variable<String>(
        $SubscribedDropsTable.$converterfrequency.toSql(frequency),
      );
    }
    map['repeat_interval'] = Variable<int>(repeatInterval);
    map['starts_on'] = Variable<DateTime>(startsOn);
    if (!nullToAbsent || endsOn != null) {
      map['ends_on'] = Variable<DateTime>(endsOn);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubscribedDropsCompanion toCompanion(bool nullToAbsent) {
    return SubscribedDropsCompanion(
      id: Value(id),
      fromBucketId: fromBucketId == null && nullToAbsent
          ? const Value.absent()
          : Value(fromBucketId),
      toBucketId: toBucketId == null && nullToAbsent
          ? const Value.absent()
          : Value(toBucketId),
      dropCategoryId: dropCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(dropCategoryId),
      title: Value(title),
      amount: Value(amount),
      frequency: Value(frequency),
      repeatInterval: Value(repeatInterval),
      startsOn: Value(startsOn),
      endsOn: endsOn == null && nullToAbsent
          ? const Value.absent()
          : Value(endsOn),
      isActive: Value(isActive),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SubscribedDropTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubscribedDropTable(
      id: serializer.fromJson<int>(json['id']),
      fromBucketId: serializer.fromJson<int?>(json['fromBucketId']),
      toBucketId: serializer.fromJson<int?>(json['toBucketId']),
      dropCategoryId: serializer.fromJson<int?>(json['dropCategoryId']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<int>(json['amount']),
      frequency: $SubscribedDropsTable.$converterfrequency.fromJson(
        serializer.fromJson<String>(json['frequency']),
      ),
      repeatInterval: serializer.fromJson<int>(json['repeatInterval']),
      startsOn: serializer.fromJson<DateTime>(json['startsOn']),
      endsOn: serializer.fromJson<DateTime?>(json['endsOn']),
      isActive: serializer.fromJson<bool>(json['isActive']),
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
      'fromBucketId': serializer.toJson<int?>(fromBucketId),
      'toBucketId': serializer.toJson<int?>(toBucketId),
      'dropCategoryId': serializer.toJson<int?>(dropCategoryId),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<int>(amount),
      'frequency': serializer.toJson<String>(
        $SubscribedDropsTable.$converterfrequency.toJson(frequency),
      ),
      'repeatInterval': serializer.toJson<int>(repeatInterval),
      'startsOn': serializer.toJson<DateTime>(startsOn),
      'endsOn': serializer.toJson<DateTime?>(endsOn),
      'isActive': serializer.toJson<bool>(isActive),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SubscribedDropTable copyWith({
    int? id,
    Value<int?> fromBucketId = const Value.absent(),
    Value<int?> toBucketId = const Value.absent(),
    Value<int?> dropCategoryId = const Value.absent(),
    String? title,
    int? amount,
    Frequency? frequency,
    int? repeatInterval,
    DateTime? startsOn,
    Value<DateTime?> endsOn = const Value.absent(),
    bool? isActive,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SubscribedDropTable(
    id: id ?? this.id,
    fromBucketId: fromBucketId.present ? fromBucketId.value : this.fromBucketId,
    toBucketId: toBucketId.present ? toBucketId.value : this.toBucketId,
    dropCategoryId: dropCategoryId.present
        ? dropCategoryId.value
        : this.dropCategoryId,
    title: title ?? this.title,
    amount: amount ?? this.amount,
    frequency: frequency ?? this.frequency,
    repeatInterval: repeatInterval ?? this.repeatInterval,
    startsOn: startsOn ?? this.startsOn,
    endsOn: endsOn.present ? endsOn.value : this.endsOn,
    isActive: isActive ?? this.isActive,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SubscribedDropTable copyWithCompanion(SubscribedDropsCompanion data) {
    return SubscribedDropTable(
      id: data.id.present ? data.id.value : this.id,
      fromBucketId: data.fromBucketId.present
          ? data.fromBucketId.value
          : this.fromBucketId,
      toBucketId: data.toBucketId.present
          ? data.toBucketId.value
          : this.toBucketId,
      dropCategoryId: data.dropCategoryId.present
          ? data.dropCategoryId.value
          : this.dropCategoryId,
      title: data.title.present ? data.title.value : this.title,
      amount: data.amount.present ? data.amount.value : this.amount,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      repeatInterval: data.repeatInterval.present
          ? data.repeatInterval.value
          : this.repeatInterval,
      startsOn: data.startsOn.present ? data.startsOn.value : this.startsOn,
      endsOn: data.endsOn.present ? data.endsOn.value : this.endsOn,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubscribedDropTable(')
          ..write('id: $id, ')
          ..write('fromBucketId: $fromBucketId, ')
          ..write('toBucketId: $toBucketId, ')
          ..write('dropCategoryId: $dropCategoryId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('frequency: $frequency, ')
          ..write('repeatInterval: $repeatInterval, ')
          ..write('startsOn: $startsOn, ')
          ..write('endsOn: $endsOn, ')
          ..write('isActive: $isActive, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fromBucketId,
    toBucketId,
    dropCategoryId,
    title,
    amount,
    frequency,
    repeatInterval,
    startsOn,
    endsOn,
    isActive,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubscribedDropTable &&
          other.id == this.id &&
          other.fromBucketId == this.fromBucketId &&
          other.toBucketId == this.toBucketId &&
          other.dropCategoryId == this.dropCategoryId &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.frequency == this.frequency &&
          other.repeatInterval == this.repeatInterval &&
          other.startsOn == this.startsOn &&
          other.endsOn == this.endsOn &&
          other.isActive == this.isActive &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubscribedDropsCompanion extends UpdateCompanion<SubscribedDropTable> {
  final Value<int> id;
  final Value<int?> fromBucketId;
  final Value<int?> toBucketId;
  final Value<int?> dropCategoryId;
  final Value<String> title;
  final Value<int> amount;
  final Value<Frequency> frequency;
  final Value<int> repeatInterval;
  final Value<DateTime> startsOn;
  final Value<DateTime?> endsOn;
  final Value<bool> isActive;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SubscribedDropsCompanion({
    this.id = const Value.absent(),
    this.fromBucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    this.dropCategoryId = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.frequency = const Value.absent(),
    this.repeatInterval = const Value.absent(),
    this.startsOn = const Value.absent(),
    this.endsOn = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SubscribedDropsCompanion.insert({
    this.id = const Value.absent(),
    this.fromBucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    this.dropCategoryId = const Value.absent(),
    required String title,
    required int amount,
    required Frequency frequency,
    this.repeatInterval = const Value.absent(),
    required DateTime startsOn,
    this.endsOn = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : title = Value(title),
       amount = Value(amount),
       frequency = Value(frequency),
       startsOn = Value(startsOn);
  static Insertable<SubscribedDropTable> custom({
    Expression<int>? id,
    Expression<int>? fromBucketId,
    Expression<int>? toBucketId,
    Expression<int>? dropCategoryId,
    Expression<String>? title,
    Expression<int>? amount,
    Expression<String>? frequency,
    Expression<int>? repeatInterval,
    Expression<DateTime>? startsOn,
    Expression<DateTime>? endsOn,
    Expression<bool>? isActive,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fromBucketId != null) 'from_bucket_id': fromBucketId,
      if (toBucketId != null) 'to_bucket_id': toBucketId,
      if (dropCategoryId != null) 'drop_category_id': dropCategoryId,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (frequency != null) 'frequency': frequency,
      if (repeatInterval != null) 'repeat_interval': repeatInterval,
      if (startsOn != null) 'starts_on': startsOn,
      if (endsOn != null) 'ends_on': endsOn,
      if (isActive != null) 'is_active': isActive,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SubscribedDropsCompanion copyWith({
    Value<int>? id,
    Value<int?>? fromBucketId,
    Value<int?>? toBucketId,
    Value<int?>? dropCategoryId,
    Value<String>? title,
    Value<int>? amount,
    Value<Frequency>? frequency,
    Value<int>? repeatInterval,
    Value<DateTime>? startsOn,
    Value<DateTime?>? endsOn,
    Value<bool>? isActive,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SubscribedDropsCompanion(
      id: id ?? this.id,
      fromBucketId: fromBucketId ?? this.fromBucketId,
      toBucketId: toBucketId ?? this.toBucketId,
      dropCategoryId: dropCategoryId ?? this.dropCategoryId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      frequency: frequency ?? this.frequency,
      repeatInterval: repeatInterval ?? this.repeatInterval,
      startsOn: startsOn ?? this.startsOn,
      endsOn: endsOn ?? this.endsOn,
      isActive: isActive ?? this.isActive,
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
    if (fromBucketId.present) {
      map['from_bucket_id'] = Variable<int>(fromBucketId.value);
    }
    if (toBucketId.present) {
      map['to_bucket_id'] = Variable<int>(toBucketId.value);
    }
    if (dropCategoryId.present) {
      map['drop_category_id'] = Variable<int>(dropCategoryId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(
        $SubscribedDropsTable.$converterfrequency.toSql(frequency.value),
      );
    }
    if (repeatInterval.present) {
      map['repeat_interval'] = Variable<int>(repeatInterval.value);
    }
    if (startsOn.present) {
      map['starts_on'] = Variable<DateTime>(startsOn.value);
    }
    if (endsOn.present) {
      map['ends_on'] = Variable<DateTime>(endsOn.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
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
    return (StringBuffer('SubscribedDropsCompanion(')
          ..write('id: $id, ')
          ..write('fromBucketId: $fromBucketId, ')
          ..write('toBucketId: $toBucketId, ')
          ..write('dropCategoryId: $dropCategoryId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('frequency: $frequency, ')
          ..write('repeatInterval: $repeatInterval, ')
          ..write('startsOn: $startsOn, ')
          ..write('endsOn: $endsOn, ')
          ..write('isActive: $isActive, ')
          ..write('notes: $notes, ')
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
  static const VerificationMeta _fromBucketIdMeta = const VerificationMeta(
    'fromBucketId',
  );
  @override
  late final GeneratedColumn<int> fromBucketId = GeneratedColumn<int>(
    'from_bucket_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buckets (id) ON DELETE RESTRICT',
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
      'REFERENCES buckets (id) ON DELETE RESTRICT',
    ),
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
      'REFERENCES drop_categories (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _subscribedDropIdMeta = const VerificationMeta(
    'subscribedDropId',
  );
  @override
  late final GeneratedColumn<int> subscribedDropId = GeneratedColumn<int>(
    'subscribed_drop_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscribed_drops (id) ON DELETE SET NULL',
    ),
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
      'REFERENCES drops (id) ON DELETE CASCADE',
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
  static const VerificationMeta _droppedOnMeta = const VerificationMeta(
    'droppedOn',
  );
  @override
  late final GeneratedColumn<DateTime> droppedOn = GeneratedColumn<DateTime>(
    'dropped_on',
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
    fromBucketId,
    toBucketId,
    dropCategoryId,
    subscribedDropId,
    parentDropId,
    title,
    amount,
    droppedOn,
    notes,
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
    if (data.containsKey('from_bucket_id')) {
      context.handle(
        _fromBucketIdMeta,
        fromBucketId.isAcceptableOrUnknown(
          data['from_bucket_id']!,
          _fromBucketIdMeta,
        ),
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
    if (data.containsKey('drop_category_id')) {
      context.handle(
        _dropCategoryIdMeta,
        dropCategoryId.isAcceptableOrUnknown(
          data['drop_category_id']!,
          _dropCategoryIdMeta,
        ),
      );
    }
    if (data.containsKey('subscribed_drop_id')) {
      context.handle(
        _subscribedDropIdMeta,
        subscribedDropId.isAcceptableOrUnknown(
          data['subscribed_drop_id']!,
          _subscribedDropIdMeta,
        ),
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
    if (data.containsKey('dropped_on')) {
      context.handle(
        _droppedOnMeta,
        droppedOn.isAcceptableOrUnknown(data['dropped_on']!, _droppedOnMeta),
      );
    } else if (isInserting) {
      context.missing(_droppedOnMeta);
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
  DropTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DropTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fromBucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}from_bucket_id'],
      ),
      toBucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_bucket_id'],
      ),
      dropCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}drop_category_id'],
      ),
      subscribedDropId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subscribed_drop_id'],
      ),
      parentDropId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_drop_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      droppedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}dropped_on'],
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
  $DropsTable createAlias(String alias) {
    return $DropsTable(attachedDatabase, alias);
  }
}

class DropTable extends DataClass implements Insertable<DropTable> {
  final int id;
  final int? fromBucketId;
  final int? toBucketId;
  final int? dropCategoryId;
  final int? subscribedDropId;
  final int? parentDropId;
  final String title;
  final int amount;
  final DateTime droppedOn;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DropTable({
    required this.id,
    this.fromBucketId,
    this.toBucketId,
    this.dropCategoryId,
    this.subscribedDropId,
    this.parentDropId,
    required this.title,
    required this.amount,
    required this.droppedOn,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || fromBucketId != null) {
      map['from_bucket_id'] = Variable<int>(fromBucketId);
    }
    if (!nullToAbsent || toBucketId != null) {
      map['to_bucket_id'] = Variable<int>(toBucketId);
    }
    if (!nullToAbsent || dropCategoryId != null) {
      map['drop_category_id'] = Variable<int>(dropCategoryId);
    }
    if (!nullToAbsent || subscribedDropId != null) {
      map['subscribed_drop_id'] = Variable<int>(subscribedDropId);
    }
    if (!nullToAbsent || parentDropId != null) {
      map['parent_drop_id'] = Variable<int>(parentDropId);
    }
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<int>(amount);
    map['dropped_on'] = Variable<DateTime>(droppedOn);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DropsCompanion toCompanion(bool nullToAbsent) {
    return DropsCompanion(
      id: Value(id),
      fromBucketId: fromBucketId == null && nullToAbsent
          ? const Value.absent()
          : Value(fromBucketId),
      toBucketId: toBucketId == null && nullToAbsent
          ? const Value.absent()
          : Value(toBucketId),
      dropCategoryId: dropCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(dropCategoryId),
      subscribedDropId: subscribedDropId == null && nullToAbsent
          ? const Value.absent()
          : Value(subscribedDropId),
      parentDropId: parentDropId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentDropId),
      title: Value(title),
      amount: Value(amount),
      droppedOn: Value(droppedOn),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
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
      fromBucketId: serializer.fromJson<int?>(json['fromBucketId']),
      toBucketId: serializer.fromJson<int?>(json['toBucketId']),
      dropCategoryId: serializer.fromJson<int?>(json['dropCategoryId']),
      subscribedDropId: serializer.fromJson<int?>(json['subscribedDropId']),
      parentDropId: serializer.fromJson<int?>(json['parentDropId']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<int>(json['amount']),
      droppedOn: serializer.fromJson<DateTime>(json['droppedOn']),
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
      'fromBucketId': serializer.toJson<int?>(fromBucketId),
      'toBucketId': serializer.toJson<int?>(toBucketId),
      'dropCategoryId': serializer.toJson<int?>(dropCategoryId),
      'subscribedDropId': serializer.toJson<int?>(subscribedDropId),
      'parentDropId': serializer.toJson<int?>(parentDropId),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<int>(amount),
      'droppedOn': serializer.toJson<DateTime>(droppedOn),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DropTable copyWith({
    int? id,
    Value<int?> fromBucketId = const Value.absent(),
    Value<int?> toBucketId = const Value.absent(),
    Value<int?> dropCategoryId = const Value.absent(),
    Value<int?> subscribedDropId = const Value.absent(),
    Value<int?> parentDropId = const Value.absent(),
    String? title,
    int? amount,
    DateTime? droppedOn,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DropTable(
    id: id ?? this.id,
    fromBucketId: fromBucketId.present ? fromBucketId.value : this.fromBucketId,
    toBucketId: toBucketId.present ? toBucketId.value : this.toBucketId,
    dropCategoryId: dropCategoryId.present
        ? dropCategoryId.value
        : this.dropCategoryId,
    subscribedDropId: subscribedDropId.present
        ? subscribedDropId.value
        : this.subscribedDropId,
    parentDropId: parentDropId.present ? parentDropId.value : this.parentDropId,
    title: title ?? this.title,
    amount: amount ?? this.amount,
    droppedOn: droppedOn ?? this.droppedOn,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DropTable copyWithCompanion(DropsCompanion data) {
    return DropTable(
      id: data.id.present ? data.id.value : this.id,
      fromBucketId: data.fromBucketId.present
          ? data.fromBucketId.value
          : this.fromBucketId,
      toBucketId: data.toBucketId.present
          ? data.toBucketId.value
          : this.toBucketId,
      dropCategoryId: data.dropCategoryId.present
          ? data.dropCategoryId.value
          : this.dropCategoryId,
      subscribedDropId: data.subscribedDropId.present
          ? data.subscribedDropId.value
          : this.subscribedDropId,
      parentDropId: data.parentDropId.present
          ? data.parentDropId.value
          : this.parentDropId,
      title: data.title.present ? data.title.value : this.title,
      amount: data.amount.present ? data.amount.value : this.amount,
      droppedOn: data.droppedOn.present ? data.droppedOn.value : this.droppedOn,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DropTable(')
          ..write('id: $id, ')
          ..write('fromBucketId: $fromBucketId, ')
          ..write('toBucketId: $toBucketId, ')
          ..write('dropCategoryId: $dropCategoryId, ')
          ..write('subscribedDropId: $subscribedDropId, ')
          ..write('parentDropId: $parentDropId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('droppedOn: $droppedOn, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fromBucketId,
    toBucketId,
    dropCategoryId,
    subscribedDropId,
    parentDropId,
    title,
    amount,
    droppedOn,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DropTable &&
          other.id == this.id &&
          other.fromBucketId == this.fromBucketId &&
          other.toBucketId == this.toBucketId &&
          other.dropCategoryId == this.dropCategoryId &&
          other.subscribedDropId == this.subscribedDropId &&
          other.parentDropId == this.parentDropId &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.droppedOn == this.droppedOn &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DropsCompanion extends UpdateCompanion<DropTable> {
  final Value<int> id;
  final Value<int?> fromBucketId;
  final Value<int?> toBucketId;
  final Value<int?> dropCategoryId;
  final Value<int?> subscribedDropId;
  final Value<int?> parentDropId;
  final Value<String> title;
  final Value<int> amount;
  final Value<DateTime> droppedOn;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DropsCompanion({
    this.id = const Value.absent(),
    this.fromBucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    this.dropCategoryId = const Value.absent(),
    this.subscribedDropId = const Value.absent(),
    this.parentDropId = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.droppedOn = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DropsCompanion.insert({
    this.id = const Value.absent(),
    this.fromBucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    this.dropCategoryId = const Value.absent(),
    this.subscribedDropId = const Value.absent(),
    this.parentDropId = const Value.absent(),
    required String title,
    required int amount,
    required DateTime droppedOn,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : title = Value(title),
       amount = Value(amount),
       droppedOn = Value(droppedOn);
  static Insertable<DropTable> custom({
    Expression<int>? id,
    Expression<int>? fromBucketId,
    Expression<int>? toBucketId,
    Expression<int>? dropCategoryId,
    Expression<int>? subscribedDropId,
    Expression<int>? parentDropId,
    Expression<String>? title,
    Expression<int>? amount,
    Expression<DateTime>? droppedOn,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fromBucketId != null) 'from_bucket_id': fromBucketId,
      if (toBucketId != null) 'to_bucket_id': toBucketId,
      if (dropCategoryId != null) 'drop_category_id': dropCategoryId,
      if (subscribedDropId != null) 'subscribed_drop_id': subscribedDropId,
      if (parentDropId != null) 'parent_drop_id': parentDropId,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (droppedOn != null) 'dropped_on': droppedOn,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DropsCompanion copyWith({
    Value<int>? id,
    Value<int?>? fromBucketId,
    Value<int?>? toBucketId,
    Value<int?>? dropCategoryId,
    Value<int?>? subscribedDropId,
    Value<int?>? parentDropId,
    Value<String>? title,
    Value<int>? amount,
    Value<DateTime>? droppedOn,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DropsCompanion(
      id: id ?? this.id,
      fromBucketId: fromBucketId ?? this.fromBucketId,
      toBucketId: toBucketId ?? this.toBucketId,
      dropCategoryId: dropCategoryId ?? this.dropCategoryId,
      subscribedDropId: subscribedDropId ?? this.subscribedDropId,
      parentDropId: parentDropId ?? this.parentDropId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      droppedOn: droppedOn ?? this.droppedOn,
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
    if (fromBucketId.present) {
      map['from_bucket_id'] = Variable<int>(fromBucketId.value);
    }
    if (toBucketId.present) {
      map['to_bucket_id'] = Variable<int>(toBucketId.value);
    }
    if (dropCategoryId.present) {
      map['drop_category_id'] = Variable<int>(dropCategoryId.value);
    }
    if (subscribedDropId.present) {
      map['subscribed_drop_id'] = Variable<int>(subscribedDropId.value);
    }
    if (parentDropId.present) {
      map['parent_drop_id'] = Variable<int>(parentDropId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (droppedOn.present) {
      map['dropped_on'] = Variable<DateTime>(droppedOn.value);
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
    return (StringBuffer('DropsCompanion(')
          ..write('id: $id, ')
          ..write('fromBucketId: $fromBucketId, ')
          ..write('toBucketId: $toBucketId, ')
          ..write('dropCategoryId: $dropCategoryId, ')
          ..write('subscribedDropId: $subscribedDropId, ')
          ..write('parentDropId: $parentDropId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('droppedOn: $droppedOn, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BucketSnapsTable extends BucketSnaps
    with TableInfo<$BucketSnapsTable, BucketSnapTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BucketSnapsTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES buckets (id) ON DELETE CASCADE',
    ),
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
  static const VerificationMeta _snappedOnMeta = const VerificationMeta(
    'snappedOn',
  );
  @override
  late final GeneratedColumn<DateTime> snappedOn = GeneratedColumn<DateTime>(
    'snapped_on',
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
    amount,
    snappedOn,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bucket_snaps';
  @override
  VerificationContext validateIntegrity(
    Insertable<BucketSnapTable> instance, {
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
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('snapped_on')) {
      context.handle(
        _snappedOnMeta,
        snappedOn.isAcceptableOrUnknown(data['snapped_on']!, _snappedOnMeta),
      );
    } else if (isInserting) {
      context.missing(_snappedOnMeta);
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
  BucketSnapTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BucketSnapTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      bucketId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bucket_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      snappedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}snapped_on'],
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
  $BucketSnapsTable createAlias(String alias) {
    return $BucketSnapsTable(attachedDatabase, alias);
  }
}

class BucketSnapTable extends DataClass implements Insertable<BucketSnapTable> {
  final int id;
  final int bucketId;
  final int amount;
  final DateTime snappedOn;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BucketSnapTable({
    required this.id,
    required this.bucketId,
    required this.amount,
    required this.snappedOn,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bucket_id'] = Variable<int>(bucketId);
    map['amount'] = Variable<int>(amount);
    map['snapped_on'] = Variable<DateTime>(snappedOn);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BucketSnapsCompanion toCompanion(bool nullToAbsent) {
    return BucketSnapsCompanion(
      id: Value(id),
      bucketId: Value(bucketId),
      amount: Value(amount),
      snappedOn: Value(snappedOn),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BucketSnapTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BucketSnapTable(
      id: serializer.fromJson<int>(json['id']),
      bucketId: serializer.fromJson<int>(json['bucketId']),
      amount: serializer.fromJson<int>(json['amount']),
      snappedOn: serializer.fromJson<DateTime>(json['snappedOn']),
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
      'amount': serializer.toJson<int>(amount),
      'snappedOn': serializer.toJson<DateTime>(snappedOn),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BucketSnapTable copyWith({
    int? id,
    int? bucketId,
    int? amount,
    DateTime? snappedOn,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BucketSnapTable(
    id: id ?? this.id,
    bucketId: bucketId ?? this.bucketId,
    amount: amount ?? this.amount,
    snappedOn: snappedOn ?? this.snappedOn,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BucketSnapTable copyWithCompanion(BucketSnapsCompanion data) {
    return BucketSnapTable(
      id: data.id.present ? data.id.value : this.id,
      bucketId: data.bucketId.present ? data.bucketId.value : this.bucketId,
      amount: data.amount.present ? data.amount.value : this.amount,
      snappedOn: data.snappedOn.present ? data.snappedOn.value : this.snappedOn,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BucketSnapTable(')
          ..write('id: $id, ')
          ..write('bucketId: $bucketId, ')
          ..write('amount: $amount, ')
          ..write('snappedOn: $snappedOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, bucketId, amount, snappedOn, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BucketSnapTable &&
          other.id == this.id &&
          other.bucketId == this.bucketId &&
          other.amount == this.amount &&
          other.snappedOn == this.snappedOn &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketSnapsCompanion extends UpdateCompanion<BucketSnapTable> {
  final Value<int> id;
  final Value<int> bucketId;
  final Value<int> amount;
  final Value<DateTime> snappedOn;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketSnapsCompanion({
    this.id = const Value.absent(),
    this.bucketId = const Value.absent(),
    this.amount = const Value.absent(),
    this.snappedOn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketSnapsCompanion.insert({
    this.id = const Value.absent(),
    required int bucketId,
    required int amount,
    required DateTime snappedOn,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : bucketId = Value(bucketId),
       amount = Value(amount),
       snappedOn = Value(snappedOn);
  static Insertable<BucketSnapTable> custom({
    Expression<int>? id,
    Expression<int>? bucketId,
    Expression<int>? amount,
    Expression<DateTime>? snappedOn,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bucketId != null) 'bucket_id': bucketId,
      if (amount != null) 'amount': amount,
      if (snappedOn != null) 'snapped_on': snappedOn,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BucketSnapsCompanion copyWith({
    Value<int>? id,
    Value<int>? bucketId,
    Value<int>? amount,
    Value<DateTime>? snappedOn,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketSnapsCompanion(
      id: id ?? this.id,
      bucketId: bucketId ?? this.bucketId,
      amount: amount ?? this.amount,
      snappedOn: snappedOn ?? this.snappedOn,
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
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (snappedOn.present) {
      map['snapped_on'] = Variable<DateTime>(snappedOn.value);
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
    return (StringBuffer('BucketSnapsCompanion(')
          ..write('id: $id, ')
          ..write('bucketId: $bucketId, ')
          ..write('amount: $amount, ')
          ..write('snappedOn: $snappedOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $BucketCategoriesTable bucketCategories = $BucketCategoriesTable(
    this,
  );
  late final $BucketsTable buckets = $BucketsTable(this);
  late final $DropCategoriesTable dropCategories = $DropCategoriesTable(this);
  late final $SubscribedDropsTable subscribedDrops = $SubscribedDropsTable(
    this,
  );
  late final $DropsTable drops = $DropsTable(this);
  late final $BucketSnapsTable bucketSnaps = $BucketSnapsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    bucketCategories,
    buckets,
    dropCategories,
    subscribedDrops,
    drops,
    bucketSnaps,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'drop_categories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('subscribed_drops', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'drop_categories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('drops', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'subscribed_drops',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('drops', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'drops',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('drops', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'buckets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('bucket_snaps', kind: UpdateKind.delete)],
    ),
  ]);
}
