import 'dart:convert';
import 'dart:io';

class SocketClient {
  Socket? _socket;

  Function(List<String>)? onOpcionesRecibidas;

  Future<bool> connect(String ip, {int port = 4040}) async {
  try {
    _socket = await Socket.connect(ip, port);
    print('✅ Conectado al servidor: $ip:$port');

    _socket!.listen((data) {
      final message = utf8.decode(data).trim();
      final decoded = json.decode(message);

      if (decoded['tipo'] == 'opciones') {
        final opciones = List<String>.from(decoded['opciones']);
        if (onOpcionesRecibidas != null) {
          onOpcionesRecibidas!(opciones);
        }
      }
    });

    return true;
  } catch (e) {
    print('❌ No se pudo conectar al servidor: $e');
    return false;
  }
}

  void sendVote({required String nombre, required String opcion}) {
    if (_socket != null) {
      final voteData = json.encode({
        'nombre': nombre,
        'opcion': opcion,
      });
      _socket!.write(voteData + '\n'); // Asegura fin de línea
      print('📤 Voto enviado: $voteData');
    } else {
      print('⚠️ No estás conectado al servidor');
    }
  }

  void disconnect() {
    _socket?.destroy();
    print('🔌 Desconectado del servidor');
  }
}
