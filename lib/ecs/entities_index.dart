import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/model/team_id.dart';

class EntitiesIndex<T extends EcsEntity> {
  final Map<int, T> _entities = {};

  /// Restituisce un Iterable: non crea una nuova lista,
  /// ma una "vista" sulla mappa esistente. Zero allocazione di memoria.
  Iterable<T> get() {
    return _entities.values;
  }

  T? operator [](int id) => _entities[id];

  void add(T entity) {
    _entities[entity.id] = entity;
  }

  void remove(T entity) {
    _entities.remove(entity.id);
  }

  /// Utile per le sostituzioni: operazione atomica e sincrona
  void replace(T oldPlayer, T newPlayer) {
    remove(oldPlayer);
    add(newPlayer);
  }

  void clear() {
    _entities.clear();
  }
}

class PlayersIndex extends EntitiesIndex<PlayerEntity> {
  final Map<TeamId, Map<int, PlayerEntity>> _playersByTeam = {
    TeamId.home: {},
    TeamId.away: {},
  };

  Iterable<PlayerEntity> byTeams(TeamId team) => _playersByTeam[team]!.values;

  @override
  void add(PlayerEntity entity) {
    super.add(entity);
    _playersByTeam[entity.teamId]![entity.id] = entity;
  }

  @override
  void remove(PlayerEntity entity) {
    super.remove(entity);
    _playersByTeam[entity.teamId]?.remove(entity.id);
  }

  @override
  void clear() {
    super.clear();
    _playersByTeam.clear();
  }
}

class EntitiesByType<T extends EcsEntity> extends EntitiesIndex<T> {
  final Map<Type, Map<int, T>> _byType = {};

  // Qui usiamo 'Type' come chiave direttamente
  Iterable<T> byType(Type type) => _byType[type]?.values ?? Iterable<T>.empty();

  @override
  void add(T entity) {
    super.add(entity);
    // Assicuriamoci che la sotto-mappa per il tipo specifico esista
    _byType.putIfAbsent(entity.runtimeType, () => {})[entity.id] = entity;
  }

  @override
  void remove(T entity) {
    super.remove(entity);
    _byType[entity.runtimeType]?.remove(entity.id);
  }
}
