import 'package:flame/components.dart';
import 'package:flutter/widgets.dart'; // For print, if used, or remove if not.
                                    // Or 'dart:ui' if Vector2 is needed and not from flame directly

// Definition of Pseudo3DTileWorld.tileWidth will be removed from here.
// The size will be passed in the constructor.

class Tile extends SpriteComponent {
  final int gridX;
  final int gridY;
  final String tileType;
  final double heightOffset;

  Tile({
    required this.gridX,
    required this.gridY,
    required this.tileType,
    this.heightOffset = 0.0,
    required Vector2 size, // Added size parameter
  }) : super(size: size); // Use passed size

  @override
  Future<void> onLoad() async {
    super.onLoad(); // Good practice to call super.onLoad if it exists and does something
    // Sprite loading logic remains.
    switch (tileType) {
      case 'floor':
        sprite = await Sprite.load('floor.png');
        break;
      case 'wall_north':
        sprite = await Sprite.load('wall.png');
        break;
      default:
        print('Unknown tile type: $tileType at $gridX, $gridY');
        sprite = await Sprite.load('crate.png'); // Fallback
        break;
    }
  }
}
