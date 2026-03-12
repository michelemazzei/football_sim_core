enum MessageOutcome {
  consumed,
  ignored,
  escalated;

  // Utility rapide per la logica di gestione
  bool get isHandled => this == MessageOutcome.consumed;
  bool get isIgnored => this == MessageOutcome.ignored;
  bool get isEscalated => this == MessageOutcome.escalated;

  @override
  String toString() => name.toUpperCase();
}
