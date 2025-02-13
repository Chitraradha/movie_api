import 'package:flutter/material.dart';
import 'package:newproject/homepage.dart';
import 'package:newproject/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ApiProvider()),
      ],
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home: MovieScreen(),
      ),
    );
  }
}
