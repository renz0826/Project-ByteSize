import '../../style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/login_page.dart';
import 'pages/main_layout.dart';
import 'db/database.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase(); // call database from the db file

  try { // Poke Query, this is used to create the db file on your documents tab (gin ai ko lang ni for testing)
    await database.customSelect('SELECT 1').getSingle();
    debugPrint("Database has been created");
  } catch (e) {
    debugPrint("Database creation failed: $e");
  }

  // 4. Start the app
  runApp(
    const ProviderScope(
      child: DentalApp(),
    ),
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
