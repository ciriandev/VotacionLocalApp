# ✅ TODO – Votación Local App

Lista de tareas y funcionalidades planificadas para la app Flutter de votación en red local.

---

## 🧱 Estructura base del proyecto

- [x] Crear proyecto Flutter
- [x] Subir a repositorio de GitHub
- [x] Añadir `.gitignore` y `LICENSE`
- [ ] Pantalla de selección de rol (Master / Votante)

---

## 🔧 Funcionalidades principales

- [ ] Crear sesión de votación como Master
- [ ] Introducir opciones de voto
- [ ] Servidor socket TCP para recibir conexiones de votantes
- [ ] Votante detecta y se conecta al Master en la red
- [ ] Votante introduce su nombre y vota (una sola vez)
- [ ] Enviar confirmación de voto al Master
- [ ] Mostrar en tiempo real:
  - [ ] Número de votantes conectados
  - [ ] Número de votos recibidos
- [ ] Mostrar resultados al finalizar la votación

---

## 🎨 Interfaz de usuario

- [ ] UI para introducir opciones de voto (Master)
- [ ] UI para votar (Votante)
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
