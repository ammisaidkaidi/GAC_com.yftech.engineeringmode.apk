package android.support.design.shape;

/* loaded from: /home/user/work/dex/classes.dex */
public class CutCornerTreatment extends CornerTreatment {
    private final float size;

    public CutCornerTreatment(float size) {
        this.size = size;
    }

    @Override // android.support.design.shape.CornerTreatment
    public void getCornerPath(float angle, float interpolation, ShapePath shapePath) {
        shapePath.reset(0.0f, this.size * interpolation);
        shapePath.lineTo((float) (Math.sin(angle) * this.size * interpolation), (float) (Math.cos(angle) * this.size * interpolation));
    }
}
