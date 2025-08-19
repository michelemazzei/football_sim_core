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

## ⚽

## 🔄 Recap: Struttura dei Giocatori

Hai già impostato una struttura modulare MVC per i giocatori, simile a quella della palla. Ecco cosa abbiamo:

### 🧩 `PlayerModel`

* `relativePosition`: posizione relativa al campo
* `velocity`: vettore di movimento
* `number`: numero di maglia
* `color`: colore del giocatore (maglia)
* `role`: ruolo (portiere, difensore, ecc.)
* `team`: identificativo della squadra

### 🧠 `PlayerController`

* Logica di movimento (manuale o AI)
* Gestione delle interazioni (possesso, passaggi, collisioni)
* Eventuale FSM (Finite State Machine) per comportamenti tattici

### 🎨 `PlayerComponent`

* Rendering del giocatore (cerchio, numero, colore)
* Posizionamento sul campo
* Eventuale animazione o trail visivo
* `sizeRatio` per adattamento dinamico
* 

## 🧠 Idee per l’Intelligenza Artificiale

Per rendere i giocatori “vivi”:

* FSM con stati tipo: `Idle`, `MoveToBall`, `Defend`, `Pass`, `Shoot`
* Decisioni basate su distanza dalla palla, ruolo, posizione degli avversari
* Sistema di priorità (es. difensore → copertura, attaccante → smarcamento)

## 🎯 Prossimi Step Possibili

Ti propongo 3 direzioni creative per continuare:

1. **Sistema di possesso palla**
   * Chi ha la palla?
   * Cambio di possesso su contatto
   * Visual feedback (es. glow attorno al giocatore)
2. **Sistema di passaggi**
   * Calcolo traiettoria
   * Precisione basata su ruolo/statistiche
   * Intercettazioni da parte degli avversari
3. **Mini-debug HUD**
   * Visualizza velocità, direzione, stato AI
   * Utile per test e bilanciamento

Se vuoi, domani possiamo iniziare a implementare il primo comportamento AI o fare un test visivo con 2 giocatori che si muovono verso la palla. Oppure vuoi partire dal sistema di possesso? Dimmi tu, coach. 😄

## 🧱 Refactoring ECS: Cosa abbiamo fatto

### ✅ 1. **PlayerComponent**

* Rifattorizzato per usare `Entity` e `PlayerController` ECS-based
* Elimina `PlayerModel`, usa componenti come `PlayerNumberComponent`, `PlayerColorComponent`
* Mantiene il rendering del cerchio giocatore con numero e colore

### ✅ 2. **PlayerEntity**

* Nuova classe `PlayerEntity` che crea un'entità con:
  * Posizione iniziale
  * Numero e colore
  * Direzione, velocità, stato
  * Riferimento al `FootballGame`
* Pronto per essere usato nel campo e nei sistemi

### ✅ 3. **Team ECS**

* Rifattorizzato `Team` per usare `PlayerEntity` invece di `PlayerModel`
* Aggiunge componenti `RoleComponent` e `TeamComponent` a ogni giocatore
* Tiene una lista di `PlayerEntity` per ogni squadra

## 🧩 Componenti ECS creati o suggeriti

| Componente                 | Descrizione                               |
| -------------------------- | ----------------------------------------- |
| `PlayerNumberComponent`  | Numero maglia del giocatore               |
| `PlayerColorComponent`   | Colore del giocatore                      |
| `PositionComponent`      | Posizione sul campo                       |
| `VelocityComponent`      | Velocità attuale                         |
| `DirectionComponent`     | Direzione di movimento                    |
| `StateComponent`         | Stato (idle, running, passing, ecc.)      |
| `RoleComponent`          | Ruolo tattico (es. difensore, attaccante) |
| `TeamComponent`          | ID della squadra                          |
| `GameReferenceComponent` | Riferimento al `FootballGame`           |

## 🔜 Prossimi passi (quando torni)

* ✳️ Scrivere un `PlayerSystem` per aggiornare posizione e stato
* ✳️ Eventualmente creare una classe `Match` con due `Team`
* ✳️ Integrazione con `GameState` per gestire entità e componenti
* ✳️ Animazioni o logica di movimento (passaggi, tiri, ecc.)

Certo Michele! Ecco un recap ordinato di tutto quello che abbiamo fatto oggi, così domani puoi riprendere senza perdere il filo:

## 📦 Stato attuale del progetto

### ✅ Hai:

