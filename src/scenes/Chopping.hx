package scenes;

import h2d.Scene;

class Chopping implements Level {
    public var scene: Scene;
    public var totalTime: Float;

    public function new() {
        scene = new Scene();
    }

    public function init(): Void {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), scene);
        tf.text = "Chopping!";
        totalTime = 0;
    }

    public function update(dt: Float): Null<Level> {
        totalTime += dt;
        if (totalTime > 10) {
            return new Kneading();
        }
        return null;
    }
}