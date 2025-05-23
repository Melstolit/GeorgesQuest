import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'pseudo_3d_tile_world.dart'; // Relative path import

void main() {
  final myGame = FlameGame(world: Pseudo3DTileWorld());
  runApp(
    GameWidget(game: myGame),
  );
}