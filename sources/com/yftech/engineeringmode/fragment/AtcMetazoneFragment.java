package com.yftech.engineeringmode.fragment;

import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.autochips.metazone.AtcMetazone;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.AtcMetazoneInpuDialog;
import com.yftech.engineeringmode.model.Metazone;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/* loaded from: /home/user/work/dex/classes2.dex */
public class AtcMetazoneFragment extends BaseFragment implements AdapterView.OnItemSelectedListener, View.OnClickListener {
    private static final String TAG = AtcMetazoneFragment.class.getSimpleName();
    private Map<String, Integer> binaryIndex;
    private AtcMetazoneInpuDialog dialog;
    private Map<String, Integer> dwordIndex;
    private Handler mHandler = new Handler();
    private int option;
    private Button read;
    private Spinner spOption;
    private TextView tvIndex;
    private TextView tvValue;
    private Button write;

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_atcmetazone, container, false);
        initView(view);
        initData();
        return view;
    }

    private void initView(View root) {
        this.spOption = (Spinner) root.findViewById(R.id.sp_option);
        this.read = (Button) root.findViewById(R.id.atcmetazone_read);
        this.write = (Button) root.findViewById(R.id.atcmetazone_write);
        this.tvIndex = (TextView) root.findViewById(R.id.tv_index);
        this.tvValue = (TextView) root.findViewById(R.id.tv_value);
        ArrayAdapter<String> saveOptionAdapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, getResources().getStringArray(R.array.atcmetaaon_option));
        saveOptionAdapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        this.spOption.setAdapter((SpinnerAdapter) saveOptionAdapter);
        this.spOption.setSelection(0, true);
        this.spOption.setOnItemSelectedListener(this);
        this.read.setOnClickListener(this);
        this.write.setOnClickListener(this);
    }

    private void initData() {
        this.binaryIndex = Metazone.getBinaryIndex();
        this.dwordIndex = Metazone.getDwordIndex();
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        if (parent.getId() == 2131296550) {
            this.option = position;
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> parent) {
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.atcmetazone_read /* 2131296297 */:
                this.dialog = new AtcMetazoneInpuDialog(getContext(), true, getIndex(this.option));
                this.dialog.show();
                break;
            case R.id.atcmetazone_write /* 2131296298 */:
                this.dialog = new AtcMetazoneInpuDialog(getContext(), false, getIndex(this.option));
                this.dialog.show();
                this.dialog.setEditIndex(this.tvIndex.getText().toString());
                break;
        }
        this.dialog.setOnButtonClickListener(new AtcMetazoneInpuDialog.OnDialogButtonClickListener() { // from class: com.yftech.engineeringmode.fragment.AtcMetazoneFragment.1
            @Override // com.yftech.engineeringmode.dialog.AtcMetazoneInpuDialog.OnDialogButtonClickListener
            public void write(String index, String value) {
                AtcMetazoneFragment atcMetazoneFragment = AtcMetazoneFragment.this;
                atcMetazoneFragment.writeMetazone(atcMetazoneFragment.option, index, value);
                AtcMetazoneFragment atcMetazoneFragment2 = AtcMetazoneFragment.this;
                atcMetazoneFragment2.readMetazone(atcMetazoneFragment2.option, index);
            }

            @Override // com.yftech.engineeringmode.dialog.AtcMetazoneInpuDialog.OnDialogButtonClickListener
            public void read(String index) {
                AtcMetazoneFragment atcMetazoneFragment = AtcMetazoneFragment.this;
                atcMetazoneFragment.readMetazone(atcMetazoneFragment.option, index);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void readMetazone(final int option, final String index) {
        if (TextUtils.isEmpty(index)) {
            Log.i(TAG, "readMetazone index is null");
            return;
        }
        final int[] intValue = new int[1];
        final byte[] byteValue = new byte[16];
        if (option != 0) {
            if (option == 1) {
                int i = this.binaryIndex.get(index).intValue();
                int result = AtcMetazone.readbinary(i, byteValue, 10);
                Log.i(TAG, "readMetazone by Binary --> result:" + result + " index:" + i + " value:" + Arrays.toString(byteValue));
            }
        } else {
            int i2 = this.dwordIndex.get(index).intValue();
            int result2 = AtcMetazone.readval(i2, intValue);
            Log.i(TAG, "readMetazone by int --> result:" + result2 + " index:" + i2 + " value:" + Arrays.toString(intValue));
        }
        this.mHandler.post(new Runnable() { // from class: com.yftech.engineeringmode.fragment.AtcMetazoneFragment.2
            @Override // java.lang.Runnable
            public void run() {
                AtcMetazoneFragment.this.tvIndex.setText(index);
                int i3 = option;
                if (i3 == 0) {
                    AtcMetazoneFragment.this.tvValue.setText(Arrays.toString(intValue));
                } else if (i3 == 1) {
                    AtcMetazoneFragment.this.tvValue.setText(Arrays.toString(byteValue));
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writeMetazone(int option, String index, String value) {
        if (TextUtils.isEmpty(index) || TextUtils.isEmpty(value)) {
            Log.i(TAG, "writeMetazone: index or value is null");
            return;
        }
        if (option == 0) {
            int i = this.dwordIndex.get(index).intValue();
            int v = Integer.parseInt(value);
            int result = AtcMetazone.writeval(i, v);
            Log.i(TAG, "writeMetazone by int --> result:" + result);
            return;
        }
        if (option == 1) {
            int i2 = this.binaryIndex.get(index).intValue();
            byte[] byteV = value.getBytes();
            int result2 = AtcMetazone.writebinary(i2, byteV, 10);
            Log.i(TAG, "writeMetazone by Binary --> result:" + result2 + " index:" + i2 + " value:" + Arrays.toString(byteV));
        }
    }

    private List<String> getIndex(int option) {
        if (option == 0) {
            return new ArrayList(this.dwordIndex.keySet());
        }
        if (option == 1) {
            return new ArrayList(this.binaryIndex.keySet());
        }
        return null;
    }

    public int bytesToInt(byte[] bytes) {
        return (bytes[0] << 24) | ((bytes[1] & 255) << 16) | ((bytes[2] & 255) << 8) | (bytes[3] & 255);
    }

    public int[] bytesToInts(byte[] bytes) {
        int bytesLength = bytes.length;
        int[] ints = new int[bytesLength % 4 == 0 ? bytesLength / 4 : (bytesLength / 4) + 1];
        int lengthFlag = 4;
        while (lengthFlag <= bytesLength) {
            ints[(lengthFlag / 4) - 1] = (bytes[lengthFlag - 4] << 24) | ((bytes[lengthFlag - 3] & 255) << 16) | ((bytes[lengthFlag - 2] & 255) << 8) | (bytes[lengthFlag - 1] & 255);
            lengthFlag += 4;
        }
        for (int i = 0; i < (bytesLength + 4) - lengthFlag; i++) {
            if (i == 0) {
                int i2 = (lengthFlag / 4) - 1;
                ints[i2] = ints[i2] | (bytes[(lengthFlag - 4) + i] << (((((bytesLength + 4) - lengthFlag) - i) - 1) * 8));
            } else {
                int i3 = (lengthFlag / 4) - 1;
                ints[i3] = ints[i3] | ((bytes[(lengthFlag - 4) + i] & 255) << (((((bytesLength + 4) - lengthFlag) - i) - 1) * 8));
            }
        }
        return ints;
    }
}
