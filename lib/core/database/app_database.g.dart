// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class Buckets extends Table with TableInfo<Buckets, BucketTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Buckets(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _isIncomeDefaultMeta = const VerificationMeta(
    'isIncomeDefault',
  );
  late final GeneratedColumn<bool> isIncomeDefault = GeneratedColumn<bool>(
    'is_income_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _isExpenseDefaultMeta = const VerificationMeta(
    'isExpenseDefault',
  );
  late final GeneratedColumn<bool> isExpenseDefault = GeneratedColumn<bool>(
    'is_expense_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  late final GeneratedColumnWithTypeConverter<BucketCategory, String>
  bucketCategory = GeneratedColumn<String>(
    'bucket_category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  ).withConverter<BucketCategory>(Buckets.$converterbucketCategory);
  static const VerificationMeta _expectedRateMeta = const VerificationMeta(
    'expectedRate',
  );
  late final GeneratedColumn<double> expectedRate = GeneratedColumn<double>(
    'expected_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0.0',
    defaultValue: const CustomExpression('0.0'),
  );
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
    'sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    isIncomeDefault,
    isExpenseDefault,
    bucketCategory,
    expectedRate,
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
    if (data.containsKey('expected_rate')) {
      context.handle(
        _expectedRateMeta,
        expectedRate.isAcceptableOrUnknown(
          data['expected_rate']!,
          _expectedRateMeta,
        ),
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
      bucketCategory: Buckets.$converterbucketCategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}bucket_category'],
        )!,
      ),
      expectedRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}expected_rate'],
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
  Buckets createAlias(String alias) {
    return Buckets(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BucketCategory, String, String>
  $converterbucketCategory = const EnumNameConverter<BucketCategory>(
    BucketCategory.values,
  );
  @override
  bool get dontWriteConstraints => true;
}

class BucketTable extends DataClass implements Insertable<BucketTable> {
  final int id;
  final String name;
  final bool isIncomeDefault;
  final bool isExpenseDefault;
  final BucketCategory bucketCategory;
  final double expectedRate;
  final int sort;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BucketTable({
    required this.id,
    required this.name,
    required this.isIncomeDefault,
    required this.isExpenseDefault,
    required this.bucketCategory,
    required this.expectedRate,
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
    {
      map['bucket_category'] = Variable<String>(
        Buckets.$converterbucketCategory.toSql(bucketCategory),
      );
    }
    map['expected_rate'] = Variable<double>(expectedRate);
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
      bucketCategory: Value(bucketCategory),
      expectedRate: Value(expectedRate),
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
      isIncomeDefault: serializer.fromJson<bool>(json['is_income_default']),
      isExpenseDefault: serializer.fromJson<bool>(json['is_expense_default']),
      bucketCategory: Buckets.$converterbucketCategory.fromJson(
        serializer.fromJson<String>(json['bucket_category']),
      ),
      expectedRate: serializer.fromJson<double>(json['expected_rate']),
      sort: serializer.fromJson<int>(json['sort']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'is_income_default': serializer.toJson<bool>(isIncomeDefault),
      'is_expense_default': serializer.toJson<bool>(isExpenseDefault),
      'bucket_category': serializer.toJson<String>(
        Buckets.$converterbucketCategory.toJson(bucketCategory),
      ),
      'expected_rate': serializer.toJson<double>(expectedRate),
      'sort': serializer.toJson<int>(sort),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BucketTable copyWith({
    int? id,
    String? name,
    bool? isIncomeDefault,
    bool? isExpenseDefault,
    BucketCategory? bucketCategory,
    double? expectedRate,
    int? sort,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BucketTable(
    id: id ?? this.id,
    name: name ?? this.name,
    isIncomeDefault: isIncomeDefault ?? this.isIncomeDefault,
    isExpenseDefault: isExpenseDefault ?? this.isExpenseDefault,
    bucketCategory: bucketCategory ?? this.bucketCategory,
    expectedRate: expectedRate ?? this.expectedRate,
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
      bucketCategory: data.bucketCategory.present
          ? data.bucketCategory.value
          : this.bucketCategory,
      expectedRate: data.expectedRate.present
          ? data.expectedRate.value
          : this.expectedRate,
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
          ..write('bucketCategory: $bucketCategory, ')
          ..write('expectedRate: $expectedRate, ')
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
    bucketCategory,
    expectedRate,
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
          other.bucketCategory == this.bucketCategory &&
          other.expectedRate == this.expectedRate &&
          other.sort == this.sort &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketsCompanion extends UpdateCompanion<BucketTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isIncomeDefault;
  final Value<bool> isExpenseDefault;
  final Value<BucketCategory> bucketCategory;
  final Value<double> expectedRate;
  final Value<int> sort;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isIncomeDefault = const Value.absent(),
    this.isExpenseDefault = const Value.absent(),
    this.bucketCategory = const Value.absent(),
    this.expectedRate = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isIncomeDefault = const Value.absent(),
    this.isExpenseDefault = const Value.absent(),
    required BucketCategory bucketCategory,
    this.expectedRate = const Value.absent(),
    required int sort,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       bucketCategory = Value(bucketCategory),
       sort = Value(sort);
  static Insertable<BucketTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isIncomeDefault,
    Expression<bool>? isExpenseDefault,
    Expression<String>? bucketCategory,
    Expression<double>? expectedRate,
    Expression<int>? sort,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isIncomeDefault != null) 'is_income_default': isIncomeDefault,
      if (isExpenseDefault != null) 'is_expense_default': isExpenseDefault,
      if (bucketCategory != null) 'bucket_category': bucketCategory,
      if (expectedRate != null) 'expected_rate': expectedRate,
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
    Value<BucketCategory>? bucketCategory,
    Value<double>? expectedRate,
    Value<int>? sort,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BucketsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isIncomeDefault: isIncomeDefault ?? this.isIncomeDefault,
      isExpenseDefault: isExpenseDefault ?? this.isExpenseDefault,
      bucketCategory: bucketCategory ?? this.bucketCategory,
      expectedRate: expectedRate ?? this.expectedRate,
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
    if (bucketCategory.present) {
      map['bucket_category'] = Variable<String>(
        Buckets.$converterbucketCategory.toSql(bucketCategory.value),
      );
    }
    if (expectedRate.present) {
      map['expected_rate'] = Variable<double>(expectedRate.value);
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
          ..write('bucketCategory: $bucketCategory, ')
          ..write('expectedRate: $expectedRate, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class DropCategories extends Table
    with TableInfo<DropCategories, DropCategoryTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DropCategories(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumnWithTypeConverter<DropType, String> dropType =
      GeneratedColumn<String>(
        'drop_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<DropType>(DropCategories.$converterdropType);
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  late final GeneratedColumn<int> budget = GeneratedColumn<int>(
    'budget',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
    'sort',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _isSystemMeta = const VerificationMeta(
    'isSystem',
  );
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
    'is_system',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    icon,
    dropType,
    budget,
    sort,
    isSystem,
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
    if (data.containsKey('is_system')) {
      context.handle(
        _isSystemMeta,
        isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta),
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      dropType: DropCategories.$converterdropType.fromSql(
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
      isSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system'],
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
  DropCategories createAlias(String alias) {
    return DropCategories(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DropType, String, String> $converterdropType =
      const EnumNameConverter<DropType>(DropType.values);
  @override
  bool get dontWriteConstraints => true;
}

class DropCategoryTable extends DataClass
    implements Insertable<DropCategoryTable> {
  final int id;
  final String name;
  final String icon;
  final DropType dropType;
  final int budget;
  final int sort;
  final bool isSystem;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DropCategoryTable({
    required this.id,
    required this.name,
    required this.icon,
    required this.dropType,
    required this.budget,
    required this.sort,
    required this.isSystem,
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
        DropCategories.$converterdropType.toSql(dropType),
      );
    }
    map['budget'] = Variable<int>(budget);
    map['sort'] = Variable<int>(sort);
    map['is_system'] = Variable<bool>(isSystem);
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
      isSystem: Value(isSystem),
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
      dropType: DropCategories.$converterdropType.fromJson(
        serializer.fromJson<String>(json['drop_type']),
      ),
      budget: serializer.fromJson<int>(json['budget']),
      sort: serializer.fromJson<int>(json['sort']),
      isSystem: serializer.fromJson<bool>(json['is_system']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String>(icon),
      'drop_type': serializer.toJson<String>(
        DropCategories.$converterdropType.toJson(dropType),
      ),
      'budget': serializer.toJson<int>(budget),
      'sort': serializer.toJson<int>(sort),
      'is_system': serializer.toJson<bool>(isSystem),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DropCategoryTable copyWith({
    int? id,
    String? name,
    String? icon,
    DropType? dropType,
    int? budget,
    int? sort,
    bool? isSystem,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DropCategoryTable(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon,
    dropType: dropType ?? this.dropType,
    budget: budget ?? this.budget,
    sort: sort ?? this.sort,
    isSystem: isSystem ?? this.isSystem,
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
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
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
          ..write('isSystem: $isSystem, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    icon,
    dropType,
    budget,
    sort,
    isSystem,
    createdAt,
    updatedAt,
  );
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
          other.isSystem == this.isSystem &&
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
  final Value<bool> isSystem;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DropCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.dropType = const Value.absent(),
    this.budget = const Value.absent(),
    this.sort = const Value.absent(),
    this.isSystem = const Value.absent(),
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
    this.isSystem = const Value.absent(),
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
    Expression<bool>? isSystem,
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
      if (isSystem != null) 'is_system': isSystem,
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
    Value<bool>? isSystem,
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
      isSystem: isSystem ?? this.isSystem,
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
        DropCategories.$converterdropType.toSql(dropType.value),
      );
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
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
          ..write('isSystem: $isSystem, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class SubscribedDrops extends Table
    with TableInfo<SubscribedDrops, SubscribedDropTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SubscribedDrops(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _fromBucketIdMeta = const VerificationMeta(
    'fromBucketId',
  );
  late final GeneratedColumn<int> fromBucketId = GeneratedColumn<int>(
    'from_bucket_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES buckets(id)ON DELETE RESTRICT',
  );
  static const VerificationMeta _toBucketIdMeta = const VerificationMeta(
    'toBucketId',
  );
  late final GeneratedColumn<int> toBucketId = GeneratedColumn<int>(
    'to_bucket_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES buckets(id)ON DELETE RESTRICT',
  );
  static const VerificationMeta _dropCategoryIdMeta = const VerificationMeta(
    'dropCategoryId',
  );
  late final GeneratedColumn<int> dropCategoryId = GeneratedColumn<int>(
    'drop_category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES drop_categories(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumnWithTypeConverter<Frequency, String> frequency =
      GeneratedColumn<String>(
        'frequency',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<Frequency>(SubscribedDrops.$converterfrequency);
  static const VerificationMeta _repeatIntervalMeta = const VerificationMeta(
    'repeatInterval',
  );
  late final GeneratedColumn<int> repeatInterval = GeneratedColumn<int>(
    'repeat_interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _startsOnMeta = const VerificationMeta(
    'startsOn',
  );
  late final GeneratedColumn<DateTime> startsOn = GeneratedColumn<DateTime>(
    'starts_on',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _endsOnMeta = const VerificationMeta('endsOn');
  late final GeneratedColumn<DateTime> endsOn = GeneratedColumn<DateTime>(
    'ends_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
    } else if (isInserting) {
      context.missing(_repeatIntervalMeta);
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
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
      frequency: SubscribedDrops.$converterfrequency.fromSql(
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
  SubscribedDrops createAlias(String alias) {
    return SubscribedDrops(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Frequency, String, String> $converterfrequency =
      const EnumNameConverter<Frequency>(Frequency.values);
  @override
  bool get dontWriteConstraints => true;
}

class SubscribedDropTable extends DataClass
    implements Insertable<SubscribedDropTable> {
  final int id;
  final String name;
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
    required this.name,
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
    map['name'] = Variable<String>(name);
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
        SubscribedDrops.$converterfrequency.toSql(frequency),
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
      name: Value(name),
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
      name: serializer.fromJson<String>(json['name']),
      fromBucketId: serializer.fromJson<int?>(json['from_bucket_id']),
      toBucketId: serializer.fromJson<int?>(json['to_bucket_id']),
      dropCategoryId: serializer.fromJson<int?>(json['drop_category_id']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<int>(json['amount']),
      frequency: SubscribedDrops.$converterfrequency.fromJson(
        serializer.fromJson<String>(json['frequency']),
      ),
      repeatInterval: serializer.fromJson<int>(json['repeat_interval']),
      startsOn: serializer.fromJson<DateTime>(json['starts_on']),
      endsOn: serializer.fromJson<DateTime?>(json['ends_on']),
      isActive: serializer.fromJson<bool>(json['is_active']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'from_bucket_id': serializer.toJson<int?>(fromBucketId),
      'to_bucket_id': serializer.toJson<int?>(toBucketId),
      'drop_category_id': serializer.toJson<int?>(dropCategoryId),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<int>(amount),
      'frequency': serializer.toJson<String>(
        SubscribedDrops.$converterfrequency.toJson(frequency),
      ),
      'repeat_interval': serializer.toJson<int>(repeatInterval),
      'starts_on': serializer.toJson<DateTime>(startsOn),
      'ends_on': serializer.toJson<DateTime?>(endsOn),
      'is_active': serializer.toJson<bool>(isActive),
      'notes': serializer.toJson<String?>(notes),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SubscribedDropTable copyWith({
    int? id,
    String? name,
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
    name: name ?? this.name,
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
      name: data.name.present ? data.name.value : this.name,
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
          ..write('name: $name, ')
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
    name,
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
          other.name == this.name &&
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
  final Value<String> name;
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
    this.name = const Value.absent(),
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
    required String name,
    this.fromBucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    this.dropCategoryId = const Value.absent(),
    required String title,
    required int amount,
    required Frequency frequency,
    required int repeatInterval,
    required DateTime startsOn,
    this.endsOn = const Value.absent(),
    this.isActive = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       title = Value(title),
       amount = Value(amount),
       frequency = Value(frequency),
       repeatInterval = Value(repeatInterval),
       startsOn = Value(startsOn);
  static Insertable<SubscribedDropTable> custom({
    Expression<int>? id,
    Expression<String>? name,
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
      if (name != null) 'name': name,
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
    Value<String>? name,
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
      name: name ?? this.name,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
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
        SubscribedDrops.$converterfrequency.toSql(frequency.value),
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
          ..write('name: $name, ')
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

class Drops extends Table with TableInfo<Drops, DropTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Drops(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _fromBucketIdMeta = const VerificationMeta(
    'fromBucketId',
  );
  late final GeneratedColumn<int> fromBucketId = GeneratedColumn<int>(
    'from_bucket_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES buckets(id)ON DELETE RESTRICT',
  );
  static const VerificationMeta _toBucketIdMeta = const VerificationMeta(
    'toBucketId',
  );
  late final GeneratedColumn<int> toBucketId = GeneratedColumn<int>(
    'to_bucket_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES buckets(id)ON DELETE RESTRICT',
  );
  static const VerificationMeta _dropCategoryIdMeta = const VerificationMeta(
    'dropCategoryId',
  );
  late final GeneratedColumn<int> dropCategoryId = GeneratedColumn<int>(
    'drop_category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES drop_categories(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _subscribedDropIdMeta = const VerificationMeta(
    'subscribedDropId',
  );
  late final GeneratedColumn<int> subscribedDropId = GeneratedColumn<int>(
    'subscribed_drop_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES subscribed_drops(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _parentDropIdMeta = const VerificationMeta(
    'parentDropId',
  );
  late final GeneratedColumn<int> parentDropId = GeneratedColumn<int>(
    'parent_drop_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES drops(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _droppedOnMeta = const VerificationMeta(
    'droppedOn',
  );
  late final GeneratedColumn<DateTime> droppedOn = GeneratedColumn<DateTime>(
    'dropped_on',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    fromBucketId,
    toBucketId,
    dropCategoryId,
    subscribedDropId,
    parentDropId,
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
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
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
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
  Drops createAlias(String alias) {
    return Drops(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DropTable extends DataClass implements Insertable<DropTable> {
  final int id;
  final String title;
  final int? fromBucketId;
  final int? toBucketId;
  final int? dropCategoryId;
  final int? subscribedDropId;
  final int? parentDropId;
  final int amount;
  final DateTime droppedOn;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DropTable({
    required this.id,
    required this.title,
    this.fromBucketId,
    this.toBucketId,
    this.dropCategoryId,
    this.subscribedDropId,
    this.parentDropId,
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
    map['title'] = Variable<String>(title);
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
      title: Value(title),
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
      title: serializer.fromJson<String>(json['title']),
      fromBucketId: serializer.fromJson<int?>(json['from_bucket_id']),
      toBucketId: serializer.fromJson<int?>(json['to_bucket_id']),
      dropCategoryId: serializer.fromJson<int?>(json['drop_category_id']),
      subscribedDropId: serializer.fromJson<int?>(json['subscribed_drop_id']),
      parentDropId: serializer.fromJson<int?>(json['parent_drop_id']),
      amount: serializer.fromJson<int>(json['amount']),
      droppedOn: serializer.fromJson<DateTime>(json['dropped_on']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'from_bucket_id': serializer.toJson<int?>(fromBucketId),
      'to_bucket_id': serializer.toJson<int?>(toBucketId),
      'drop_category_id': serializer.toJson<int?>(dropCategoryId),
      'subscribed_drop_id': serializer.toJson<int?>(subscribedDropId),
      'parent_drop_id': serializer.toJson<int?>(parentDropId),
      'amount': serializer.toJson<int>(amount),
      'dropped_on': serializer.toJson<DateTime>(droppedOn),
      'notes': serializer.toJson<String?>(notes),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DropTable copyWith({
    int? id,
    String? title,
    Value<int?> fromBucketId = const Value.absent(),
    Value<int?> toBucketId = const Value.absent(),
    Value<int?> dropCategoryId = const Value.absent(),
    Value<int?> subscribedDropId = const Value.absent(),
    Value<int?> parentDropId = const Value.absent(),
    int? amount,
    DateTime? droppedOn,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DropTable(
    id: id ?? this.id,
    title: title ?? this.title,
    fromBucketId: fromBucketId.present ? fromBucketId.value : this.fromBucketId,
    toBucketId: toBucketId.present ? toBucketId.value : this.toBucketId,
    dropCategoryId: dropCategoryId.present
        ? dropCategoryId.value
        : this.dropCategoryId,
    subscribedDropId: subscribedDropId.present
        ? subscribedDropId.value
        : this.subscribedDropId,
    parentDropId: parentDropId.present ? parentDropId.value : this.parentDropId,
    amount: amount ?? this.amount,
    droppedOn: droppedOn ?? this.droppedOn,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DropTable copyWithCompanion(DropsCompanion data) {
    return DropTable(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
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
          ..write('title: $title, ')
          ..write('fromBucketId: $fromBucketId, ')
          ..write('toBucketId: $toBucketId, ')
          ..write('dropCategoryId: $dropCategoryId, ')
          ..write('subscribedDropId: $subscribedDropId, ')
          ..write('parentDropId: $parentDropId, ')
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
    title,
    fromBucketId,
    toBucketId,
    dropCategoryId,
    subscribedDropId,
    parentDropId,
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
          other.title == this.title &&
          other.fromBucketId == this.fromBucketId &&
          other.toBucketId == this.toBucketId &&
          other.dropCategoryId == this.dropCategoryId &&
          other.subscribedDropId == this.subscribedDropId &&
          other.parentDropId == this.parentDropId &&
          other.amount == this.amount &&
          other.droppedOn == this.droppedOn &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DropsCompanion extends UpdateCompanion<DropTable> {
  final Value<int> id;
  final Value<String> title;
  final Value<int?> fromBucketId;
  final Value<int?> toBucketId;
  final Value<int?> dropCategoryId;
  final Value<int?> subscribedDropId;
  final Value<int?> parentDropId;
  final Value<int> amount;
  final Value<DateTime> droppedOn;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DropsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.fromBucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    this.dropCategoryId = const Value.absent(),
    this.subscribedDropId = const Value.absent(),
    this.parentDropId = const Value.absent(),
    this.amount = const Value.absent(),
    this.droppedOn = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DropsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.fromBucketId = const Value.absent(),
    this.toBucketId = const Value.absent(),
    this.dropCategoryId = const Value.absent(),
    this.subscribedDropId = const Value.absent(),
    this.parentDropId = const Value.absent(),
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
    Expression<String>? title,
    Expression<int>? fromBucketId,
    Expression<int>? toBucketId,
    Expression<int>? dropCategoryId,
    Expression<int>? subscribedDropId,
    Expression<int>? parentDropId,
    Expression<int>? amount,
    Expression<DateTime>? droppedOn,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (fromBucketId != null) 'from_bucket_id': fromBucketId,
      if (toBucketId != null) 'to_bucket_id': toBucketId,
      if (dropCategoryId != null) 'drop_category_id': dropCategoryId,
      if (subscribedDropId != null) 'subscribed_drop_id': subscribedDropId,
      if (parentDropId != null) 'parent_drop_id': parentDropId,
      if (amount != null) 'amount': amount,
      if (droppedOn != null) 'dropped_on': droppedOn,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DropsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<int?>? fromBucketId,
    Value<int?>? toBucketId,
    Value<int?>? dropCategoryId,
    Value<int?>? subscribedDropId,
    Value<int?>? parentDropId,
    Value<int>? amount,
    Value<DateTime>? droppedOn,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DropsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      fromBucketId: fromBucketId ?? this.fromBucketId,
      toBucketId: toBucketId ?? this.toBucketId,
      dropCategoryId: dropCategoryId ?? this.dropCategoryId,
      subscribedDropId: subscribedDropId ?? this.subscribedDropId,
      parentDropId: parentDropId ?? this.parentDropId,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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
          ..write('title: $title, ')
          ..write('fromBucketId: $fromBucketId, ')
          ..write('toBucketId: $toBucketId, ')
          ..write('dropCategoryId: $dropCategoryId, ')
          ..write('subscribedDropId: $subscribedDropId, ')
          ..write('parentDropId: $parentDropId, ')
          ..write('amount: $amount, ')
          ..write('droppedOn: $droppedOn, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class BucketSnaps extends Table with TableInfo<BucketSnaps, BucketSnapTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BucketSnaps(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _bucketIdMeta = const VerificationMeta(
    'bucketId',
  );
  late final GeneratedColumn<int> bucketId = GeneratedColumn<int>(
    'bucket_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES buckets(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _snappedOnMeta = const VerificationMeta(
    'snappedOn',
  );
  late final GeneratedColumn<DateTime> snappedOn = GeneratedColumn<DateTime>(
    'snapped_on',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
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
  BucketSnaps createAlias(String alias) {
    return BucketSnaps(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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
      bucketId: serializer.fromJson<int>(json['bucket_id']),
      amount: serializer.fromJson<int>(json['amount']),
      snappedOn: serializer.fromJson<DateTime>(json['snapped_on']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bucket_id': serializer.toJson<int>(bucketId),
      'amount': serializer.toJson<int>(amount),
      'snapped_on': serializer.toJson<DateTime>(snappedOn),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
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
  late final Buckets buckets = Buckets(this);
  late final DropCategories dropCategories = DropCategories(this);
  late final SubscribedDrops subscribedDrops = SubscribedDrops(this);
  late final Drops drops = Drops(this);
  late final BucketSnaps bucketSnaps = BucketSnaps(this);
  Future<int> createSubscribedDrop(Insertable<SubscribedDropTable> entry) {
    var $arrayStartIndex = 1;
    final generatedentry = $writeInsertable(
      this.subscribedDrops,
      entry,
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedentry.amountOfVariables;
    return customInsert(
      'INSERT INTO subscribed_drops ${generatedentry.sql}',
      variables: [...generatedentry.introducedVariables],
      updates: {subscribedDrops},
    );
  }

  Selectable<SubscribedDropTable> getSubscribedDrop(int id) {
    return customSelect(
      'SELECT * FROM subscribed_drops WHERE id = ?1',
      variables: [Variable<int>(id)],
      readsFrom: {subscribedDrops},
    ).asyncMap(subscribedDrops.mapFromRow);
  }

  Selectable<SubscribedDropTable> getSubscribedDrops() {
    return customSelect(
      'SELECT * FROM subscribed_drops ORDER BY starts_on DESC',
      variables: [],
      readsFrom: {subscribedDrops},
    ).asyncMap(subscribedDrops.mapFromRow);
  }

  Selectable<SubscribedDropTable> getActiveSubscribedDrops() {
    return customSelect(
      'SELECT * FROM subscribed_drops WHERE is_active = TRUE ORDER BY starts_on DESC',
      variables: [],
      readsFrom: {subscribedDrops},
    ).asyncMap(subscribedDrops.mapFromRow);
  }

  Selectable<SubscribedDropTable> getUnactiveSubscribedDrops() {
    return customSelect(
      'SELECT * FROM subscribed_drops WHERE is_active = FALSE ORDER BY starts_on DESC',
      variables: [],
      readsFrom: {subscribedDrops},
    ).asyncMap(subscribedDrops.mapFromRow);
  }

  Future<int> updateSubscribedDrop(
    String name,
    int? fromBucketId,
    int? toBucketId,
    int? dropCategoryId,
    String title,
    int amount,
    Frequency frequency,
    int repeatInterval,
    DateTime startsOn,
    DateTime? endsOn,
    bool isActive,
    String? notes,
    int id,
  ) {
    return customUpdate(
      'UPDATE subscribed_drops SET name = ?1, from_bucket_id = ?2, to_bucket_id = ?3, drop_category_id = ?4, title = ?5, amount = ?6, frequency = ?7, repeat_interval = ?8, starts_on = ?9, ends_on = ?10, is_active = ?11, notes = ?12, updated_at = CURRENT_TIMESTAMP WHERE id = ?13',
      variables: [
        Variable<String>(name),
        Variable<int>(fromBucketId),
        Variable<int>(toBucketId),
        Variable<int>(dropCategoryId),
        Variable<String>(title),
        Variable<int>(amount),
        Variable<String>(SubscribedDrops.$converterfrequency.toSql(frequency)),
        Variable<int>(repeatInterval),
        Variable<DateTime>(startsOn),
        Variable<DateTime>(endsOn),
        Variable<bool>(isActive),
        Variable<String>(notes),
        Variable<int>(id),
      ],
      updates: {subscribedDrops},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteSubscribedDrop(int id) {
    return customUpdate(
      'DELETE FROM subscribed_drops WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {subscribedDrops},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> createDrop(Insertable<DropTable> entry) {
    var $arrayStartIndex = 1;
    final generatedentry = $writeInsertable(
      this.drops,
      entry,
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedentry.amountOfVariables;
    return customInsert(
      'INSERT INTO drops ${generatedentry.sql}',
      variables: [...generatedentry.introducedVariables],
      updates: {drops},
    );
  }

  Selectable<GetDropResult> getDrop(int id) {
    return customSelect(
      'SELECT drops.*, fb.name AS from_bucket_name, tb.name AS to_bucket_name, dc.name AS drop_category_name, dc.icon AS drop_category_icon, sd.title AS subscribed_drop_title, sd.name AS subscribed_drop_name, sd.notes AS subscribed_drop_notes FROM drops LEFT JOIN buckets AS fb ON drops.from_bucket_id = fb.id LEFT JOIN buckets AS tb ON drops.to_bucket_id = tb.id LEFT JOIN drop_categories AS dc ON drops.drop_category_id = dc.id LEFT JOIN subscribed_drops AS sd ON drops.subscribed_drop_id = sd.id WHERE drops.id = ?1',
      variables: [Variable<int>(id)],
      readsFrom: {buckets, dropCategories, subscribedDrops, drops},
    ).map(
      (QueryRow row) => GetDropResult(
        id: row.read<int>('id'),
        title: row.read<String>('title'),
        fromBucketId: row.readNullable<int>('from_bucket_id'),
        toBucketId: row.readNullable<int>('to_bucket_id'),
        dropCategoryId: row.readNullable<int>('drop_category_id'),
        subscribedDropId: row.readNullable<int>('subscribed_drop_id'),
        parentDropId: row.readNullable<int>('parent_drop_id'),
        amount: row.read<int>('amount'),
        droppedOn: row.read<DateTime>('dropped_on'),
        notes: row.readNullable<String>('notes'),
        createdAt: row.read<DateTime>('created_at'),
        updatedAt: row.read<DateTime>('updated_at'),
        fromBucketName: row.readNullable<String>('from_bucket_name'),
        toBucketName: row.readNullable<String>('to_bucket_name'),
        dropCategoryName: row.readNullable<String>('drop_category_name'),
        dropCategoryIcon: row.readNullable<String>('drop_category_icon'),
        subscribedDropTitle: row.readNullable<String>('subscribed_drop_title'),
        subscribedDropName: row.readNullable<String>('subscribed_drop_name'),
        subscribedDropNotes: row.readNullable<String>('subscribed_drop_notes'),
      ),
    );
  }

  Selectable<GetDropsResult> getDrops() {
    return customSelect(
      'SELECT drops.*, fb.name AS from_bucket_name, tb.name AS to_bucket_name, dc.name AS drop_category_name, dc.icon AS drop_category_icon, sd.title AS subscribed_drop_title, sd.name AS subscribed_drop_name FROM drops LEFT JOIN buckets AS fb ON drops.from_bucket_id = fb.id LEFT JOIN buckets AS tb ON drops.to_bucket_id = tb.id LEFT JOIN drop_categories AS dc ON drops.drop_category_id = dc.id LEFT JOIN subscribed_drops AS sd ON drops.subscribed_drop_id = sd.id ORDER BY dropped_on DESC',
      variables: [],
      readsFrom: {buckets, dropCategories, subscribedDrops, drops},
    ).map(
      (QueryRow row) => GetDropsResult(
        id: row.read<int>('id'),
        title: row.read<String>('title'),
        fromBucketId: row.readNullable<int>('from_bucket_id'),
        toBucketId: row.readNullable<int>('to_bucket_id'),
        dropCategoryId: row.readNullable<int>('drop_category_id'),
        subscribedDropId: row.readNullable<int>('subscribed_drop_id'),
        parentDropId: row.readNullable<int>('parent_drop_id'),
        amount: row.read<int>('amount'),
        droppedOn: row.read<DateTime>('dropped_on'),
        notes: row.readNullable<String>('notes'),
        createdAt: row.read<DateTime>('created_at'),
        updatedAt: row.read<DateTime>('updated_at'),
        fromBucketName: row.readNullable<String>('from_bucket_name'),
        toBucketName: row.readNullable<String>('to_bucket_name'),
        dropCategoryName: row.readNullable<String>('drop_category_name'),
        dropCategoryIcon: row.readNullable<String>('drop_category_icon'),
        subscribedDropTitle: row.readNullable<String>('subscribed_drop_title'),
        subscribedDropName: row.readNullable<String>('subscribed_drop_name'),
      ),
    );
  }

  Selectable<GetDropsInPeriodResult> getDropsInPeriod(
    String startDate,
    String endDate,
  ) {
    return customSelect(
      'SELECT drops.*, fb.name AS from_bucket_name, tb.name AS to_bucket_name, dc.name AS drop_category_name, dc.icon AS drop_category_icon, sd.title AS subscribed_drop_title, sd.name AS subscribed_drop_name FROM drops LEFT JOIN buckets AS fb ON drops.from_bucket_id = fb.id LEFT JOIN buckets AS tb ON drops.to_bucket_id = tb.id LEFT JOIN drop_categories AS dc ON drops.drop_category_id = dc.id LEFT JOIN subscribed_drops AS sd ON drops.subscribed_drop_id = sd.id WHERE unixepoch(dropped_on) BETWEEN unixepoch(?1) AND unixepoch(?2) ORDER BY dropped_on DESC',
      variables: [Variable<String>(startDate), Variable<String>(endDate)],
      readsFrom: {buckets, dropCategories, subscribedDrops, drops},
    ).map(
      (QueryRow row) => GetDropsInPeriodResult(
        id: row.read<int>('id'),
        title: row.read<String>('title'),
        fromBucketId: row.readNullable<int>('from_bucket_id'),
        toBucketId: row.readNullable<int>('to_bucket_id'),
        dropCategoryId: row.readNullable<int>('drop_category_id'),
        subscribedDropId: row.readNullable<int>('subscribed_drop_id'),
        parentDropId: row.readNullable<int>('parent_drop_id'),
        amount: row.read<int>('amount'),
        droppedOn: row.read<DateTime>('dropped_on'),
        notes: row.readNullable<String>('notes'),
        createdAt: row.read<DateTime>('created_at'),
        updatedAt: row.read<DateTime>('updated_at'),
        fromBucketName: row.readNullable<String>('from_bucket_name'),
        toBucketName: row.readNullable<String>('to_bucket_name'),
        dropCategoryName: row.readNullable<String>('drop_category_name'),
        dropCategoryIcon: row.readNullable<String>('drop_category_icon'),
        subscribedDropTitle: row.readNullable<String>('subscribed_drop_title'),
        subscribedDropName: row.readNullable<String>('subscribed_drop_name'),
      ),
    );
  }

  Future<int> updateDrop(
    String title,
    int? fromBucketId,
    int? toBucketId,
    int? dropCategoryId,
    int? subscribedDropId,
    int? parentDropId,
    int amount,
    DateTime droppedOn,
    String? notes,
    int id,
  ) {
    return customUpdate(
      'UPDATE drops SET title = ?1, from_bucket_id = ?2, to_bucket_id = ?3, drop_category_id = ?4, subscribed_drop_id = ?5, parent_drop_id = ?6, amount = ?7, dropped_on = ?8, notes = ?9, updated_at = CURRENT_TIMESTAMP WHERE id = ?10',
      variables: [
        Variable<String>(title),
        Variable<int>(fromBucketId),
        Variable<int>(toBucketId),
        Variable<int>(dropCategoryId),
        Variable<int>(subscribedDropId),
        Variable<int>(parentDropId),
        Variable<int>(amount),
        Variable<DateTime>(droppedOn),
        Variable<String>(notes),
        Variable<int>(id),
      ],
      updates: {drops},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteDrop(int id) {
    return customUpdate(
      'DELETE FROM drops WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {drops},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> createDropCategory(Insertable<DropCategoryTable> entry) {
    var $arrayStartIndex = 1;
    final generatedentry = $writeInsertable(
      this.dropCategories,
      entry,
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedentry.amountOfVariables;
    return customInsert(
      'INSERT INTO drop_categories ${generatedentry.sql}',
      variables: [...generatedentry.introducedVariables],
      updates: {dropCategories},
    );
  }

  Selectable<DropCategoryTable> getDropCategory(int id) {
    return customSelect(
      'SELECT * FROM drop_categories WHERE id = ?1',
      variables: [Variable<int>(id)],
      readsFrom: {dropCategories},
    ).asyncMap(dropCategories.mapFromRow);
  }

  Selectable<DropCategoryTable> getDropCategories() {
    return customSelect(
      'SELECT * FROM drop_categories ORDER BY sort ASC',
      variables: [],
      readsFrom: {dropCategories},
    ).asyncMap(dropCategories.mapFromRow);
  }

  Future<int> updateDropCategory(
    String name,
    String icon,
    DropType dropType,
    int budget,
    int sort,
    bool isSystem,
    int id,
  ) {
    return customUpdate(
      'UPDATE drop_categories SET name = ?1, icon = ?2, drop_type = ?3, budget = ?4, sort = ?5, is_system = ?6, updated_at = CURRENT_TIMESTAMP WHERE id = ?7',
      variables: [
        Variable<String>(name),
        Variable<String>(icon),
        Variable<String>(DropCategories.$converterdropType.toSql(dropType)),
        Variable<int>(budget),
        Variable<int>(sort),
        Variable<bool>(isSystem),
        Variable<int>(id),
      ],
      updates: {dropCategories},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteDropCategory(int id) {
    return customUpdate(
      'DELETE FROM drop_categories WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {dropCategories},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> createBucketSnap(Insertable<BucketSnapTable> entry) {
    var $arrayStartIndex = 1;
    final generatedentry = $writeInsertable(
      this.bucketSnaps,
      entry,
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedentry.amountOfVariables;
    return customInsert(
      'INSERT INTO bucket_snaps ${generatedentry.sql}',
      variables: [...generatedentry.introducedVariables],
      updates: {bucketSnaps},
    );
  }

  Selectable<BucketSnapTable> getBucketSnap(int id) {
    return customSelect(
      'SELECT * FROM bucket_snaps WHERE id = ?1',
      variables: [Variable<int>(id)],
      readsFrom: {bucketSnaps},
    ).asyncMap(bucketSnaps.mapFromRow);
  }

  Selectable<BucketSnapTable> getBucketSnaps() {
    return customSelect(
      'SELECT * FROM bucket_snaps ORDER BY snapped_on DESC',
      variables: [],
      readsFrom: {bucketSnaps},
    ).asyncMap(bucketSnaps.mapFromRow);
  }

  Future<int> updateBucketSnap(
    int bucketId,
    int amount,
    DateTime snappedOn,
    int id,
  ) {
    return customUpdate(
      'UPDATE bucket_snaps SET bucket_id = ?1, amount = ?2, snapped_on = ?3, updated_at = CURRENT_TIMESTAMP WHERE id = ?4',
      variables: [
        Variable<int>(bucketId),
        Variable<int>(amount),
        Variable<DateTime>(snappedOn),
        Variable<int>(id),
      ],
      updates: {bucketSnaps},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteBucketSnap(int id) {
    return customUpdate(
      'DELETE FROM bucket_snaps WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {bucketSnaps},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> createBucket(Insertable<BucketTable> entry) {
    var $arrayStartIndex = 1;
    final generatedentry = $writeInsertable(
      this.buckets,
      entry,
      startIndex: $arrayStartIndex,
    );
    $arrayStartIndex += generatedentry.amountOfVariables;
    return customInsert(
      'INSERT INTO buckets ${generatedentry.sql}',
      variables: [...generatedentry.introducedVariables],
      updates: {buckets},
    );
  }

  Selectable<BucketTable> getBucket(int id) {
    return customSelect(
      'SELECT * FROM buckets WHERE id = ?1',
      variables: [Variable<int>(id)],
      readsFrom: {buckets},
    ).asyncMap(buckets.mapFromRow);
  }

  Selectable<BucketTable> getBuckets() {
    return customSelect(
      'SELECT * FROM buckets ORDER BY sort ASC',
      variables: [],
      readsFrom: {buckets},
    ).asyncMap(buckets.mapFromRow);
  }

  Selectable<BucketTable> getIncomeDefaultBucket() {
    return customSelect(
      'SELECT * FROM buckets WHERE is_income_default = TRUE',
      variables: [],
      readsFrom: {buckets},
    ).asyncMap(buckets.mapFromRow);
  }

  Selectable<BucketTable> getExpenseDefaultBucket() {
    return customSelect(
      'SELECT * FROM buckets WHERE is_expense_default = TRUE',
      variables: [],
      readsFrom: {buckets},
    ).asyncMap(buckets.mapFromRow);
  }

  Future<int> updateBucket(
    String name,
    bool isIncomeDefault,
    bool isExpenseDefault,
    BucketCategory bucketCategory,
    double expectedRate,
    int sort,
    int id,
  ) {
    return customUpdate(
      'UPDATE buckets SET name = ?1, is_income_default = ?2, is_expense_default = ?3, bucket_category = ?4, expected_rate = ?5, sort = ?6, updated_at = CURRENT_TIMESTAMP WHERE id = ?7',
      variables: [
        Variable<String>(name),
        Variable<bool>(isIncomeDefault),
        Variable<bool>(isExpenseDefault),
        Variable<String>(
          Buckets.$converterbucketCategory.toSql(bucketCategory),
        ),
        Variable<double>(expectedRate),
        Variable<int>(sort),
        Variable<int>(id),
      ],
      updates: {buckets},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteBucket(int id) {
    return customUpdate(
      'DELETE FROM buckets WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {buckets},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
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
        'buckets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('bucket_snaps', kind: UpdateKind.delete)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

class GetDropResult {
  final int id;
  final String title;
  final int? fromBucketId;
  final int? toBucketId;
  final int? dropCategoryId;
  final int? subscribedDropId;
  final int? parentDropId;
  final int amount;
  final DateTime droppedOn;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? fromBucketName;
  final String? toBucketName;
  final String? dropCategoryName;
  final String? dropCategoryIcon;
  final String? subscribedDropTitle;
  final String? subscribedDropName;
  final String? subscribedDropNotes;
  GetDropResult({
    required this.id,
    required this.title,
    this.fromBucketId,
    this.toBucketId,
    this.dropCategoryId,
    this.subscribedDropId,
    this.parentDropId,
    required this.amount,
    required this.droppedOn,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.fromBucketName,
    this.toBucketName,
    this.dropCategoryName,
    this.dropCategoryIcon,
    this.subscribedDropTitle,
    this.subscribedDropName,
    this.subscribedDropNotes,
  });
}

class GetDropsResult {
  final int id;
  final String title;
  final int? fromBucketId;
  final int? toBucketId;
  final int? dropCategoryId;
  final int? subscribedDropId;
  final int? parentDropId;
  final int amount;
  final DateTime droppedOn;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? fromBucketName;
  final String? toBucketName;
  final String? dropCategoryName;
  final String? dropCategoryIcon;
  final String? subscribedDropTitle;
  final String? subscribedDropName;
  GetDropsResult({
    required this.id,
    required this.title,
    this.fromBucketId,
    this.toBucketId,
    this.dropCategoryId,
    this.subscribedDropId,
    this.parentDropId,
    required this.amount,
    required this.droppedOn,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.fromBucketName,
    this.toBucketName,
    this.dropCategoryName,
    this.dropCategoryIcon,
    this.subscribedDropTitle,
    this.subscribedDropName,
  });
}

class GetDropsInPeriodResult {
  final int id;
  final String title;
  final int? fromBucketId;
  final int? toBucketId;
  final int? dropCategoryId;
  final int? subscribedDropId;
  final int? parentDropId;
  final int amount;
  final DateTime droppedOn;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? fromBucketName;
  final String? toBucketName;
  final String? dropCategoryName;
  final String? dropCategoryIcon;
  final String? subscribedDropTitle;
  final String? subscribedDropName;
  GetDropsInPeriodResult({
    required this.id,
    required this.title,
    this.fromBucketId,
    this.toBucketId,
    this.dropCategoryId,
    this.subscribedDropId,
    this.parentDropId,
    required this.amount,
    required this.droppedOn,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.fromBucketName,
    this.toBucketName,
    this.dropCategoryName,
    this.dropCategoryIcon,
    this.subscribedDropTitle,
    this.subscribedDropName,
  });
}
