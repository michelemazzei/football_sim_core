import 'package:flame/components.dart';

enum StadiumType { small, medium, big, biggest }

class SpaltiComponent extends Component {
  final Vector2 campoSize;
  final StadiumType tipo;
  final List<String> spettatoriPng;
  final spettatoreSize = Vector2(12, 12);

  SpaltiComponent({
    required this.campoSize,
    required this.tipo,
    required this.spettatoriPng,
  });

  factory SpaltiComponent.make({required Vector2 size, StadiumType? type}) =>
      SpaltiComponent(
        campoSize: size,
        tipo: type ?? StadiumType.medium,
        spettatoriPng: [
          'spettatori/spettatore_1.png',
          'spettatori/spettatore_2.png',
          'spettatori/spettatore_3.png',
          'spettatori/spettatore_4.png',
          'spettatori/spettatore_5.png',
          'spettatori/spettatore_6.png',
          'spettatori/spettatore_7.png',
          'spettatori/spettatore_8.png',
          'spettatori/spettatore_9.png',
          'spettatori/spettatore_10.png',
        ],
      );

  @override
  Future<void> onLoad() async {
    await _generaSpalti('top');
    await _generaSpalti('bottom');
    await _generaSpalti('left');
    await _generaSpalti('right');
  }

  Future<void> _generaSpalti(String lato) async {
    // Quante file in base al tipo di stadio
    int fileCount;
    switch (tipo) {
      case StadiumType.small:
        fileCount = 1;
        break;
      case StadiumType.medium:
        fileCount = 2;
        break;
      case StadiumType.big:
        fileCount = 3;
        break;
      case StadiumType.biggest:
        fileCount = 4;
        break;
    }

    final isOrizzontale = lato == 'top' || lato == 'bottom';
    final colonne = isOrizzontale
        ? ((campoSize.x - 70) / spettatoreSize.x).floor()
        : ((campoSize.y - 70) / spettatoreSize.y).floor();

    for (int fila = 0; fila < fileCount; fila++) {
      for (int col = 0; col < colonne; col++) {
        final spriteName = spettatoriPng[(fila + col) % spettatoriPng.length];
        final sprite = await Sprite.load(spriteName);

        final component = SpriteComponent()
          ..sprite = sprite
          ..size = spettatoreSize;

        // Posizionamento
        switch (lato) {
          case 'top':
            component.position = Vector2(
              col * spettatoreSize.x,
              -((fila + 1) * spettatoreSize.y) - 10,
            );
            component.angle = 3.14 / 2; // guarda in basso
            break;
          case 'bottom':
            component.position = Vector2(
              col * spettatoreSize.x,
              campoSize.y + (fila * spettatoreSize.y) - 70,
            );
            component.angle = -3.14 / 2; // guarda in alto
            break;
          case 'left':
            component.position = Vector2(
              -((fila + 1) * spettatoreSize.x) - 10,
              col * spettatoreSize.y,
            );
            component.angle = 0; // guarda a destra
            break;
          case 'right':
            component.position = Vector2(
              campoSize.x + (fila * spettatoreSize.x) - 60,
              col * spettatoreSize.y,
            );
            component.angle = 3.14; // guarda a sinistra
            break;
        }

        add(component);
      }
    }
  }
}
