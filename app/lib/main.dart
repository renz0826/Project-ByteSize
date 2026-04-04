import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'db/database.dart';

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());

void main() { // test code lang ni, just to check if shit is working
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DentCity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Scaffold(
        body: Center(
          child: Text('DentCity is running!'),
        ),
      ),
    );
  }
}