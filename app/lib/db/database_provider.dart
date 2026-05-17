import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';
import '../providers/app_providers.dart';

final dbProvider = Provider((ref) => ref.watch(databaseProvider)); // gets the active database via riverpod