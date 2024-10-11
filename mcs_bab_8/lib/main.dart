import 'package:flutter/material.dart';
import 'package:mcs_bab_8/providers/card_bridge_provider.dart';
import 'package:mcs_bab_8/providers/servo_controller_provider.dart';
import 'package:mcs_bab_8/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardBridgeProvider()),
        ChangeNotifierProvider(create: (context) => ServoControllerProvider(),),
      ],
      child: MaterialApp(
        title: 'mcs bab 8',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
