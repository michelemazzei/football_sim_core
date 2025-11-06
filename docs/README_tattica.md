# 🧠 Football Sim Core — Strategia Tattica

Simulatore manageriale 2D sviluppato con Flutter + Flame.
Architettura ECS + FSM con routing dei messaggi e sistema decisionale tattico.

## ✅ Stato attuale

- ECS con entità, componenti e sistemi separati
- FSM modulare per ogni giocatore (`FsmComponent`, `PlayerFsmSystem`)
- Messaggi gestiti via `PlayerActionHandlerSystem` e `onMessage()` nei singoli stati
- Cooldown e ActionQueue rifattorizzati
- `BallBoundarySystem` attivo
- Visualizzazione griglia campo con overlay e coordinate
- Ottimizzazione FSM con `forceToChange`, confronto semantico e log dettagliati

## 🧩 Tattiche implementabili

| Modello         | Descrizione                                                   |
| --------------- | ------------------------------------------------------------- |
| ZoneTactic      | Ogni giocatore ha una zona ideale per fase e ruolo            |
| RoleTactic      | Comportamenti specifici per ruolo (es. regista si abbassa)    |
| PhaseTactic     | Comportamento globale per fase (BuildUp, Transition, Defense) |
| BallTactic      | Reazioni basate sulla posizione della palla                   |
| OpponentTactic  | Reazioni basate sul comportamento avversario                  |
| DynamicTactic   | Evoluzione tattica nel tempo (es. cambio modulo al 60')       |
| SetPieceTactic  | Comportamenti per corner, punizioni, rimesse                  |
| FormationTactic | Modulo base con ruoli e zone assegnate                        |

## 🔜 Roadmap tattica

1. Rifinire `ZoneTacticSystem` con `ZoneComponent`, `TacticalRoleComponent`, `GamePhaseComponent`
2. Integrare `RoleTactic` per comportamenti specifici
3. Espandere con `PhaseTactic` e `BallTactic`
4. Aggiungere `ZoneArrivalSystem` per rilevare arrivo in zona
5. Simulare scenari reali (es. costruzione dal basso in 4-3-3)

## 🧠 Effetto osservato post-kickoff

Durante la transizione da `KickoffPhase` al `ZoneActivatedSystem`, i giocatori eseguono un **breve movimento verso sud-est** prima di virare verso la loro destinazione tattica.Il comportamento è:

- **Fluido e coerente** con il sistema di movimento
- Probabilmente dovuto a un'inizializzazione della direzione o posizione target
- Non impatta negativamente la simulazione, ma può essere ottimizzato per maggiore precisione

## 📦 Link progetto

👉 [github.com/michelemazzei/football_sim_core](https://github.com/michelemazzei/football_sim_core)

# 🧠 Football Sim Core — Modello Tattico Cognitivo

## ✅ Stato attuale del simulatore

- Kickoff funzionante e fluido
- I giocatori si posizionano correttamente in base a:
  - `TacticalRoleComponent` → ruolo
  - `GamePhaseComponent` → fase di gioco
  - `ZoneComponent` → zona ideale
- Movimento fluido verso la zona assegnata
- Effetto osservato: **breve virata verso sud-est** post-kickoff prima di raggiungere la destinazione

---

## 🧩 Modello di decisione tattica

Abbiamo deciso di **non inviare messaggi tattici broadcast**, ma di implementare un sistema locale per ogni giocatore:

### 1. `PlayerBrainComponent`

Contiene una lista di tattiche (`PlayerTactic`) che rappresentano mini-algoritmi comportamentali.

### 2. Tattiche modulari

Ogni tattica è un modulo indipendente, ad esempio:

- `BallFollowTactic` → segue la palla
- `FreeTheAreaTactic` → spazza la palla
- `SupportPossessorTactic` → si avvicina al compagno con la palla

### 3. Valutazione tattiche

Il cervello del giocatore valuta le tattiche disponibili e sceglie quella dominante usando:

- **Priorità fissa**
- **Utility-Based AI** → ogni tattica calcola un punteggio (0–1) in base al contesto

### 4. Attivazione FSM

La tattica dominante genera uno stato FSM, es. `BallFollowTactic` → `MoveToBallState`

### 5. Esecuzione

Lo stato FSM esegue l’algoritmo della tattica nel suo `update()` o `onMessage()`

---

## 🧠 Pattern AI utilizzati

| Pattern              | Funzione                                                            |
| -------------------- | ------------------------------------------------------------------- |
| Utility-Based AI     | Ogni tattica calcola un punteggio e il cervello sceglie la migliore |
| Behavior Arbitration | Selezione esclusiva o combinata di più tattiche                    |
| Blackboard Pattern   | Tutte le tattiche leggono da un contesto comune (`GameContext`)   |

---

## ✅ Vantaggi del modello

- Evita overload di messaggi
- Modularità e testabilità
- Decisione locale e realistica
- Scalabilità tattica
- Comportamenti emergenti e coordinati

---

## 🔜 Prossimo passo

Scrivere la prima `PlayerTactic` concreta (es. `BallFollowTactic`) con:

```dart
abstract class PlayerTactic {
  double computeUtility(PlayerEntity player, GameContext context);
  PlayerState createState();
}
```

# 🧠 Football Sim Core — Modello Tattico Cognitivo

## ✅ Stato attuale del simulatore

- Kickoff funzionante e fluido
- I giocatori si posizionano correttamente in base a:
  - `TacticalRoleComponent` → ruolo
  - `GamePhaseComponent` → fase di gioco
  - `ZoneComponent` → zona ideale
- Movimento fluido verso la zona assegnata
- Effetto osservato: **breve virata verso sud-est** post-kickoff prima di raggiungere la destinazione

---

## 🧩 Modello di decisione tattica

Abbiamo deciso di **non inviare messaggi tattici broadcast**, ma di implementare un sistema locale per ogni giocatore:

### 1. `PlayerBrainComponent`

Contiene una lista di tattiche (`PlayerTactic`) che rappresentano mini-algoritmi comportamentali.

### 2. Tattiche modulari

Ogni tattica è un modulo indipendente, ad esempio:

- `BallFollowTactic` → segue la palla
- `FreeTheAreaTactic` → spazza la palla
- `SupportPossessorTactic` → si avvicina al compagno con la palla

### 3. Valutazione tattiche

Il cervello del giocatore valuta le tattiche disponibili e sceglie quella dominante usando:

- **Priorità fissa**
- **Utility-Based AI** → ogni tattica calcola un punteggio (0–1) in base al contesto

### 4. Attivazione FSM

La tattica dominante genera uno stato FSM, es. `BallFollowTactic` → `MoveToBallState`

### 5. Esecuzione

Lo stato FSM esegue l’algoritmo della tattica nel suo `update()` o `onMessage()`

---

## 🧠 Pattern AI utilizzati

| Pattern              | Funzione                                                            |
| -------------------- | ------------------------------------------------------------------- |
| Utility-Based AI     | Ogni tattica calcola un punteggio e il cervello sceglie la migliore |
| Behavior Arbitration | Selezione esclusiva o combinata di più tattiche                    |
| Blackboard Pattern   | Tutte le tattiche leggono da un contesto comune (`GameContext`)   |

---

## ✅ Vantaggi del modello

- Evita overload di messaggi
- Modularità e testabilità
- Decisione locale e realistica
- Scalabilità tattica
- Comportamenti emergenti e coordinati

---

## 🔜 Prossimo passo

Scrivere la prima `PlayerTactic` concreta (es. `BallFollowTactic`) con:

```dart
# 🧠 Football Sim Core — Modello Tattico Interattivo

## 🎯 Visione strategica

Il simulatore è progettato per permettere al giocatore umano di:

- Scegliere le tattiche da usare durante la partita
- Attivare/disattivare tattiche in tempo reale
- Costruire una squadra adatta allo stile di gioco desiderato
- Osservare le performance dei giocatori in relazione alle tattiche scelte

Esempio:  
La tattica `PallaLungaEPedalare` funziona solo con giocatori veloci. Se applicata a un centrocampo lento, la squadra soffre e perde.

---

## 🧠 Modello decisionale del giocatore

Ogni giocatore ha un `PlayerTacticBrainComponent` che:

- Contiene una lista di `PlayerTactic` (mini-algoritmi comportamentali)
- Valuta ogni tattica con `computeUtility()`
- Sceglie quella con il punteggio più alto
- Attiva lo stato FSM corrispondente con `createState()`

---

## 🧩 Differenza tra TacticalBrick e PlayerTactic

| Aspetto                  | `TacticalBrick` (Team → Player)             | `PlayerTactic` (Player → FSM)               |
|--------------------------|---------------------------------------------|---------------------------------------------|
| Scope                    | Strategia centralizzata                     | Decisione locale                            |
| Output                   | Messaggi (`Telegram`)                       | Stati FSM (`PlayerState`)                   |
| Attivazione              | Da `TeamTacticQueueComponent`               | Da `PlayerTacticBrainComponent`             |
| Esecuzione               | Via `ActionQueueComponent`                  | Via `fsm.changeState()`                     |
| Obiettivo                | Coordinare la squadra                       | Far ragionare il singolo giocatore          |

---

## 🔧 Infrastruttura software da costruire

### 1. Interfaccia base `PlayerTactic`

```dart
abstract class PlayerTactic {
  String get name;
  double computeUtility(PlayerEntity player, EcsWorld world);
  PlayerState createState();
}

```

e integrarla in :

class PlayerBrainComponent {
  List `<PlayerTactic>` tactics;
  PlayerTactic? currentTactic;

  void update(PlayerEntity player, GameContext context) {
    final best = tactics
      .map((t) => MapEntry(t, t.computeUtility(player, context)))
      .reduce((a, b) => a.value > b.value ? a : b);

    if (best.key != currentTactic) {
      currentTactic = best.key;
      player.changeState(best.key.createState());
    }
  }
}
