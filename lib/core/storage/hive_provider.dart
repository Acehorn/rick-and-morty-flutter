import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final favoritesBoxProvider = Provider<Box<int>>((ref) {
  return Hive.box<int>('favorites');
});
