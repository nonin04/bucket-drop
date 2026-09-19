import 'package:bucket_drop/core/constants/app_icons.dart';
import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/drop_category/domain/drop_category.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drop_category_repository.g.dart';

@riverpod
DropCategoryRepository dropCategoryRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return DropCategoryRepository(db);
}

@riverpod
Stream<List<DropCategory>> dropCategoryList(Ref ref) {
  final repository = ref.watch(dropCategoryRepositoryProvider);
  return repository.watchDropCategories();
}

class DropCategoryRepository {
  DropCategoryRepository(this._db);
  final AppDatabase _db;

  Stream<List<DropCategory>> watchDropCategories() {
    debugPrint('◼︎ DropCategoryRepository: watchDropCategories() called');
    return _db.getDropCategories().watch().map(
      (rows) => rows.map((r) => r.toDomain()).toList(),
    );
  }
}

extension on DropCategoryTable {
  DropCategory toDomain() => DropCategory(
    id: id,
    name: name,
    icon: AppIcons.fromName(icon),
    dropType: dropType,
    budget: budget,
    sort: sort,
    isSystem: isSystem,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
