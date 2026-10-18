package android.support.design.widget;

import android.graphics.Outline;

/* loaded from: /home/user/work/dex/classes.dex */
public class CircularBorderDrawableLollipop extends CircularBorderDrawable {
    @Override // android.graphics.drawable.Drawable
    public void getOutline(Outline outline) {
        copyBounds(this.rect);
        outline.setOval(this.rect);
    }
}
