import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize2/Provider/auth_provider.dart';
import 'package:quize2/Provider/wether_provider.dart';
import 'package:quize2/Screens/homepage.dart';
import 'package:quize2/Screens/signup.dart';

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
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => WetherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: Signup(),
      ),
    );
  }
}
