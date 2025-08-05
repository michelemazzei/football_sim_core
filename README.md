# football_sim_core

A new Flutter project.

## Getting Started

progetto di calcio 2D in Flame e Flutter.

il gioco di calcio e' un manageriale, quindi lo scopo non e' far giocare il giocatore alla partita, ma di vederla e fare acquisti di giocatori, e selezionare le tattiche piu' adeguate.

Recap Session

1. Stato attuale del progetto
   * Ambiente: Flutter + Flame 2D.
   * Meccanica: manageriale, si vedono le partite senza giocarle direttamente.
   * Implementazioni fatte

     * Algoritmo A* per lo steering
     * Campo da calcio
     * Palla al centro
   * Mancanze
   * Giocatori (cerchi colorati con numero)
   * FSM parziale da integrare con il gioco
   * Diverse parti del progetto 2022 non compilano con le versioni attuali di Flutter e Flame
2. Obiettivi di oggi
   1. Far compilare tutto il progetto
   2. Analizzare il pacchetto “game” su GitHub e verificare se serve rifattorizzazione
   3. Definire un pattern per legare la logica (classe Ball) al componente grafico (BallComponent)
3. Decisioni e idee chiave
   * Mantenere la separazione tra modello di gioco (Ball, Player, Team) e componenti grafici (PositionComponent)
   * Usare il metodo `update()` dei Component di Flame per spostare/ruotare la palla in base ai dati di Ball
   * Aggiornare `pubspec.yaml` con le versioni stabili di Flame e Flutter, rimuovendo dipendenze deprecate
4. To-do list e prossimi passi

* [ ] Clonare il repo `football_sim_core` e tentare la compilazione FATTO!
* [ ] Segnalare errori di versione e dipendenze mancanti FATTO!
* [ ] Allineare le API di Flame (es. `SpriteComponent` → `PositionComponent` + `Sprite`) FATTO!
* [ ] Creare una classe wrapper `BallModel` con posizione/velocità e un `BallComponent` che ne legge i valori in `update() FATTO!`
* [ ] da creare i PlayerComponent copiando il codice da ballComponent
* [ ] Test rapido: far muovere la palla usando i trigger dell’FSM

Far compilare il progetto Flutter + Flame


📝 Recap progetto "Football Sim"

✅ Cosa funziona

* Architettura MVC: `BallModel`, `BallController`, `BallComponent`
* Gestione attrito, velocità massima, e collisione con i bordi
* Resize dinamico e posizione relativa
* Trail visivo quando la palla è veloce
* Setup iniziale con `FootballGame` e `FieldComponent`

🔧 Miglioramenti suggeriti

* Rimuovere doppia assegnazione `position` in `BallComponent.update()`
* In `create()`, calcolare subito `relativePosition`
* Preparare `PlayerComponent` derivato da `FieldBoundComponent`

🚀 Prossimi passi

* Creare `PlayerComponent` con numero, colore, e movimento
* Aggiungere interazione tra giocatori e palla
* Eventuale sistema di goal, punteggio, e replay

Quando torni, ti aiuto a scrivere il primo `PlayerComponent` e lo mettiamo subito in campo.

Buon viaggio o buona pausa! ⚽✨
