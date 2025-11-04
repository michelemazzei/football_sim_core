# Football Sim Core

Simulatore manageriale di calcio 2D sviluppato con Flutter + Flame.

📦 Stato attuale del progetto

🔧 Architettura

* ECS solida con entità, componenti e sistemi ben separati
* FSM modulare per ogni giocatore, con `FsmComponent<playerentity></playerentity>` e `PlayerFsmSystem`
* Messaggi gestiti in due modi:
* **Centralizzati** via `PlayerActionHandlerSystem` e `PlayerMessageHandler`
* **Contestuali** via `onMessage()` nei singoli stati

📬 Messaggi

* Usati per orchestrare intenti tattici, gestire cooldown, e simulare reazioni realistiche
* Registry dinamico (`PlayerMessageRegistry`) con chiave `runtimeType.toString()` per compatibilità
* Incapsulato in `PlayerMessageRegistryComponent` per essere usato come risorsa ECS

🧠 Routing dei messaggi

| Messaggio                             | Gestore                       | Comportamento                                |
| ------------------------------------- | ----------------------------- | -------------------------------------------- |
| `MoveToBall``PassToNearestTeammate` | `PlayerActionHandlerSystem` | Intento tattico, cambio stato se pronto      |
| `BallIncoming``PhaseChanged`        | `FSM.onMessage()`           | Reazione locale, ignorato se non compatibile |
| `changeState()` diretto             | Qualunque punto               | Cambio immediato, non tattico                |

Buon rientro Michele — appena torni, ripartiamo da dove ci siamo lasciati. Il campo è pronto, la squadra è schierata, manca solo il mister

✅ **Sistema FSM funzionante**

✅ **CooldownComponent operativo**

✅ **ActionQueueComponent rifattorizzato con timestamp e timeout**

✅ **BallBoundarySystem attivo per rilevare palla fuori**

✅ **PlayerFsmSystem centralizza la logica di esecuzione**

✅ **Messaggi scaduti vengono ignorati correttamente**

🧠 Prossimo step: Strategia calcistica

Hai già impostato una struttura tattica nel tuo vecchio progetto, basata su:

* 📐  **ZoneComponent** : suddivisione del campo in quadrati
* 🧩 **Sistema di gioco (es. 4-4-2, 5-3-2)** con ruoli e posizioni
* ⚙️ **Comportamento in fase difensiva e offensiva**
* 🧠  **Decisioni del giocatore con la palla** : avanzare, passare, tirare

🚀 Cosa faremo insieme

Quando torni, ti guiderò passo passo per:

1. **Definire i ruoli tattici** (`TacticalRoleComponent`)
2. **Mappare le zone per ogni fase di gioco** (`GamePhaseComponent`)
3. **Scrivere un sistema decisionale per ogni giocatore** (`TacticalDecisionSystem`)
4. **Simulare una strategia reale** (es. costruzione dal basso, pressing alto)
5. **Far reagire i giocatori in modo coordinato** in base a fase, ruolo e posizione

🧭 Primo scenario tattico proposto

**Costruzione dal basso in 4-3-3**

* Portiere → centrale → regista si abbassa
* Terzini larghi, mezzali tra le linee
* Attaccanti pronti a ricevere o pressare

Quando torni, possiamo iniziare da lì oppure scegliere un’altra fase di gioco.

Ti guiderò passo dopo passo, come un vero secondo allenatore digitale.

Buona pausa, e quando sei pronto… si torna in campo ⚽

Buona serata Michele, e a domani per il prossimo passo. Il campo ti aspetta ⚽

Ottima scelta partire dalle  **zone del campo** : è la base per qualsiasi comportamento tattico intelligente. Se hai già una suddivisione in zone e assegnazioni per fase di gioco, allora sei già a metà dell’opera. Partiamo da lì e costruiamo sopra.

Ma prima, ecco una panoramica delle **tattiche manageriali** che potremmo implementare nel tuo simulatore. Le divido in **modelli tattici** e  **sistemi decisionali** , così hai una visione chiara:

🧩 1. ZoneTactic (quella che hai già iniziato)

* Ogni giocatore ha una zona preferita per ogni fase (attacco, difesa, transizione).
* Le decisioni si basano su:
  * Ruolo tattico
  * Fase di gioco
  * Zona attuale vs zona ideale
* Ottima per simulare movimenti posizionali e costruzione ordinata.

🧠 2. RoleTactic

* Ogni ruolo ha un comportamento definito:
  * Il regista si abbassa in costruzione
  * Il terzino spinge in possesso
  * L’attaccante pressa in transizione
* Si integra bene con ZoneTactic per dare “personalità” ai ruoli.

🔁 3. PhaseTactic

* La squadra cambia comportamento in base alla fase:
  * In **BuildUp** si cerca il possesso
  * In **Transition** si verticalizza
  * In **Defense** si abbassa il blocco
