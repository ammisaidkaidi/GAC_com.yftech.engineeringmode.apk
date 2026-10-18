package com.yftech.engineeringmode.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.v7.widget.AppCompatSeekBar;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class SeekBarNumber extends AppCompatSeekBar {
    private boolean mIsMoveOutside;
    private boolean mIsPaintProgress;
    private String mLetterSpace;
    private int mNumberMin;
    private int mProgress;
    private Paint mProgressPaint;
    private boolean mSetVolume;
    private Paint mTextPaint;
    private float mTextSize;

    public SeekBarNumber(Context context) {
        super(context);
        this.mNumberMin = 0;
        this.mSetVolume = false;
        this.mIsPaintProgress = false;
        this.mTextSize = 24.0f;
        this.mIsMoveOutside = false;
        this.mProgress = 0;
        initTextPaint();
        initProgressPaint();
    }

    public SeekBarNumber(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mNumberMin = 0;
        this.mSetVolume = false;
        this.mIsPaintProgress = false;
        this.mTextSize = 24.0f;
        this.mIsMoveOutside = false;
        this.mProgress = 0;
        setAttrsFromXml(context, attrs);
        initTextPaint();
        initProgressPaint();
    }

    public SeekBarNumber(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mNumberMin = 0;
        this.mSetVolume = false;
        this.mIsPaintProgress = false;
        this.mTextSize = 24.0f;
        this.mIsMoveOutside = false;
        this.mProgress = 0;
        setAttrsFromXml(context, attrs);
        initTextPaint();
        initProgressPaint();
    }

    private void initTextPaint() {
        this.mTextPaint = new Paint();
        this.mTextPaint.setAntiAlias(true);
        this.mTextPaint.setColor(-1);
        this.mTextPaint.setTextSize(this.mTextSize);
    }

    private void setAttrsFromXml(Context context, AttributeSet attrs) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SeekBarNumber);
        this.mLetterSpace = a.getString(0);
        this.mTextSize = a.getDimension(1, 24.0f);
        a.recycle();
    }

    protected synchronized void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.save();
        int value = getProgress() + this.mNumberMin;
        String number = Integer.toString(value);
        Rect rect = getThumb().getBounds();
        if (this.mLetterSpace != null) {
            if (value > -10 && value < 10) {
                this.mTextPaint.setLetterSpacing(0.05f);
            }
            this.mTextPaint.setLetterSpacing(Float.valueOf(this.mLetterSpace).floatValue());
        }
        this.mTextPaint.setColor(isSelected() ? -15676443 : -1);
        float fontwidth = this.mTextPaint.measureText(number);
        float x = (rect.left + ((rect.width() - fontwidth) / 2.0f)) - getThumbOffset();
        float y = (rect.top - this.mTextPaint.ascent()) + ((rect.height() - (this.mTextPaint.descent() - this.mTextPaint.ascent())) / 2.0f);
        canvas.drawText(number, x, y, this.mTextPaint);
        if (this.mIsPaintProgress) {
            drawProgressPaint(value, rect, canvas);
        }
        canvas.restore();
    }

    public void setNumberMin(int min) {
        this.mNumberMin = min;
    }

    public int getNumberMin() {
        return this.mNumberMin;
    }

    public void setSetVolume(boolean set) {
        this.mSetVolume = set;
    }

    public boolean getSetVolume() {
        return this.mSetVolume;
    }

    public boolean onTouchEvent(MotionEvent event) {
        if (event.getX() < -150.0f || event.getX() > getWidth() + 150 || event.getY() < -30.0f || event.getY() > getHeight() + 30) {
            this.mIsMoveOutside = true;
            this.mProgress = getProgress();
        }
        boolean ret = super.onTouchEvent(event);
        if (event.getAction() == 1) {
            this.mIsMoveOutside = false;
        }
        return ret;
    }

    public boolean isMoveOutside() {
        return this.mIsMoveOutside;
    }

    public int getMoveOutsideProgress() {
        return this.mProgress;
    }

    private void initProgressPaint() {
        this.mProgressPaint = new Paint();
        this.mProgressPaint.setColor(-1);
        this.mProgressPaint.setStrokeWidth(4.0f);
    }

    public void setPaintProgress(boolean isPaintProgress) {
        this.mIsPaintProgress = isPaintProgress;
    }

    private void drawProgressPaint(int progress, Rect rectThumb, Canvas canvas) {
        int startX = 0;
        int startY = 0;
        int stopX = 0;
        int stopY = 0;
        if (progress == 0) {
            startX = getWidth() / 2;
            startY = getHeight() / 2;
            stopX = rectThumb.left + (rectThumb.width() / 2);
            stopY = getHeight() / 2;
        } else if (progress < 0) {
            startX = (getWidth() / 2) + 3;
            startY = getHeight() / 2;
            stopX = rectThumb.left + rectThumb.width();
            stopY = getHeight() / 2;
        } else if (progress > 0) {
            startX = (getWidth() / 2) - 3;
            startY = getHeight() / 2;
            stopX = rectThumb.left;
            stopY = getHeight() / 2;
        }
        canvas.drawLine(startX, startY, stopX, stopY, this.mProgressPaint);
    }
}
