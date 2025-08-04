import 'package:flutter/material.dart';
import '../services/socket_client.dart';

class VoterScreen extends StatefulWidget {
  const VoterScreen({super.key});

  @override
  State<VoterScreen> createState() => _VoterScreenState();
}

class _VoterScreenState extends State<VoterScreen> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _ipController = TextEditingController();

  final SocketClient socketClient = SocketClient();

  String? _opcionSeleccionada;
  bool _votoEnviado = false;
  bool _opcionesCargadas = false;

  List<String> _opciones = [];

  @override
  void initState() {
    super.initState();

    // Configura qué hacer cuando se reciben las opciones
    socketClient.onOpcionesRecibidas = (opciones) {
      setState(() {
        _opciones = opciones;
        _opcionesCargadas = true;
      });
    };
  }

  Future<void> _conectarYRecibirOpciones() async {
    final ip = _ipController.text.trim();
    if (ip.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introduce la IP del Master.')),
      );
      return;
    }

    final conectado = await socketClient.connect(ip);
    if (!conectado) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo conectar al servidor.')),
      );
    }
  }

  Future<void> _enviarVoto() async {
    final nombre = _nombreController.text.trim();
    final ip = _ipController.text.trim();

    if (nombre.isEmpty || _opcionSeleccionada == null || ip.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos.')),
      );
      return;
    }

    socketClient.sendVote(
      nombre: nombre,
      opcion: _opcionSeleccionada!,
    );

    setState(() {
      _votoEnviado = true;
    });

    socketClient.disconnect(); // desconecta después de votar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Votante')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _votoEnviado
            ? const Center(child: Text('✅ Gracias por tu voto'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Introduce tu nombre:'),
                  TextField(controller: _nombreController),
                  const SizedBox(height: 16),
                  const Text('IP del Master:'),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _ipController,
                          decoration: const InputDecoration(
                            hintText: 'Ej: 192.168.1.34',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _conectarYRecibirOpciones,
                        child: const Text('Conectar'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Selecciona tu opción:'),
                  if (!_opcionesCargadas)
                    const Text(
                      'Conéctate primero para ver las opciones.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ..._opciones.map((opcion) {
                    return RadioListTile(
                      title: Text(opcion),
                      value: opcion,
                      groupValue: _opcionSeleccionada,
                      onChanged: _opcionesCargadas
                          ? (value) {
                              setState(() {
                                _opcionSeleccionada = value as String?;
                              });
                            }
                          : null,
                    );
                  }).toList(),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _opcionesCargadas ? _enviarVoto : null,
                      child: const Text('Enviar voto'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
