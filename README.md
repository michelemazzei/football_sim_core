# Football Sim Core

Simulatore manageriale di calcio 2D sviluppato con Flutter + Flame.

## 🧠 Architettura

Struttura modulare basata su pattern MVC per ogni entità del gioco:

- `BallModel`, `BallController`, `BallComponent`
- `PlayerModel`, `PlayerController`, `PlayerComponent`

Separazione netta tra logica e rendering:

- I modelli (`Model`) contengono posizione, velocità, e stato
- I controller gestiscono la logica di movimento e interazione
- I componenti (`Component`) si occupano del rendering su schermo

## ⚽ Stato attuale

### ✅ Palla

- `BallModel` con `relativePosition` e `velocity`
- `BallController` per la logica di movimento
- `BallComponent` per il rendering e il posizionamento
- Gestione attrito, velocità massima, collisione con i bordi
- Trail visivo quando la palla è veloce
- Resize dinamico e posizione relativa al campo

### 🔜 Giocatori

Struttura da replicare per i giocatori:

- `PlayerModel` con `relativePosition`, `velocity`, `number`, `color`, `role`, `team`
- `PlayerController` per movimenti e logiche di gioco
- `PlayerComponent` per il rendering e il posizionamento
- `sizeRatio` per scalare i giocatori
- Test della velocità per verificare fluidità e realismo

## 🚀 Prossime funzionalità

- 🧠 Intelligenza artificiale: FSM per movimenti tattici
- 🧲 Gestione possesso palla
- 🧮 Sistema di passaggi e decisioni
- 🥅 Goal detection e replay
- 📊 Debug tools: visualizzazione velocità, direzione, collisioni

## 🛠️ Note tecniche

- Uso di `update()` per sincronizzare modello e componente
- `sizeRatio` per adattamento dinamico al campo
- Separazione tra logica e grafica per facilitare test e manutenzione
- Allineamento alle API Flame più recenti (`PositionComponent`, `Sprite`, ecc.)

---

Per riprendere il lavoro:
**“Riprendiamo dal recap giocatori”**
