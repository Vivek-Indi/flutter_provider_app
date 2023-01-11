import 'package:flutter/material.dart';
import 'package:flutter_provider_app/Screens/home.dart';
import 'package:flutter_provider_app/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (context) => TodoProvider(), child: const Home()),
    );
  }
}
