import 'package:flutter/material.dart';
import 'package:smart_garden_app/screens/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aepod App',
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
