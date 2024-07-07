import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

/// A component that renders the crate sprite, with a 16 x 16 size.
class MyCrate extends SpriteComponent {
  MyCrate() : super(size: Vector2.all(256), position: Vector2(-10, -20));

  double rotation = 0;
  @override
  void update(double dt) {
    super.update(dt);
    angle += 0.01; // Adjust the value to control the rotation speed.
    angle %= 360; // Keep the angle within 0 to 360 degrees.
    rotation = angle; // Set the rotation of the sprite.
  }

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('crate.png');
  }
}

class MyWorld extends World {
  @override
  Future<void> onLoad() async {
    await add(MyCrate());
  }
}

void main() {
  final myGame = FlameGame(world: MyWorld());
  runApp(
    GameWidget(game: myGame),
  );
}