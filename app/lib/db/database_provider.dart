import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';

final dbProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});