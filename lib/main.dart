import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/service/event_service.dart';
import 'presentation/providers/event_provider.dart';
import 'presentation/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(EventService()),
      child: MaterialApp(
        title: 'Local Event Finder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SplashScreen(),
          ),
        ),
      ),
    );
  }
}