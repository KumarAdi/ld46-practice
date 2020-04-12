package scenes;

import h2d.Scene;

class Kneading implements Level {
    public var scene: Scene;

    public function new() {
        scene = new Scene();
        init();
    }

    public function init(): Void {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), scene);
        tf.text = "Kneading!";
    }

    public function update(dt: Float): Null<Level> {
        return null;
    }
}