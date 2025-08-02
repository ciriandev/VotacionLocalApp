import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona tu rol')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.admin_panel_settings),
              label: const Text('Entrar como Master'),
              onPressed: () => Navigator.pushNamed(context, '/master'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.how_to_vote),
              label: const Text('Entrar como Votante'),
              onPressed: () => Navigator.pushNamed(context, '/voter'),
            ),
          ],
        ),
      ),
    );
  }
}
