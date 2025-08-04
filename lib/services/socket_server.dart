import 'dart:convert';
import 'dart:io';

import '../controllers/vote_controller.dart';

class SocketServer {
  ServerSocket? _server;
  final List<Socket> _clients = [];

  final VoteController voteController = VoteController();

  Future<void> start({int port = 4040}) async {
    _server = await ServerSocket.bind(InternetAddress.anyIPv4, port);
    print('✅ Servidor escuchando en puerto $port');

    _server?.listen((Socket client) {
      _clients.add(client);
      print('🔌 Cliente conectado: ${client.remoteAddress.address}');
      _handleClient(client);
    });
  }

  void _handleClient(Socket client) {    
    // Enviar opciones al conectarse
  final opciones = voteController.options;
  final message = json.encode({
    'tipo': 'opciones',
    'opciones': opciones,
  });
  client.write('$message\n'); // envía con salto de línea

  // Ya existente: escuchar al cliente
    client.listen(
      (data) {
        final message = utf8.decode(data).trim();
        print('📩 Mensaje recibido: $message');

        try {
          final decoded = json.decode(message);
          final nombre = decoded['nombre'] as String;
          final opcion = decoded['opcion'] as String;

          voteController.vote(opcion);

          // Puedes hacer un broadcast opcional aquí:
          // _broadcastUpdate();
        } catch (e) {
          print('⚠️ Error al procesar mensaje: $e');
        }
      },
      onDone: () {
        print('❌ Cliente desconectado');
        _clients.remove(client);
        client.close();
      },
      onError: (e) {
        print('⚠️ Error de cliente: $e');
        _clients.remove(client);
        client.close();
      },
    );
  }

  void dispose() {
    for (var client in _clients) {
      client.destroy();
    }
    _server?.close();
  }
}
