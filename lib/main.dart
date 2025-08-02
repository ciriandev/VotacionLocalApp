import 'package:flutter/material.dart';
import 'screens/role_selection_screen.dart';
import 'screens/master_screen.dart';
import 'screens/voter_screen.dart';

void main() {
  runApp(const VotacionApp());
}

class VotacionApp extends StatelessWidget {
  const VotacionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votación Local',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RoleSelectionScreen(),
        '/master': (context) => const MasterScreen(),
        '/voter': (context) => const VoterScreen(),
      },
    );
  }
}
