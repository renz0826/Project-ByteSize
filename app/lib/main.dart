import '../../style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/login_page.dart';
import 'pages/main_layout.dart';
import 'providers/app_providers.dart'; // Import to access databaseProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create a container to access the database from your provider
  final container = ProviderContainer();
  final database = container.read(databaseProvider); 

  try { // Poke Query using the shared instance
    await database.customSelect('SELECT 1').getSingle();
    debugPrint("Database has been created");
  } catch (e) {
    debugPrint("Database creation failed: $e");
  }

  // Use UncontrolledProviderScope to pass the same container to your app
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const DentalApp(),
    )
  );
}

class DentalApp extends StatelessWidget {
  const DentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dental Management System',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const MainLayout(),
      },
    );
  }
}