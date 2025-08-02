# 🗳️ Votación Local – Flutter App

Aplicación móvil para realizar votaciones secretas en tiempo real, diseñada para funcionar sin conexión a Internet. Todos los dispositivos deben estar conectados a la **misma red Wi-Fi**, lo que garantiza privacidad, sencillez y control total del proceso.

## 🔍 ¿Cómo funciona?

- **Un único programa, dos roles posibles**:
  - 🧑‍🏫 **Master**: crea la votación, define las opciones y gestiona la sesión.
  - 🙋‍♂️ **Votante**: introduce su nombre y vota por una de las opciones disponibles.

- Los votos son **secretos**: no se asocian a nombres públicamente.
- Se muestra en tiempo real cuántos participantes hay y cuántos han votado.
- Todo funciona de forma **local**, usando sockets entre dispositivos en la misma red.

## ✨ Características principales

- Conexión directa entre dispositivos vía Wi-Fi local (sin servidores externos).
- Votación anónima, con seguimiento de participantes y votos emitidos.
- App unificada: no necesita una versión separada para organizador y votantes.
- Basada en **Flutter**, ideal para Android y iOS.

## 🚧 Estado del proyecto

> 🔧 En desarrollo — actualmente implementando comunicación en red local mediante sockets.

## 🧰 Tecnologías utilizadas

- Flutter + Dart
- Sockets TCP (`dart:io`)
- `provider` para gestión de estado
- `multicast_dns` para descubrir al master en red local (futuro)

