import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Required for Windows DB

import 'db/database.dart';
import 'style/theme.dart';
import 'screens/main_layout.dart';

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());

void main() {
  // Required to prevent the Windows engine from crashing on startup
  WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;

  // test code lang ni, just to check if shit is working
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DentCity',
      theme: AppTheme.lightTheme,
      home: const MainLayoutScreen(),
    );
  }
}
