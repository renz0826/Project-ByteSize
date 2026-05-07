import 'package:flutter/material.dart';
import 'style/theme.dart'; 
// Fixed path to point to your actual file location
import 'widgets/calendar.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteSize Calendar Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, 
      home: const CalendarPreviewPage(),
    );
  }
}

class CalendarPreviewPage extends StatefulWidget {
  const CalendarPreviewPage({super.key});

  @override
  State<CalendarPreviewPage> createState() => _CalendarPreviewPageState();
}

class _CalendarPreviewPageState extends State<CalendarPreviewPage> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Calendar Widget",
                style: AppTheme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              // Fixed the name from 'calen' to 'AppCalendar'
              AppCalendar(
                selectedDay: _selectedDay,
                onDaySelected: (day) {
                  setState(() {
                    _selectedDay = day;
                  });
                  print("User selected: $day");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}