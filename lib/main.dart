import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'screens/menu_screen.dart';
import 'config/theme.dart';

void main() {
  runApp(const SmashtasticCricket());
}

class SmashtasticCricket extends StatelessWidget {
  const SmashtasticCricket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smashtastic Cricket',
      theme: AppTheme.lightTheme,
      home: const MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
} 