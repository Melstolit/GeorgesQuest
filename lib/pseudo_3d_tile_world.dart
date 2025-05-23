import 'package:flame/components.dart';
import 'package:flame/game.dart'; // For findGame
import 'tile.dart'; // Import the new Tile class

class Pseudo3DTileWorld extends World {
  static const double tileWidth = 32.0;
  static const double tileHeight = 32.0;

  List<List<String>> tileMap = [
    ['floor', 'floor', 'wall_north'],
    ['floor', 'floor', 'wall_north'],
    ['wall_north', 'wall_north', 'wall_north'],
  ];

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final gameSize = findGame()!.size;
    final mapActualWidth = tileMap.isNotEmpty ? tileMap[0].length : 0;
    final mapActualHeight = tileMap.length;

    // This is a simplified calculation for the visual extent of an isometric map
    final mapDisplayWidth = (mapActualWidth + mapActualHeight) * tileWidth / 2;
    final mapDisplayHeight = (mapActualWidth + mapActualHeight) * tileHeight / 4; // Adjusted for isometric perspective overlap

    final offsetX = (gameSize.x - mapDisplayWidth) / 2 + (mapActualHeight * tileWidth/2) ;
    final offsetY = (gameSize.y - mapDisplayHeight) / 2 ;


    for (int i = 0; i < tileMap.length; i++) { // i is row
      for (int j = 0; j < tileMap[i].length; j++) { // j is column
        String tileType = tileMap[i][j];

        double currentTileHeightOffset = 0.0;
        if (tileType == 'wall_north') {
          currentTileHeightOffset = tileHeight / 2;
        }

        final tile = Tile(
          gridX: j,
          gridY: i,
          tileType: tileType,
          heightOffset: currentTileHeightOffset,
          size: Vector2.all(tileWidth), // Pass the size to the Tile constructor
        );

        double screenX = (j - i) * (tileWidth / 2);
        double screenY = (j + i) * (tileHeight / 4);

        tile.position = Vector2(
          screenX + offsetX,
          screenY + offsetY - currentTileHeightOffset,
        );
        tile.priority = screenY.toInt();
        await add(tile);
      }
    }
  }
}
