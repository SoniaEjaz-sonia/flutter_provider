import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/counter.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer timer;

  @override
  void initState() {
    var provider = Provider.of<Counter>(context, listen: false);

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      provider.incrementCounter();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<Counter>(builder: (context, value, child) {
              return Text(
                '${value.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
          ],
        ),
      ),
    );
  }
}
