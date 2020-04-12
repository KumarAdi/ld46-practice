package entities;

import h2d.Bitmap;

class Overlay {
    public var bitmap: Bitmap;
    var scale: Float;

    public function new(bitmap: Bitmap) {
        this.bitmap = bitmap;
        this.bitmap.alpha = 0.25;
        this.scale = 1.0;
    }

    public function scaleBy(factor: Float) {
        this.bitmap.scale(factor);
        this.bitmap.x += (scale - scale * factor) * bitmap.tile.width / 2;
        this.bitmap.y += (scale - scale * factor) * bitmap.tile.height / 2;
        this.scale *= factor;
    }
} 