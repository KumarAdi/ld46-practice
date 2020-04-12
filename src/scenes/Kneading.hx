package scenes;

import h2d.Bitmap;
import h2d.Tile;
import h2d.Scene;

class Kneading implements Level {
    public var scene: Scene;
    public var dough: Bitmap;

    public function new() {
        scene = new Scene();
        scene.scaleMode = LetterBox(256, 192);
    }

    public function init(): Void {
        dough = new Bitmap(Tile.fromColor(0xFF0000, 50, 50), scene);
        dough.x = (256 - 50) / 2;
        dough.y = (192 - 50) / 2;
    }

    public function update(dt: Float): Null<Level> {
        return null;
    }
}