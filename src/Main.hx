import scenes.Level;
import scenes.Chopping;

class Main extends hxd.App {

    var curLevel: Level;

    override function init() {
        curLevel = new Chopping();
        curLevel.init();
    }
    static function main() {
        new Main();
    }

    override function update(dt:Float) {
        if (s2d != curLevel.scene) {
            s2d = curLevel.scene;
        }
        var nextLevel = curLevel.update(dt);
        if (nextLevel != null) {
            curLevel = nextLevel;
            curLevel.init();
        }
    }
}
