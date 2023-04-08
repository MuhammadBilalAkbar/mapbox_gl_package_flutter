import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Mapbox GL Package Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          textTheme: const TextTheme(
            labelLarge: TextStyle(fontSize: 30),
            titleMedium: TextStyle(fontSize: 30),
            bodySmall: TextStyle(fontSize: 30),
            bodyLarge: TextStyle(fontSize: 30),
            bodyMedium: TextStyle(fontSize: 25),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        home: const HomePage(),
      );
}
