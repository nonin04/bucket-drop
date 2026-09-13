import 'package:bucket_drop/core/constants/app_icons.dart';
import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drop_repository.g.dart';

@riverpod
DropRepository dropRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return DropRepository(db);
}

class DropRepository {
  DropRepository(this._db);
  final AppDatabase _db;

  // 新規登録
  Future<void> createDrop(Drop drop) async {
    debugPrint('◼︎ DropRepository: createDrop() called');
    await _db.createDrop(drop.toCompanion());
  }

  // ① Future は async / await で書くのが標準
  Future<List<Drop>> getDrops() async {
    debugPrint('◼ DropRepository: getDrops() called');
    final rows = await _db.readDrops().get();
    return rows.map((r) => r.toDomain()).toList();
  }

  // ② Stream は .map() でパイプライン変換するのが標準
  Stream<List<Drop>> watchDrops() {
    debugPrint('◼ DropRepository: watchDrops() called');
    return _db.readDrops().watch().map(
      (rows) => rows.map((r) => r.toDomain()).toList(),
    );
  }

  Future<void> updateDrop(Drop drop) async {
    debugPrint('◼︎ DropRepository: updateDrop(${drop.id}) called');
    await _db.updateDrop(
      drop.title,
      drop.fromBucketId,
      drop.toBucketId,
      drop.dropCategoryId,
      drop.subscribedDropId,
      drop.parentDropId,
      drop.amount,
      drop.droppedOn,
      drop.notes,
      drop.id,
    );
  }

  Future<void> deleteDrop(int id) async {
    debugPrint('◼︎ DropRepository: deleteDrop($id) called');
    await _db.deleteDrop(id);
  }
}

extension on ReadDropsResult {
  Drop toDomain() => Drop(
    id: id,
    title: title,
    amount: amount,
    droppedOn: droppedOn,
    fromBucketId: fromBucketId,
    toBucketId: toBucketId,
    dropCategoryId: dropCategoryId,
    subscribedDropId: subscribedDropId,
    parentDropId: parentDropId,
    notes: notes,
    fromBucketName: fromBucketName,
    toBucketName: toBucketName,
    dropCategoryName: dropCategoryName,
    dropCategoryIcon: AppIcons.fromName(dropCategoryIcon),
    subscribedDropTitle: subscribedDropTitle,
    subscribedDropName: subscribedDropName,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension on Drop {
  DropsCompanion toCompanion() => DropsCompanion.insert(
    title: title,
    amount: amount,
    droppedOn: droppedOn,
    fromBucketId: Value(fromBucketId),
    toBucketId: Value(toBucketId),
    dropCategoryId: Value(dropCategoryId),
    subscribedDropId: Value(subscribedDropId),
    parentDropId: Value(parentDropId),
    notes: Value(notes),
  );
}
