import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      title: 'Yes No App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yes No App'),
          centerTitle: true,
        ),
        body: Center(
          child: FilledButton(
            onPressed: () {},
            child: const Text('ClicKMe'),
          ),
        ),
      ),
    );
  }
}
