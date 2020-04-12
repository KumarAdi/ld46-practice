package scenes;

import haxe.display.Display.Package;
import h2d.Bitmap;
import h2d.Tile;
import h2d.Scene;
import hxd.Key;
import hxd.Timer;

class Chopping implements Level {
    public var scene: Scene;
    public var knife: Bitmap;
    public var dButt: Bitmap;
    public var fButt: Bitmap;
    public var jButt: Bitmap;
    public var kButt: Bitmap;
    public var dLane: Bitmap;
    public var fLane: Bitmap;
    public var jLane: Bitmap;
    public var kLane: Bitmap;
    public var cuttingBoard: Bitmap;
    public var table: Bitmap;
    public var score: Int;

    public function new() {
        scene = new Scene();
        scene.scaleMode = LetterBox(256, 192);
    }

    public function init(): Void {
        // Init Cutting Board
        cuttingBoard = new Bitmap(Tile.fromColor(0xe3a13d, 256, 176), scene);

        // Init Cutting Board
        cuttingBoard = new Bitmap(Tile.fromColor(0xFFFFFF, 200, 120), scene);
        cuttingBoard.x = 23;
        cuttingBoard.y = 46;

        // Init chop lanes
        dLane = new Bitmap(Tile.fromColor(0xFF8080, 40, 192), scene);
        dLane.x = (256 / 2) - 80;
        dLane.y = 0;
        dLane.alpha = 0.5;
        fLane = new Bitmap(Tile.fromColor(0x80FF80, 40, 192), scene);
        fLane.x = (256 / 2) - 40;
        fLane.y = 0;
        fLane.alpha = 0.5;
        jLane = new Bitmap(Tile.fromColor(0x8080FF, 40, 192), scene);
        jLane.x = (256 / 2);
        jLane.y = 0;
        jLane.alpha = 0.5;
        kLane = new Bitmap(Tile.fromColor(0xFFFF80, 40, 192), scene);
        kLane.x = (256 / 2) + 40;
        kLane.y = 0;
        kLane.alpha = 0.5;

        // Init chop areas
        dButt = new Bitmap(Tile.fromColor(0xFF0000, 24, 48), scene);
        dButt.x = 8;
        dButt.y = 192 - (192 / 4) - 32;
        fButt = new Bitmap(Tile.fromColor(0x00FF00, 24, 48), scene);
        fButt.x = 8;
        fButt.y = 192 - (192 / 4) - 32;
        jButt = new Bitmap(Tile.fromColor(0x0000FF, 24, 48), scene);
        jButt.x = 8;
        jButt.y = 192 - (192 / 4) - 32;
        kButt = new Bitmap(Tile.fromColor(0xFFFF00, 24, 48), scene);
        kButt.x = 8;
        kButt.y = 192 - (192 / 4) - 32;

        // Add chop areas to chop lanes
        dLane.addChild(dButt);
        fLane.addChild(fButt);
        jLane.addChild(jButt);
        kLane.addChild(kButt);

        // Init knife
        knife = new Bitmap(Tile.fromColor(0xFFFFFF, 24, 80), scene);
        knife.x = (256 / 2) - 48 - 24;
        knife.y = 192 - 80;

        // Init score
        score = 0;
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), scene);
        tf.text = "Score: " + score;
        tf.x = 10;
        tf.y = 10;    
    }

    public function update(dt: Float): Null<Level> {
        if (Math.floor(Timer.frameCount % 300) == 0) {
            dropFood();
            trace("tomato!");
        }

        // move tomato
        if (dLane.getObjectByName("tomato") != null) {
            dLane.getObjectByName("tomato").move(0, 10);
        }
        if (fLane.getObjectByName("tomato") != null) {
            fLane.getObjectByName("tomato").move(0, 10);
        }
        if (jLane.getObjectByName("tomato") != null) {
            jLane.getObjectByName("tomato").move(0, 10);
        }
        if (kLane.getObjectByName("tomato") != null) {
            kLane.getObjectByName("tomato").move(0, 10);
        }

        if (Key.isPressed(Key.D)) {
            knife.x = dLane.x + 8;
            trace("d");
        }
        if (Key.isPressed(Key.F)) {
            knife.x = fLane.x + 8;
        }
        if (Key.isPressed(Key.J)) {
            knife.x = jLane.x + 8;
        }
        if (Key.isPressed(Key.K)) {
            knife.x = kLane.x + 8;
        }
        return null;
    }

    public function dropFood(): Void {
        var tomato = new Bitmap(Tile.fromColor(0xe03b38, 24, 24), scene);
        tomato.name = "tomato";
        tomato.x = 8;
        tomato.y = 10;
        tomato.alpha = 1;
        var lane = Math.floor(Math.random() * 4);
        if (lane == 0) {
            dLane.addChild(tomato);
        } else if (lane == 1) {
            fLane.addChild(tomato);
        } else if (lane == 2) {
            jLane.addChild(tomato);
        } else {
            kLane.addChild(tomato);
        }
    }

    public function checkChop(zone: Bitmap): Void {

    }


    public function incrementScore(): Void {

    }
}