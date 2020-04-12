package scenes;

import h2d.Bitmap;
import h2d.Scene;

class Chopping implements Level {
    public var scene: Scene;
    public var test: Bitmap;

    public function new() {
        scene = new Scene();
        scene.scaleMode = LetterBox(256, 192);
    }

    public function init(): Void {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), scene);
        tf.text = "Chopping!";
    }

    public function update(dt: Float): Null<Level> {
        return null;
    }
}