* Pulito e consolidato la cartella `lib/ai/fsm`
* Implementato correttamente la struttura base della FSM (`State<T>`, `StateMachine<T>`)
* Creato stati iniziali come `KickoffState`, `PlayState`, `GlobalMatchState`
* Completato il sistema di messaging (`Message`, `MessageDispatcher`) con supporto per delay

## 🔗 Integrazione FSM + ECS

### 🔧 Abbiamo progettato:

* Un componente ECS chiamato `FSMComponent<T>` che incapsula la FSM
* Un sistema ECS (`FSMSystem`) che aggiorna tutti i `FSMComponent` ad ogni frame
* Il collegamento tra entità ECS (es. `MatchEntity`) e la FSM tramite `FSMComponent<Match>`
* L’uso del `MessageDispatcher` per far comunicare entità ECS e far reagire gli stati

## 🚀 Prossimi passi (per domani)

1. **Implementare **`FSMComponent`** completo**→ con logica di update e accesso alla FSM
2. **Collegare **`FSMComponent`** alle entità ECS**→ es. `MatchEntity`, `PlayerEntity`, `BallEntity`
3. **Scrivere uno stato completo**→ es. `PlayState` con transizioni automatiche e reazioni ai messaggi
4. **Testare la FSM in azione**
   → simulare una sequenza di stati in una partita

## ✅ Stato attuale del sistema FSM

### 🔹 Classe base: `GameState<T>`

* Hai correttamente definito un’interfaccia astratta `GameState<T>` con i metodi:
  * `enter(T entity)`
  * `execute(T entity)`
  * `exit(T entity)`
  * `onMessage(T entity, Message message)`
* È generica e flessibile, adatta a qualsiasi tipo di entità (`Match`, `Player`, ecc.)

### 🔹 Gestore: `StateMachine<T>`

* La classe `StateMachine<T>` è ben implementata:
  * Tiene traccia dello stato corrente, precedente e globale
  * Gestisce transizioni (`changeState`) e messaggi (`handleMessage`)
  * È pronta per essere usata come componente ECS

### 🔹 Stati concreti

* Hai già creato:
  * `KickoffState`
  * `PlayState`
  * `GlobalMatchState`
* Ogni stato implementa `GameState<Match>` e ha una struttura coerente

### 🔹 Messaging

* Il sistema `MessageDispatcher` è completo e funziona bene con la FSM
* Supporta messaggi immediati e ritardati, con gestione centralizzata

## 🔧 

Assolutamente Michele! Ecco il tuo **recap personalizzato**🧠⚽
Così la prossima volta ripartiamo esattamente da dove hai lasciato.

## ✅ Stato attuale del progetto

* Hai **integrato ECS correttamente**nel tuo simulatore di calcio.
* Hai **eliminato i controller**e centralizzato la logica nei sistemi.
* La  **palla è visibile** , centrata e con dimensione dinamica grazie a `<span>PositionSystem</span>`e `<span>ResizeSystem</span>`.
* Hai già un **MovementSystem**funzionante.
* Hai un **BallTrailSystem**che aggiunge effetti visivi in base alla velocità.

## 🔜 Prossimi passi

### 1. 🧍‍♂️ Aggiungere i giocatori

* Creare `<span>PlayerComponent</span>`con `<span>teamId</span>`e `<span>playerId</span>`
* Creare `<span>PlayerEntity</span>`con:
  * `<span>EcsPositionComponent</span>`
  * `<span>VelocityComponent</span>`
  * `<span>SizeRatioComponent</span>`
  * `<span>RenderComponent</span>`con `<span>PlayerVisualComponent</span>`

### 2. 🧠 Iniziare la FSM

* Aggiungere `<span>FSMComponent<Player></span>`alle entità giocatore
* Definire stati come:
  * `<span>IdleState</span>`
  * `<span>MoveToBallState</span>`
  * `<span>KickState</span>`
* Scrivere `<span>PlayerFSMSystem</span>`che aggiorna lo stato corrente

## 🧩 Extra (facoltativi)

* `<span>PossessionComponent</span>`per sapere chi ha la palla
* `<span>CommandComponent</span>`per passaggi e tiri
* `<span>DebugComponent</span>`per visualizzare stato e velocità

## 📌 Prossima volta

Quando torni, possiamo partire da:

* ✨ `<span>createPlayerEntity()</span>`factory
* 🧱 `<span>PlayerComponent</span>`
* 🔁 `<span>FSMComponent<Player></span>`e primo stato

Ti basta dirmi “riprendiamo da FSM” e ti preparo tutto. Buona pausa, e complimenti per il lavoro impeccabile! 💪
