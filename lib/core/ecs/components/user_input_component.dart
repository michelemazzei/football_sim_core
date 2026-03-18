enum TeamMentality {
  ultraDefensive,
  defensive,
  balanced,
  offensive,
  ultraOffensive,
}

class UserInputComponent {
  TeamMentality teamMentality = TeamMentality.balanced;

  // Comando di tiro
  bool intentShoot = false;

  // Il momento esatto in cui l'utente ha premuto il tasto
  double? shootTimestamp;

  // Soglia di validità del comando (es. 0.5 secondi)
  static const double commandExpiry = 0.5;

  bool hasTeamMentality() => teamMentality != TeamMentality.balanced;

  bool hasValidShootIntent(double currentTime) {
    if (!intentShoot || shootTimestamp == null) return false;

    // Se il comando è troppo vecchio, lo ignoriamo
    if (currentTime - shootTimestamp! > commandExpiry) {
      consumeShoot();
      return false;
    }
    return true;
  }

  void consumeShoot() {
    intentShoot = false;
    shootTimestamp = null;
  }
}
