import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/hive_provider.dart';
import 'favorites_notifier.dart';
import 'favorites_state.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  final box = ref.watch(favoritesBoxProvider);
  return FavoritesNotifier(box);
});
