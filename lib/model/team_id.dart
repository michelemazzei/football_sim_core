enum TeamId {
  home,
  away;

  /// Restituisce la squadra avversaria in modo immediato
  TeamId get opposite => this == TeamId.home ? TeamId.away : TeamId.home;

  bool get isHome => this == TeamId.home;
  bool get isAway => this == TeamId.away;

  @override
  String toString() => name.toUpperCase();
}
