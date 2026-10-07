import 'package:flutter/material.dart';
import 'view/login_view.dart';

void main() => runApp(const PortalApp());

class PortalApp extends StatelessWidget {
  const PortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Integrado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B4F9C)),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}