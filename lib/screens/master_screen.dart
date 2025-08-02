import 'package:flutter/material.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  final TextEditingController _optionController = TextEditingController();
  final List<String> _options = [];
  final List<String> _participants = []; // Más adelante vendrán por sockets
  bool _votingStarted = false;

  void _addOption() {
    final text = _optionController.text.trim();
    if (text.isNotEmpty && !_options.contains(text)) {
      setState(() {
        _options.add(text);
        _optionController.clear();
      });
    }
  }

  void _startVoting() {
    if (_options.length >= 2) {
      setState(() {
        _votingStarted = true;
      });
      // Aquí luego llamaremos a la lógica de red
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agrega al menos dos opciones para votar.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master - Configura tu votación')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!_votingStarted) ...[
              const Text('Opciones de votación:', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _optionController,
                      decoration: const InputDecoration(labelText: 'Nueva opción'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addOption,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_options[index]),
                    );
                  },
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow),
                label: const Text('Iniciar votación'),
                onPressed: _startVoting,
              ),
            ] else ...[
              const Text('Votación en curso...', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              const Text('Participantes conectados:', style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                  itemCount: _participants.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(_participants[index]),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
