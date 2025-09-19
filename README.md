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

🧩 Football Sim Core – Recap Architettura

Simulatore manageriale 2D in Flutter + Flame, con integrazione  **ECS** , **FSM** e  **messaggistica** .

🔗 Integrazione FSM + ECS

* `FSMComponent<t></t>`: incapsula la FSM all’interno dell’entità ECS
* `FSMSystem`: aggiorna tutti i `FSMComponent` ogni frame
* `MatchEntity`: collega la FSM (`MatchFSM`) tramite `FSMComponent<match></match>`
* `MessageDispatcher`: gestisce la comunicazione tra entità ECS e reazioni degli stati

🧠 Architettura Messaggi

* **Eventi via messaggi** , non più `MatchEventComponent`
* `EcsEntity` implementa `MessageReceiver` (e potenzialmente `MessageSender`)
* `Messages` (con `freezed`): centro unico per comandi/eventi (`matchStarted`, `goalScored`, ecc.)
* I messaggi sono gestiti prima dallo  **stato corrente** , poi da quello **globale**
* Chi emette un messaggio  **non è obbligato a gestirlo** : può delegare

🏗️ Struttura attuale

* Architettura **MVC** per entità (`Ball`, `Player`)
* Separazione tra **Controller** (logica) e **Component** (rendering)
* Transizione verso  **ECS + FSM** : logica centralizzata nei sistemi

🔄 FSM + ECS

* FSM generica con `GameState<t></t>` e `StateMachine<t></t>`
* Stati già creati: `KickoffState`, `PlayState`, `GlobalMatchState`
* `MessageDispatcher` con supporto a **delay**
* `EcsEntity` riceve messaggi (`MessageReceiver`) e può essere esteso come `MessageSender`
* `Messages` (freezed) per tutti gli eventi e comandi

✅ Stato attuale

* `MatchEntity` inizializza FSM con `KickoffState`
* `KickoffState` emette evento dopo 3s simulati
* Messaggi gestiti in ordine: stato corrente → stato globale
* Palla visibile e dinamica con `PositionSystem`, `ResizeSystem`, `BallTrailSystem`
* `MovementSystem` funzionante

🔜 Prossimi step

1. Creare `PlayerEntity` con componenti ECS (`Position`, `Velocity`, `Render`, ecc.)
2. Aggiungere `FSMComponent<player></player>` con stati tipo `Idle`, `MoveToBall`, `Kick`
3. Scrivere `PlayerFSMSystem` per aggiornare gli stati
4. (Facoltativo) Aggiungere `PossessionComponent`, `CommandComponent`, `DebugComponent`
5. (Facoltativo) Aggiungere `PossessionComponent`, `CommandComponent`, `DebugComponent`

 **Recap BallInteractSystem & Kickoff Issue**

✅ BallInteractSystem

* Sistema che rileva il contatto tra palla e giocatore.
* Se la distanza tra palla e giocatore è sotto `touchThreshold`, aggiorna il possesso palla nel componente dell’arbitro (`BallPossessionComponent`).
* Usa `removeComponent()` seguito da `addComponent()` per aggiornare il possesso.
* Logga l’evento con `log()` per debug.

🔜 Da verificare la prossima volta

* Il sistema che gestisce il kickoff: viene attivato correttamente?
* Il comportamento del giocatore: riceve un target di movimento verso la palla?
* Il sistema di steering: interpreta correttamente il target?
* Eventuali conflitti con altri sistemi (es. blocchi, priorità, condizioni non soddisfatte).

Quando torni, possiamo partire da lì e fare un debug mirato. Ti basta incollare questo recap e siamo subito operativi ⚙️

Buona serata e a presto!

Certo Michele, ecco il recap completo del tuo sistema, così domani possiamo ripartire con chiarezza 💼⚽

🧠 **Stato attuale del sistema**

✅ Hai implementato:

* `PlayerFsmSystem` e `RefereeFsmSystem` separati ✅
* `BallFsmSystem` con `BallIntentComponent` ✅
* `ActionQueueComponent` per gestire una sequenza di messaggi ✅
* `MoveToBallState` e `PrepareKickState` per il giocatore ✅
* `RollingState` per la palla con direzione e forza ✅


🔜 Priorità suggerita per la prossima volta

**1. Configurazione del tempo di gioco**

– Creiamo un `MatchConfigComponent` con durata partita, intervallo, extra time, ecc.

– Collegamento alla FSM del match per gestire transizioni temporali.

**2. Ricezione intelligente della palla**

– Aggiungiamo un `ReceiveBallState` per il giocatore.

– Possibilità di anticipare, rallentare, o fare controllo orientato.

**3. Sistema di replay o logging avanzato**

– Salviamo eventi chiave (passaggi, tiri, gol) per analisi o replay.

– Utile anche per debugging e telecronaca futura.

**4. UI di debug in overlay**

– Visualizzazione di stati, velocità, possesso, ecc.

– Ti aiuta a monitorare il comportamento in tempo reale.

Ti basta scegliere uno di questi domani e lo sviluppiamo insieme.

Buon riposo, mister Mazzei. Il campo ti aspetta ⚽

link dei sorgenti [michelemazzei/football_sim_core](https://github.com/michelemazzei/football_sim_core)
