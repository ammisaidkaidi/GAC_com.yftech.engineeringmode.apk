package com.yftech.engineeringmode.fragment;

import android.os.Bundle;
import android.os.Environment;
import android.os.SystemProperties;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CompoundButton;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.Switch;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.util.DeleteUtil;
import com.yftech.vehicle.internal.adapter.ICarMisc;
import com.yftech.vehicle.sdk.CarMiscManager;
import java.io.File;
import java.io.IOException;

/* loaded from: /home/user/work/dex/classes2.dex */
public class AuthenticationFragment extends BaseFragment implements CompoundButton.OnCheckedChangeListener, AdapterView.OnItemSelectedListener {
    private static final String TAG = AuthenticationFragment.class.getSimpleName();
    private final String CERTIFICATE_FILE_PATH = Environment.getExternalStorageDirectory() + "/certificate";
    private final String CERTIFICATE_FILE_PATH_CACHE = "/cache/recovery/last_certificate";
    private final String HICAR_CERTIFICATE_FILE_PATH = Environment.getExternalStorageDirectory() + "/certificate_hicar";
    private final String HICAR_CERTIFICATE_FILE_PATH_CACHE = "/cache/recovery/last_certificate_hicar";
    private ICarMisc.AteCarType[] carType = {ICarMisc.AteCarType.IHU12_A88_A1, ICarMisc.AteCarType.IHU12_A58_B1, ICarMisc.AteCarType.IHU12_A79_C1, ICarMisc.AteCarType.IHU12_A79_C2};
    private Spinner spAteCarType;

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_authentication, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        ((Switch) root.findViewById(R.id.authentication_carplay)).setChecked(SystemProperties.getInt("persist.sys.carplay.certificate", 0) == 1);
        ((Switch) root.findViewById(R.id.authentication_carplay)).setOnCheckedChangeListener(this);
        ((Switch) root.findViewById(R.id.authentication_same_rate)).setChecked(SystemProperties.getInt("persist.vendor.ul.dl.same.rate", 0) == 1);
        ((Switch) root.findViewById(R.id.authentication_same_rate)).setOnCheckedChangeListener(this);
        root.findViewById(R.id.authentication_layout_same_rate).setVisibility(8);
        this.spAteCarType = (Spinner) root.findViewById(R.id.sp_save_option);
        ArrayAdapter<String> internalProjectCodeAdapter = new ArrayAdapter<>(getContext(), R.layout.spinner_item, getResources().getStringArray(R.array.Internal_project_code));
        internalProjectCodeAdapter.setDropDownViewResource(R.layout.spinner_item_dropdown);
        this.spAteCarType.setAdapter((SpinnerAdapter) internalProjectCodeAdapter);
        this.spAteCarType.setOnItemSelectedListener(this);
        ((Switch) root.findViewById(R.id.authentication_hicar)).setChecked(SystemProperties.getInt("persist.sys.hicar.certificate", 0) == 1);
        ((Switch) root.findViewById(R.id.authentication_hicar)).setOnCheckedChangeListener(this);
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        this.spAteCarType.setSelection(getCarType(), true);
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
        if (!compoundButton.isPressed()) {
            return;
        }
        if (compoundButton.getId() == 2131296302) {
            SystemProperties.set("persist.vendor.ul.dl.same.rate", isChecked ? "1" : "0");
            return;
        }
        if (compoundButton.getId() == 2131296299) {
            SystemProperties.set("persist.sys.carplay.certificate", isChecked ? "1" : "0");
            SystemProperties.set("persist.vendor.ul.dl.same.rate", isChecked ? "1" : "0");
            SystemProperties.set("persist.carplay.alsa.enable", isChecked ? "true" : "false");
            if (isChecked) {
                createCertificateFile();
                return;
            } else {
                removeCertificateFile();
                return;
            }
        }
        if (compoundButton.getId() == 2131296300) {
            SystemProperties.set("persist.sys.hicar.certificate", isChecked ? "1" : "0");
            SystemProperties.set("persist.bluetooth.atc.incallnoscan", isChecked ? "disable" : "enable");
            if (isChecked) {
                createHiCarCertificateFile();
            } else {
                removeHiCarCertificateFile();
            }
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        if (parent.getId() == 2131296551) {
            boolean result = CarMiscManager.get().setAteCarType(this.carType[position]);
            Log.i("AuthenticationFragment", "setAteCarType type:" + this.carType[position] + " result:" + result);
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> parent) {
    }

    private int getCarType() {
        ICarMisc.AteCarType type = CarMiscManager.get().getAteCarType();
        Log.i(TAG, "getCarType type:" + type);
        int index = 0;
        while (true) {
            ICarMisc.AteCarType[] ateCarTypeArr = this.carType;
            if (index < ateCarTypeArr.length) {
                if (ateCarTypeArr[index] != type) {
                    index++;
                } else {
                    return index;
                }
            } else {
                return 0;
            }
        }
    }

    private void createCertificateFile() {
        File file = new File(this.CERTIFICATE_FILE_PATH);
        if (!file.exists()) {
            try {
                boolean result = file.createNewFile();
                Log.i(TAG, "createCertificateFile() result:" + result);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        File fileCache = new File("/cache/recovery/last_certificate");
        if (!fileCache.exists()) {
            try {
                boolean resultCache = fileCache.createNewFile();
                Log.i(TAG, "createCertificateFile() resultCache:" + resultCache);
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    private void removeCertificateFile() {
        boolean result = DeleteUtil.delete(this.CERTIFICATE_FILE_PATH);
        boolean resultCache = DeleteUtil.delete("/cache/recovery/last_certificate");
        Log.i(TAG, "removeCertificateFile() result:" + result + " resultCache:" + resultCache);
    }

    private void createHiCarCertificateFile() {
        File file = new File(this.HICAR_CERTIFICATE_FILE_PATH);
        if (!file.exists()) {
            try {
                boolean result = file.createNewFile();
                Log.i(TAG, "createHiCarCertificateFile() result:" + result);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        File fileCache = new File("/cache/recovery/last_certificate_hicar");
        if (!fileCache.exists()) {
            try {
                boolean resultCache = fileCache.createNewFile();
                Log.i(TAG, "createHiCarCertificateFile() resultCache:" + resultCache);
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    private void removeHiCarCertificateFile() {
        boolean result = DeleteUtil.delete(this.HICAR_CERTIFICATE_FILE_PATH);
        boolean resultCache = DeleteUtil.delete("/cache/recovery/last_certificate_hicar");
        Log.i(TAG, "removeHiCarCertificateFile() result:" + result + " resultCache:" + resultCache);
    }
}
