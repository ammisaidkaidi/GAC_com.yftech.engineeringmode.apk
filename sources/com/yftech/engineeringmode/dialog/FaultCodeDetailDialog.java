package com.yftech.engineeringmode.dialog;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import com.yftech.vehicle.internal.adapter.ICarMisc;

/* loaded from: /home/user/work/dex/classes2.dex */
public class FaultCodeDetailDialog extends Dialog {
    private ICarMisc.ErrorCodeInfo codeInfo;

    public FaultCodeDetailDialog(Context context, ICarMisc.ErrorCodeInfo code) {
        super(context);
        this.codeInfo = code;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_fault_detail);
        initView();
    }

    private void initView() {
        ((TextView) findViewById(R.id.fault_vehicle_speed)).setText(String.valueOf(this.codeInfo.vehicleSpeed));
        ((TextView) findViewById(R.id.fault_motor_speed)).setText(String.valueOf(this.codeInfo.motorSpeed));
        ((TextView) findViewById(R.id.fault_operating_voltage)).setText(String.valueOf(this.codeInfo.voltage));
        ((TextView) findViewById(R.id.fault_odometer)).setText(String.valueOf(this.codeInfo.odoMeter));
        String faultTime = (this.codeInfo.year + 2000) + "/" + this.codeInfo.month + "/" + this.codeInfo.day + " " + this.codeInfo.hour + ":" + this.codeInfo.minute + ":" + this.codeInfo.sec;
        ((TextView) findViewById(R.id.fault_time)).setText(faultTime);
        ((TextView) findViewById(R.id.fault_status)).setText(String.format("%X", Integer.valueOf(this.codeInfo.dtc_state)));
        ((Button) findViewById(R.id.back)).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.dialog.-$$Lambda$FaultCodeDetailDialog$QvCKcyoMAbZG9GztGQB6Ai1fboU
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                FaultCodeDetailDialog.this.lambda$initView$0$FaultCodeDetailDialog(view);
            }
        });
    }

    public /* synthetic */ void lambda$initView$0$FaultCodeDetailDialog(View view) {
        dismiss();
    }
}
