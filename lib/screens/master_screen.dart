import 'package:flutter/material.dart';
import '../controllers/vote_controller.dart';
import '../services/socket_server.dart';


class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  final List<String> _options = [];
  final TextEditingController _optionController = TextEditingController();
  final SocketServer socketServer = SocketServer();
  bool _votingStarted = false;

  final voteController = VoteController();

  void _addOption() {
    final text = _optionController.text.trim();
    if (text.isNotEmpty && !_options.contains(text)) {
      setState(() {
        _options.add(text);
        _optionController.clear();
      });
    }
  }

  Future<void> _startVoting() async {
  if (_options.length < 2) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Debes añadir al menos 2 opciones.')),
    );
    return;
  }

  await socketServer.start();
  voteController.setOptions(_options);
  setState(() {
    _votingStarted = true;
  });
}


  void _resetVoting() {
    voteController.reset();
    setState(() {
      _options.clear();
      _votingStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final votesReceived = voteController.votesReceived;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master - Crear votación'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetVoting,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _votingStarted
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Votación en curso',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text('Votos recibidos: $votesReceived'),
                  const Divider(),
                  const Text(
                    'Opciones:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...voteController.options.map(
                    (opt) => ListTile(
                      title: Text(opt.label),
                      trailing: Text('${opt.votes} votos'),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  const Text(
                    'Introduce las opciones a votar:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _optionController,
                          decoration: const InputDecoration(
                            hintText: 'Nueva opción',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _addOption,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ..._options.map((opt) => ListTile(
                        title: Text(opt),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _options.remove(opt);
                            });
                          },
                        ),
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Iniciar votación'),
                    onPressed: _startVoting,
                  ),
                ],
              ),
      ),
    );
  }
}
