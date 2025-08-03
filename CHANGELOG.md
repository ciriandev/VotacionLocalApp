# 📦 CHANGELOG

Este archivo documenta los cambios importantes realizados en la app **Votación Local**. Sigue el formato [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [0.2.0] - 2025-08-03

### Añadido
- Simulación de flujo completo de votación entre Master y Votante.
- Pantalla del Master ahora muestra número de votos recibidos y votos por opción.
- Votante solo puede votar una vez.
- Se puede probar todo el flujo usando dos emuladores de Android.

### Modificado
- Estructura de navegación interna para mantener el estado mientras se navega entre pantallas.

### Nota
Este es el último paso antes de comenzar con la implementación de red local real (sockets TCP).


---

## [0.1.0] - 2025-08-02

### Añadido
- Estructura base del proyecto Flutter creada
- Repositorio GitHub inicializado y configurado
- Pantalla de selección de rol (Master / Votante)
- Pantalla para el Master con:
  - Introducción de opciones de voto
  - Control básico del inicio de la votación
- Pantalla para el Votante con:
  - Entrada del nombre
  - Selección de opción y envío del voto (simulado)
  - Lógica para evitar voto doble
- Modelo de datos `VotingOption` para representar opciones de votación
- Navegación entre pantallas con rutas nombradas

### Mejoras internas
- Archivos `.gitignore` y `LICENSE` añadidos
- Separación de pantallas en archivos organizados en `/lib/screens`
- Estructura de modelos en `/lib/models`

### Notas
- Esta versión es puramente local y sin conexión de red
- No se ha implementado lógica real de votación ni sockets TCP
