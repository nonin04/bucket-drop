import 'package:bucket_drop/features/drop/data/drop_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drop_index_controller.g.dart';

@riverpod
class DropIndexController extends _$DropIndexController {
  @override
  Stream<List<Drop>> build() {
    return ref.watch(dropRepositoryProvider).watchDrops();
  }

  Future<List<Drop>> getDrops() async {
    return ref.read(dropRepositoryProvider).getDrops();
  }

  Future<void> deleteDrop(int id) async {
    await ref.read(dropRepositoryProvider).deleteDrop(id);
  }
}
