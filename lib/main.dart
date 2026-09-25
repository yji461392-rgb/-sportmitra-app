import 'package:flutter/material.dart';

void main() {
  runApp(const SportMitraApp());
}

class SportMitraApp extends StatelessWidget {
  const SportMitraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SportMitra',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SportMitra'),
        ),
        body: const Center(
          child: Text(
            'SportMitra App',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}
