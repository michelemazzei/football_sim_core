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

🔜 Prossimo step: Strategia calcistica

Scenario proposto: **Costruzione dal basso in 4-3-3**

* Portiere → centrale → regista si abbassa
* Terzini larghi, mezzali tra le linee
* Attaccanti pronti a ricevere o pressare

Componenti da introdurre

* `TacticalRoleComponent` → ruolo tattico del giocatore
* `GamePhaseComponent` → fase corrente del gioco
* `TacticalDecisionSystem` → decide cosa fare in base a ruolo, fase, zona
* Messaggi come `MoveToZone`, `PrepareToReceive` → gestiti via `PlayerMessageHandler`

🧩 Quando torni

Ti preparo:

* Scheletro completo di `TacticalRoleComponent`, `GamePhaseComponent`, `TacticalDecisionSystem`
* Esempio di strategia reale: costruzione dal basso
* Routing tattico con messaggi e intenti

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

link dei sorgenti [michelemazzei/football_sim_core](https://github.com/michelemazzei/football_sim_core)
