# 📦 CHANGELOG

Este archivo documenta los cambios importantes realizados en la app **Votación Local**. Sigue el formato [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

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

---

### Mejoras internas
- Archivos `.gitignore` y `LICENSE` añadidos
- Separación de pantallas en archivos organizados en `/lib/screens`
- Estructura de modelos en `/lib/models`

---

### Notas
- Esta versión es puramente local y sin conexión de red
- No se ha implementado lógica real de votación ni sockets TCP
