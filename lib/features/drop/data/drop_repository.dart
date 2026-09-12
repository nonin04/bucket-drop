import 'package:bucket_drop/core/constants/app_icons.dart';
import 'package:bucket_drop/core/database/app_database.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
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

  Future<List<Drop>> getDrops() async {
    final rows = await _db.getDrops().get();
    return rows.map((r) => r.toDomain()).toList();
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
