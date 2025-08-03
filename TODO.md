# ✅ TODO – Votación Local App

Lista de tareas y funcionalidades planificadas para la app Flutter de votación en red local.

---

## 🧱 Estructura base del proyecto

- [x] Crear proyecto Flutter
- [x] Subir a repositorio de GitHub
- [x] Añadir `.gitignore` y `LICENSE`
- [x] Pantalla de selección de rol (Master / Votante)

---

## 🔧 Funcionalidades principales

- [x] Crear sesión de votación como Master
- [x] Introducir opciones de voto
- [ ] Servidor socket TCP para recibir conexiones de votantes
- [ ] Votante detecta y se conecta al Master en la red
- [x] Votante introduce su nombre y vota (una sola vez)
- [ ] Enviar confirmación de voto al Master
- [x] Mostrar en tiempo real:
  - [x] Número de votantes conectados
  - [x] Número de votos recibidos
- [ ] Mostrar resultados al finalizar la votación

---

## 🎨 Interfaz de usuario

- [x] UI para introducir opciones de voto (Master)
- [x] UI para votar (Votante)
- [ ] Indicadores de conexión/voto en progreso
- [ ] Mostrar resultados (gráfica o lista)

---

## 🧪 Técnicas y pruebas

- [ ] Pruebas con dos dispositivos reales en red local
- [ ] Compatibilidad con Android
- [ ] Compatibilidad con iOS (opcional)
- [ ] Manejo de errores en conexión
- [ ] Evitar votos duplicados

---

## 📝 Pendientes futuros

- [ ] Guardar resultados localmente
- [ ] Autodescubrimiento del Master (`multicast_dns`)
- [ ] Empaquetado para distribución (APK o IPA)
