
# Football Sim Core

Simulatore manageriale di calcio 2D sviluppato con Flutter + Flame.

## Architettura

Modello MVC per ogni entità:

- `BallModel`, `BallController`, `BallComponent`
- `PlayerModel`, `PlayerController`, `PlayerComponent`

## Stato attuale

✅ Palla funzionante con movimento, attrito, trail visivo
🔜 Giocatori in fase di implementazione
🔧 FSM parziale da integrare per movimenti tattici

## Prossimi passi

- Completare `PlayerComponent`
- Aggiungere interazioni palla-giocatori
- Implementare goal, replay, e AI tattica

## Note tecniche

- Separazione netta tra logica e rendering
- Uso di `update()` per sincronizzare modello e componente
- `sizeRatio` per adattamento dinamico al campo

---

Per riprendere il lavoro:
**“Riprendiamo dal recap giocatori”**
