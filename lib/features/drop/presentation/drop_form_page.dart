import 'package:bucket_drop/features/bucket/data/bucket_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropFormPage extends ConsumerWidget {
  const DropFormPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bucketsAsync = ref.watch(bucketListProvider);
    // final dropCategoriesAsync = ref.watch(dropCategoryListProvider);

    return const Placeholder();
  }
}
