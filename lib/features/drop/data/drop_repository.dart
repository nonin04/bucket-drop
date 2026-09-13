import 'package:bucket_drop/core/constants/app_icons.dart';
import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
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

// ① Future は async / await で書くのが標準
  Future<List<Drop>> getDrops() async {
    debugPrint('DropRepository: getDrops() called');
    final rows = await _db.getDrops().get();
    return rows.map((r) => r.toDomain()).toList();
  }

// ② Stream は .map() でパイプライン変換するのが標準
  Stream<List<Drop>> watchDrops() {
    return _db
        .getDrops()
        .watch()
        .map((rows) => rows.map((r) => r.toDomain()).toList());
  }

  Future<void> deleteDrop(int id) async {
    debugPrint('DropRepository: deleteDrop($id) called');
    await _db.deleteDrop(id);
  }
}

extension on GetDropsResult {
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
    subscribedDropNotes: subscribedDropNotes,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
