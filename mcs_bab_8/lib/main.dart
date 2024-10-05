import 'package:flutter/material.dart';
import 'package:mcs_bab_8/providers/card_bridge_provider.dart';
import 'package:mcs_bab_8/providers/servo_controller_provider.dart';
import 'package:mcs_bab_8/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardBridgeProvider()),
        ChangeNotifierProvider(create: (context) => ServoControllerProvider(),),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
