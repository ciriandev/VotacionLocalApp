import 'package:flutter/material.dart';
import '../controllers/vote_controller.dart';

class VoterScreen extends StatefulWidget {
  const VoterScreen({super.key});

  @override
  State<VoterScreen> createState() => _VoterScreenState();
}

class _VoterScreenState extends State<VoterScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _selectedOption;
  bool _hasVoted = false;

  final voteController = VoteController();

  void _sendVote() {
    final name = _nameController.text.trim();
    if (name.isEmpty || _selectedOption == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introduce tu nombre y selecciona una opción.')),
      );
      return;
    }

    voteController.vote(_selectedOption!);

    setState(() {
      _hasVoted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('¡Gracias por votar, $name!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = voteController.options;

    return Scaffold(
      appBar: AppBar(title: const Text('Votante')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _hasVoted
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.how_to_vote, size: 60, color: Colors.green),
                    SizedBox(height: 20),
                    Text('Gracias por tu voto.', style: TextStyle(fontSize: 18)),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tu nombre:', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Introduce tu nombre',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Selecciona una opción:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ...options.map(
                    (option) => RadioListTile<String>(
                      title: Text(option.label),
                      value: option.label,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.send),
                      label: const Text('Enviar voto'),
                      onPressed: _sendVote,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