* Può essere gestita da un `TeamTacticComponent` o `GamePhaseComponent`.

🧠 4. BallTactic

* Le decisioni si basano sulla posizione della palla:
  * Se la palla è nella nostra metà → difesa posizionale
  * Se è nella trequarti avversaria → attacco diretto
* Utile per pressing, coperture e movimenti di supporto.

🎯 5. OpponentTactic

* Reazioni basate sulla posizione o comportamento avversario:
  * Se l’avversario ha il regista libero → pressa
  * Se l’attaccante si abbassa → seguilo
* Richiede un sistema di percezione e analisi avversaria.

🧠 6. DynamicTactic

* Tattica che evolve nel tempo:
  * Dopo 60 minuti → cambio modulo
  * In svantaggio → attacco più diretto
* Può essere gestita da un `MatchStrategySystem`.

🧠 7. SetPieceTactic

* Comportamenti specifici per corner, punizioni, rimesse:
* Posizionamento
* Movimenti predefiniti
* Ruoli specializzati (battitore, saltatore, bloccatore)

📦 8. FormationTactic

* Modulo base (4-3-3, 4-4-2, 3-5-2) con ruoli e zone assegnate.
* Può essere la base per tutte le altre tattiche.

🔜 Come procediamo

Ti propongo questo ordine:

1. Rifiniamo la tua `ZoneTactic` con `ZoneComponent`, `TacticalRoleComponent`, `GamePhaseComponent`.
2. Aggiungiamo un `ZoneTacticSystem` che muove i giocatori verso la zona ideale.
3. Poi integriamo `RoleTactic` per dare comportamenti specifici.
4. E infine espandiamo con `PhaseTactic` e `BallTactic`.

Quando torni, possiamo:

* Rifinire il `ZoneTacticSystem` con la nuova struttura
* Scrivere un `TeamMatchStateComponent` per gestire lato campo e stato runtime
* Espandere la strategia con `PhaseTactic`, `BallTactic`, `OpponentTactic`

link dei sorgenti [michelemazzei/football_sim_core](https://github.com/michelemazzei/football_sim_core)

🧠 Recap sessione 3 novembre — Strategia e visualizzazione tattica

✅ Obiettivo raggiunto

Abbiamo visualizzato correttamente la griglia del campo con:

* Rettangoli perfettamente dimensionati per ogni zona
* Etichette centrate con coordinate `(x, y)`
* Conversione corretta da coordinate normalizzate a coordinate schermo
* Overlay visivo utile per debug e assegnazione tattica

🧩 Problemi identificati

1. **Coordinate virtuali errate** : alcuni giocatori ricevono destinazioni non coerenti (es. portiere verso `(0.05, 0.11)`).
2. **Movimento ritardato** : i giocatori si muovono troppo tardi dopo il kickoff.
3. **Zone duplicate per squadra away** : serve applicare `mirrorZone()` per assegnare correttamente le zone.
4. **Giocatori #6 e #9 fermi** : probabilmente non ricevono `MovingComponent` o ignorano il messaggio.

✅ Prossimi passi

* Usare `grid.centerOfZone(zone)` per assegnare destinazioni ai giocatori
* Applicare `mirrorZone()` per la squadra away
* Verificare che tutti i giocatori ricevano correttamente `MoveToZoneState`
* Aggiungere log nel `PlayerFsmSystem` per tracciare transizioni FSM
* Eventualmente visualizzare le destinazioni con frecce o cerchi

Domani possiamo ripartire da:

* Correzione assegnazione zone per squadra away
* Debug FSM per i giocatori fermi
* Integrazione con `TacticalDecisionSystem` per movimenti intelligenti

Buona serata michele! Il campo è pronto, la tattica prende forma ⚽

🧠 Recap sessione 3 novembre — Strategia e visualizzazione tattica

✅ Obiettivo raggiunto

Abbiamo visualizzato correttamente la griglia del campo con:

* Rettangoli perfettamente dimensionati per ogni zona
* Etichette centrate con coordinate `(x, y)`
* Conversione corretta da coordinate normalizzate a coordinate schermo
* Overlay visivo utile per debug e assegnazione tattica


✅ Prossimi passi

* Usare `grid.centerOfZone(zone)` per assegnare destinazioni ai giocatori
* Applicare `mirrorZone()` per la squadra away
* Verificare che tutti i giocatori ricevano correttamente `MoveToZoneState`
* Aggiungere log nel `PlayerFsmSystem` per tracciare transizioni FSM
* Eventualmente visualizzare le destinazioni con frecce o cerchi

Domani possiamo ripartire da:

* Correzione assegnazione zone per squadra away
* Debug FSM per i giocatori fermi
* Integrazione con `TacticalDecisionSystem` per movimenti intelligenti
