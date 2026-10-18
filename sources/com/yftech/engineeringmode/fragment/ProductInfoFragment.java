package com.yftech.engineeringmode.fragment;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemProperties;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.yftech.car.bluetooth.CarBluetoothManager;
import com.yftech.car.utils.PlatformProjectDescribe;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.LoadingDialog;
import com.yftech.vehicle.internal.adapter.ICarConfig;
import com.yftech.vehicle.internal.utils.StringUtils;
import com.yftech.vehicle.sdk.CarBspManager;
import com.yftech.vehicle.sdk.CarConfig;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ProductInfoFragment extends BaseFragment {
    private static final String ACTION = "com.yftech.engineeringmode.ProductInfo";
    private static final String TAG = ProductInfoFragment.class.getSimpleName();
    private ProductInfoReceiver mReceiver;
    private ICarConfig.VehiclePlatform mVehiclePlatform;
    private View root;
    private Handler mHandler = new Handler();
    private Runnable updateRunnable = new Runnable() { // from class: com.yftech.engineeringmode.fragment.ProductInfoFragment.2
        @Override // java.lang.Runnable
        public void run() {
            ProductInfoFragment productInfoFragment = ProductInfoFragment.this;
            productInfoFragment.initView(productInfoFragment.root);
        }
    };

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_product_info, container, false);
        this.mVehiclePlatform = CarConfig.getVehiclePlatform();
        this.root = root;
        initView(root);
        return root;
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        IntentFilter intentFilter = new IntentFilter(ACTION);
        this.mReceiver = new ProductInfoReceiver();
        getContext().registerReceiver(this.mReceiver, intentFilter);
    }

    public void onPause() {
        super.onPause();
        getContext().unregisterReceiver(this.mReceiver);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initView(View root) {
        ((TextView) root.findViewById(R.id.tv_supplier)).setText(getSupplier());
        ((TextView) root.findViewById(R.id.tv_part_number)).setText(getPartNumber());
        ((TextView) root.findViewById(R.id.tv_sn)).setText(getSN());
        ((TextView) root.findViewById(R.id.tv_vin)).setText(getVIN());
        ((TextView) root.findViewById(R.id.tv_mcu_version)).setText(getMcuVersion());
        ((TextView) root.findViewById(R.id.tv_mcu_boot_version)).setText(getMcuBootVersion());
        String systemVersion = getSystemVersion();
        if (this.mVehiclePlatform == ICarConfig.VehiclePlatform.A58) {
            systemVersion = systemVersion.replace("A88", "A58");
        }
        ((TextView) root.findViewById(R.id.tv_system_version)).setText(systemVersion);
        ((TextView) root.findViewById(R.id.tv_gps_version)).setText(getGPSVersion());
        ((TextView) root.findViewById(R.id.tv_bluetooth_version)).setText(getBluetoothVersion());
        ((TextView) root.findViewById(R.id.tv_wifi_version)).setText(getWifiVersion());
        ((TextView) root.findViewById(R.id.tv_voice_version)).setText(getVoiceVersion());
        ((TextView) root.findViewById(R.id.tv_product_info_display_sn)).setText(getDisplaySn());
        ((TextView) root.findViewById(R.id.tv_product_info_display_pn)).setText(getDisplayPn());
        ((TextView) root.findViewById(R.id.tv_product_info_display_create_date)).setText(getDisplayCreateDate());
        ((TextView) root.findViewById(R.id.tv_product_info_display_software_version)).setText(getDisplaySoftwareVersion());
        ((TextView) root.findViewById(R.id.tv_product_info_display_hardware_version)).setText(getDisplayHardwareVersion());
        ((TextView) root.findViewById(R.id.tv_product_info_display_supplier_software_version)).setText(getDisplaySupplierSoftwareVersion());
        ((TextView) root.findViewById(R.id.tv_product_info_display_supplier_hardware_version)).setText(getDisplaySupplierHardwareVersion());
        ((Button) root.findViewById(R.id.afresh)).setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.fragment.ProductInfoFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ProductInfoFragment.this.requestBspInfo();
                new LoadingDialog(ProductInfoFragment.this.getContext()).show();
                ProductInfoFragment.this.mHandler.postDelayed(ProductInfoFragment.this.updateRunnable, 1200L);
            }
        });
    }

    private String getSupplier() {
        return SystemProperties.get("persist.vehicle.suppliercode", BuildConfig.FLAVOR);
    }

    private String getPartNumber() {
        return SystemProperties.get("persist.vehicle.pn", BuildConfig.FLAVOR);
    }

    private String getSN() {
        if (PlatformProjectDescribe.isCBIHU12Project() || PlatformProjectDescribe.isCBIHU12C1Project() || PlatformProjectDescribe.isCBIHU12C7Project() || PlatformProjectDescribe.isCBIHU23Project() || PlatformProjectDescribe.isCBIHU23C1Project()) {
            return SystemProperties.get("persist.ecu.product.line.serial", "无");
        }
        return SystemProperties.get("persist.vehicle.sn", BuildConfig.FLAVOR);
    }

    private String getVIN() {
        return SystemProperties.get("persist.vehicle.vin", BuildConfig.FLAVOR);
    }

    private String getMcuVersion() {
        return SystemProperties.get("persist.version.mcu", BuildConfig.FLAVOR);
    }

    private String getMcuBootVersion() {
        return SystemProperties.get("persist.version.mcuboot", BuildConfig.FLAVOR);
    }

    private String getSystemVersion() {
        return SystemProperties.get("ro.build.display.id", BuildConfig.FLAVOR);
    }

    private String getGPSVersion() {
        return BuildConfig.FLAVOR;
    }

    private String getBluetoothVersion() {
        return CarBluetoothManager.getInstance().getSDKVersion();
    }

    private String getWifiVersion() {
        return BuildConfig.FLAVOR;
    }

    private String getVoiceVersion() {
        return BuildConfig.FLAVOR;
    }

    private String getDisplaySn() {
        String displaySn = SystemProperties.get("persist.bsp.display.sn", BuildConfig.FLAVOR);
        Log.i(TAG, "getDisplaySn: " + displaySn);
        return displaySn;
    }

    private String getDisplayPn() {
        String displayPn = SystemProperties.get("persist.bsp.display.pn", BuildConfig.FLAVOR);
        Log.i(TAG, "getDisplayPn: " + displayPn);
        return displayPn;
    }

    private String getDisplayCreateDate() {
        String sDate = SystemProperties.get("persist.bsp.display.create.date", BuildConfig.FLAVOR);
        Log.i(TAG, "getDisplayCreateDate: " + sDate);
        if (sDate.length() == 0) {
            return null;
        }
        if (!StringUtils.isNumeric(sDate)) {
            Log.i(TAG, "getDisplayCreateDate: data is not number");
            return null;
        }
        try {
            Date date = new SimpleDateFormat("ddMMyy").parse(sDate);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年M月d日");
            return simpleDateFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    private String getDisplaySoftwareVersion() {
        String softwareVersion = SystemProperties.get("persist.bsp.display.ver.software", BuildConfig.FLAVOR);
        Log.i(TAG, "getDisplaySoftwareVersion: " + softwareVersion);
        return softwareVersion;
    }

    private String getDisplayHardwareVersion() {
        String hardwareVersion = SystemProperties.get("persist.bsp.display.ver.hardware", BuildConfig.FLAVOR);
        Log.i(TAG, "getDisplayHardwareVersion: " + hardwareVersion);
        return hardwareVersion;
    }

    private String getDisplaySupplierSoftwareVersion() {
        String sSoftwareVersion = SystemProperties.get("persist.bsp.display.ver.supplier.software", BuildConfig.FLAVOR);
        Log.i(TAG, "getDisplaySupplierSoftwareVersion: " + sSoftwareVersion);
        return sSoftwareVersion;
    }

    private String getDisplaySupplierHardwareVersion() {
        String sHardwareVersion = SystemProperties.get("persist.bsp.display.ver.supplier.hardware", BuildConfig.FLAVOR);
        Log.i(TAG, "getDisplaySupplierHardwareVersion: " + sHardwareVersion);
        return sHardwareVersion;
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    private class ProductInfoReceiver extends BroadcastReceiver {
        private ProductInfoReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            Log.i(ProductInfoFragment.TAG, "ProductInfoReceiver onReceive:");
            ProductInfoFragment.this.mHandler.post(ProductInfoFragment.this.updateRunnable);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void requestBspInfo() {
        CarBspManager.get().queryBspInfoCmd((byte) 1);
        CarBspManager.get().queryBspInfoCmd((byte) 2);
        CarBspManager.get().queryBspInfoCmd((byte) 3);
        CarBspManager.get().queryBspInfoCmd((byte) 4);
        CarBspManager.get().queryBspInfoCmd((byte) 5);
        CarBspManager.get().queryBspInfoCmd((byte) 6);
        CarBspManager.get().queryBspInfoCmd((byte) 7);
        CarBspManager.get().queryBspInfoCmd((byte) 8);
        CarBspManager.get().queryBspInfoCmd((byte) 9);
        CarBspManager.get().queryBspInfoCmd((byte) 10);
        new Handler().postDelayed(new Runnable() { // from class: com.yftech.engineeringmode.fragment.ProductInfoFragment.3
            @Override // java.lang.Runnable
            public void run() {
                Intent intent = new Intent(ProductInfoFragment.ACTION);
                ProductInfoFragment.this.getContext().sendBroadcast(intent);
            }
        }, 2000L);
    }
}
