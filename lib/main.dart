import 'package:flutter/material.dart';
import 'package:flutter_provider/counter.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      builder: (BuildContext? context, Widget? widget) {
        return MaterialApp(
          title: 'Counter App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Timer with Provider'),
        );
      },
    );
  }
}
