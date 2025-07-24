/// Tipi di messaggi che gli agenti possono scambiarsi durante la partita.
enum Messages {
  /// Un compagno deve ricevere il pallone.
  receiveBall,

  /// L'agente chiede un passaggio al portatore di palla.
  passToMe,

  /// L'agente si posiziona per supportare l'attaccante.
  supportAttacker,

  /// Ordina all'agente di tornare alla sua posizione originaria.
  goHome,

  /// Posizionamento iniziale per il calcio d'inizio.
  placeToKickOff,

  /// L'agente deve aspettare (es. prima di entrare in gioco).
  wait,

  /// Cambia il proprietario del pallone dopo un passaggio o recupero.
  ballChangeOwner,

  /// La squadra è in fase offensiva.
  attacking,

  /// La squadra è in fase difensiva.
  defending,
}
