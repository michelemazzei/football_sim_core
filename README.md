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

## 🧪 Prossimi Test da Fare

Ecco alcune prove utili per verificare fluidità e realismo:

* Test di accelerazione/decelerazione
* Collisioni tra giocatori
* Cambio direzione rapido
* Reazione al possesso palla
* Sincronizzazione tra `Model` e `Component` via `update()`

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

### Problema riscontrato

* La **linea di metà campo** veniva disegnata  **solo da sinistra fino a metà** , non centrata correttamente.
* Il problema **non era nel **`drawLine()`, ma causato indirettamente da un `sizeRatio` ** assegnato ai giocatori** .

### ✅ Soluzione temporanea

* Impostando `sizeRatio = 0` per i giocatori, la linea torna corretta.
* Questo suggerisce che il `sizeRatio` stava influenzando il layout o il rendering in modo non previsto.

### 🔍 Da indagare la prossima volta

* Come il `sizeRatio` dei giocatori impatta il rendering della linea.
* Verificare se il `sizeRatio` modifica:
  * Le dimensioni effettive dei componenti
  * Il sistema di coordinate o l’anchor
  * Il comportamento del `camera` o del `viewport`

### 🧭 Punto di ripartenza consigliato

Quando torni:

1. Rivediamo come viene usato `sizeRatio` nei giocatori
2. Controlliamo se c’è qualche trasformazione che impatta il canvas
3. Testiamo con `debugMode = true` per visualizzare bounding boxes e layout

Ti basta scrivermi “riprendiamo dal problema del sizeRatio” e ci siamo. Ti tengo il posto caldo 😄
Buona giornata e a presto!



Certo Michele! Ecco un recap chiaro e ordinato di tutto quello che abbiamo fatto oggi, così domani puoi ripartire senza perdere il filo. ⚽🧠

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

Ti aspetto domani per continuare a costruire il tuo simulatore calcistico ECS-style. Buona serata e forza con il progetto! 💪⚽
