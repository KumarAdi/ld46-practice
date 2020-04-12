package scenes;

import hxd.Res;
import hxd.Key;
import h2d.Anim;
import h2d.Bitmap;
import h2d.Scene;
import entities.Overlay;

class Kneading implements Level {
    public var scene: Scene;
    public var dough: Anim;
    public var lOverlay: Overlay;
    public var rOverlay: Overlay;

    public function new() {
        scene = new Scene();
        scene.scaleMode = LetterBox(256, 192);
    }

    public function init(): Void {
        var doughSheet = hxd.Res.img.dough.toTile();
        dough = new h2d.Anim(doughSheet.gridFlatten(128).slice(0,52), 30, scene);
        dough.loop = false;
        dough.x = (256 - 128) / 2;
        dough.y = (192 - 128) / 2;

        lOverlay = new Overlay(
            new Bitmap(hxd.Res.img.lDough.toTile(), scene));
        rOverlay = new Overlay(
            new Bitmap(hxd.Res.img.rDough.toTile(), scene));
            
        lOverlay.bitmap.x = dough.x;
        lOverlay.bitmap.y = dough.y;

        rOverlay.bitmap.x = dough.x;
        rOverlay.bitmap.y = dough.y;
    }

    public function update(dt: Float): Null<Level> {
        if (Key.isPressed(Key.LEFT)) {
            hxd.Res.sound.slappLeft.play();
            lOverlay.scaleBy(1+dt);
        }
        if (Key.isPressed(Key.RIGHT)) {
            hxd.Res.sound.slappRight.play();
            rOverlay.scaleBy(1+dt);
        }

        return null;
    }
}