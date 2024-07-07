import 'package:calculator_app/auth/auth.dart';
import 'package:calculator_app/auth/login_or_register.dart';
import 'package:calculator_app/broadcast_receivers/battery_service.dart';
import 'package:calculator_app/broadcast_receivers/connectivity_service.dart';
import 'package:calculator_app/firebase_options.dart';
import 'package:calculator_app/screens/home_screen.dart';
import 'package:calculator_app/screens/login_screen.dart';
import 'package:calculator_app/screens/profile_screen.dart';
import 'package:calculator_app/screens/signup_screen.dart';
import 'package:calculator_app/screens/users_screen.dart';
import 'package:calculator_app/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider
    (create: (context)=>ThemeProvider(),
      child: const CalculatorApp()));
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivityService = ConnectivityService();
    connectivityService.initialize(context);

    final batteryService = BatteryService();
    batteryService.initialize(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme:Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/login_or_register':(context)=> const LoginOrRegister(),
        '/home_screen':(context)=> const HomeScreen(),
        '/profile_screen':(context)=> ProfileScreen(),
        '/users_screen':(context)=> const UsersScreen()
      },
    );
  }
}