# Football Sim Core

Simulatore manageriale di calcio 2D sviluppato con Flutter + Flame.

## 🔗 Integrazione FSM + ECS

### 🔧 Abbiamo progettato:

* Un componente ECS chiamato `FSMComponent<T>` che incapsula la FSM
* Un sistema ECS (`FSMSystem`) che aggiorna tutti i `FSMComponent` ad ogni frame
* Il collegamento tra entità ECS (es. `MatchEntity`) e la FSM tramite `FSMComponent<Match>`
* L’uso del `MessageDispatcher` per far comunicare entità ECS e far reagire gli stati

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

ok, riprendiamo domani, mi fai un breve recap cosi te lo rispedisco domani ?

Certo Michele, ecco un recap sintetico ma completo così domani puoi ripartire al volo 🚀

### 🧠 Architettura ECS + FSM + Messaggi

* **MatchEntity**inizializza i componenti ECS e la FSM (`<span>MatchFSM</span>`) con stato iniziale `<span>KickoffState</span>`.
* **KickoffState**emette un evento dopo 3 secondi di tempo simulato.
* Abbiamo deciso di **non usare più **`<span>MatchEventComponent</span>`, ma di passare agli  **eventi via messaggi** .
* Il sistema di messaggistica è già presente (`<span>MessageDispatcher</span>`) e può essere usato per inviare comandi e segnali.
* `<span>EcsEntity</span>`ora implementa `<span>MessageReceiver</span>`, e può ricevere messaggi direttamente.
* Abbiamo discusso di farlo implementare anche `<span>MessageSender</span>`per unificare tutto.
* La classe `<span>Messages</span>`(con `<span>freezed</span>`) è il nuovo centro per tutti i comandi e segnali, sia per agenti che per eventi globali.
* Puoi estenderla con eventi come `<span>matchStarted</span>`, `<span>goalScored</span>`, `<span>matchEnded</span>`, ecc.
* I messaggi vengono gestiti prima dallo  **stato corrente** , poi dallo **stato globale**— e questo è corretto se fatto con criterio.
* Abbiamo chiarito che  **chi emette un messaggio non deve per forza gestirlo** : può delegare.

🧠 Architettura attuale

* Struttura **MVC** per ogni entità (`Ball`, `Player`)
* Separazione netta tra **logica (Controller)** e **rendering (Component)**
* Passaggio a  **ECS + FSM** : logica centralizzata nei sistemi

🔄 FSM + ECS

* FSM generica con `GameState<t></t>` e `StateMachine<t></t>`
* Stati già creati: `KickoffState`, `PlayState`, `GlobalMatchState`
* Sistema di messaggi (`MessageDispatcher`) con supporto a delay
* `EcsEntity` ora riceve messaggi (`MessageReceiver`) e può essere esteso come `MessageSender`
* Classe `Messages` (con `freezed`) per tutti gli eventi e comandi

✅ Stato attuale

* `MatchEntity` inizializza FSM con `KickoffState`
* `KickoffState` emette evento dopo 3s simulati
* Messaggi gestiti prima dallo stato corrente, poi da quello globale
* Palla visibile e dinamica con `PositionSystem`, `ResizeSystem`, `BallTrailSystem`
* `MovementSystem` funzionante

🔜 Prossimi step

1. Creare `PlayerEntity` con componenti ECS (`Position`, `Velocity`, `Render`, ecc.)
2. Aggiungere `FSMComponent<player></player>` con stati tipo `Idle`, `MoveToBall`, `Kick`
3. Scrivere `PlayerFSMSystem` per aggiornare gli stati
4. (Facoltativo) Aggiungere `PossessionComponent`, `CommandComponent`, `DebugComponent`
