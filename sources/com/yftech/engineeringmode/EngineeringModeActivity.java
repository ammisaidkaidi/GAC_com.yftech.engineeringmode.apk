package com.yftech.engineeringmode;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.AssetManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.SystemProperties;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.yftech.car.media.data.CarMediaDataManager;
import com.yftech.car.utils.PlatformProjectDescribe;
import com.yftech.engineeringmode.EngineeringModeActivity;
import com.yftech.engineeringmode.adapter.ModuleAdapter;
import com.yftech.engineeringmode.dialog.CheckInfoDialog;
import com.yftech.engineeringmode.fragment.AAHeadUnitInfoFragment;
import com.yftech.engineeringmode.fragment.AdditionalFragment;
import com.yftech.engineeringmode.fragment.AppInfoFragment;
import com.yftech.engineeringmode.fragment.AtcMetazoneFragment;
import com.yftech.engineeringmode.fragment.AuthenticationFragment;
import com.yftech.engineeringmode.fragment.BackupRecoveryFragment;
import com.yftech.engineeringmode.fragment.BaseFragment;
import com.yftech.engineeringmode.fragment.BluetoothFragment;
import com.yftech.engineeringmode.fragment.CameraFragment;
import com.yftech.engineeringmode.fragment.ConfigFragment;
import com.yftech.engineeringmode.fragment.EQFragment;
import com.yftech.engineeringmode.fragment.FaultCodeFragment;
import com.yftech.engineeringmode.fragment.LogFragment;
import com.yftech.engineeringmode.fragment.LoudSpeakerFragment;
import com.yftech.engineeringmode.fragment.MicTestFragment;
import com.yftech.engineeringmode.fragment.OtherFragment;
import com.yftech.engineeringmode.fragment.ProductInfoFragment;
import com.yftech.engineeringmode.fragment.ScreenFragment;
import com.yftech.engineeringmode.fragment.StreelingWheelKeyFragment;
import com.yftech.engineeringmode.fragment.TemperatureInfoFragment;
import com.yftech.engineeringmode.fragment.TunerFragment;
import com.yftech.engineeringmode.fragment.USBTestFragment;
import com.yftech.engineeringmode.fragment.UsbUpgradeFragment;
import com.yftech.engineeringmode.fragment.WifiFragment;
import com.yftech.engineeringmode.model.CheckInfo;
import com.yftech.engineeringmode.model.Module;
import com.yftech.engineeringmode.util.Utils;
import com.yftech.vehicle.internal.adapter.ICarMisc;
import com.yftech.vehicle.sdk.CarMiscManager;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: /home/user/work/dex/classes2.dex */
public class EngineeringModeActivity extends AppCompatActivity implements View.OnClickListener {
    private static final int MSG_SHOW_CHECK_INFO_RESULT = 1;
    private static final String TAG = EngineeringModeActivity.class.getSimpleName();
    private FrameLayout fl_container;
    private CheckInfoDialog mCheckInfoDialog;
    private BaseFragment mCurrentFragment;
    private TextView mTvAuthentication;
    private RecyclerView recyclerView;
    private TextView tv_cur_view;
    private String mLastTag = BuildConfig.FLAVOR;
    private int mClickCount = 0;
    private Map<String, BaseFragment> mFragments = new HashMap();
    private ViewTreeObserver.OnGlobalLayoutListener mGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.yftech.engineeringmode.EngineeringModeActivity.1
        @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
        public void onGlobalLayout() {
            EngineeringModeActivity.this.recyclerView.getViewTreeObserver().removeOnGlobalLayoutListener(EngineeringModeActivity.this.mGlobalLayoutListener);
            int viewWidth = EngineeringModeActivity.this.recyclerView.getWidth();
            float tabBtnWidth = EngineeringModeActivity.this.getResources().getDimension(R.dimen.tab_btn_width);
            EngineeringModeActivity.this.recyclerView.setLayoutManager(new GridLayoutManager(EngineeringModeActivity.this, (int) (viewWidth / tabBtnWidth)));
        }
    };
    private CarMiscManager.CarMiscListener mCarMiscListener = new CarMiscManager.CarMiscListener() { // from class: com.yftech.engineeringmode.EngineeringModeActivity.2
        public void onFactoryModeUds31EngineerInfoChanged(ICarMisc.EngineerMode mode) {
            super.onFactoryModeUds31EngineerInfoChanged(mode);
            Log.i(EngineeringModeActivity.TAG, "onFactoryModeUds31EngineerInfoChanged() mode:" + mode);
            if (mode == ICarMisc.EngineerMode.RESULT) {
                EngineeringModeActivity.this.finish();
            }
        }
    };
    private final List<CheckInfo> mCheckInfos = new ArrayList();
    private final Handler mHandlerCheckInfo = new Handler(new AnonymousClass3());

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_engineeringmode);
        this.fl_container = (FrameLayout) findViewById(R.id.fl_container);
        this.recyclerView = findViewById(R.id.recycler_view);
        this.recyclerView.getViewTreeObserver().addOnGlobalLayoutListener(this.mGlobalLayoutListener);
        ModuleAdapter adapter = new ModuleAdapter(loadModule());
        adapter.setOnItemClickListener(new ModuleAdapter.OnItemClickListener() { // from class: com.yftech.engineeringmode.-$$Lambda$EngineeringModeActivity$mUaX3y19x9gx2on7WJBQe5-Ipj8
            @Override // com.yftech.engineeringmode.adapter.ModuleAdapter.OnItemClickListener
            public final void onItemClick(View view, int i, Module module) {
                EngineeringModeActivity.this.lambda$onCreate$0$EngineeringModeActivity(view, i, module);
            }
        });
        this.recyclerView.setAdapter(adapter);
        this.tv_cur_view = (TextView) findViewById(R.id.tv_cur_view);
        findViewById(R.id.tv_screenshot).setOnClickListener(this);
        findViewById(R.id.tv_back).setOnClickListener(this);
        findViewById(R.id.tv_close).setOnClickListener(this);
        findViewById(R.id.tv_title).setOnClickListener(this);
        findViewById(R.id.tv_adb).setOnClickListener(this);
        this.mTvAuthentication = (TextView) findViewById(R.id.tv_authentication);
        this.mTvAuthentication.setOnClickListener(this);
        this.mTvAuthentication.setVisibility(8);
        loadFragments();
    }

    public /* synthetic */ void lambda$onCreate$0$EngineeringModeActivity(View itemView, int position, Module module) {
        if (module == null || this.mLastTag.equals(module.getTag())) {
            return;
        }
        this.mLastTag = module.getTag();
        showFragment(module);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.tv_adb /* 2131296598 */:
                setADBEnable(true);
                return;
            case R.id.tv_authentication /* 2131296601 */:
                Module module = new Module();
                module.setTag("authentication");
                module.setName("认证设置项");
                module.setShow(true);
                showFragment(module);
                return;
            case R.id.tv_back /* 2131296603 */:
                back();
                return;
            case R.id.tv_close /* 2131296613 */:
                finish();
                return;
            case R.id.tv_screenshot /* 2131296641 */:
                screenshot();
                return;
            case R.id.tv_title /* 2131296652 */:
                this.mClickCount++;
                if (this.mClickCount >= 10) {
                    this.mClickCount = 0;
                    TextView textView = this.mTvAuthentication;
                    textView.setVisibility(textView.getVisibility() == 0 ? 8 : 0);
                    return;
                }
                return;
            default:
                return;
        }
    }

    private void showFragment(Module module) {
        this.mCurrentFragment = this.mFragments.get(module.getTag());
        BaseFragment baseFragment = this.mCurrentFragment;
        if (baseFragment != null && !baseFragment.isAdded()) {
            Log.i(TAG, "showFragment() " + module.getName());
            this.tv_cur_view.setText(module.getName());
            this.tv_cur_view.setVisibility(0);
            getSupportFragmentManager().beginTransaction().replace(R.id.fl_container, this.mCurrentFragment).commitAllowingStateLoss();
            this.fl_container.setVisibility(0);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void setADBEnable(boolean enable) {
        if (PlatformProjectDescribe.isATC8015Platform()) {
            Utils.setNodeString("/sys/class/dual_role_usb/dual-role-usb20/data_role", enable ? "device" : "host");
        } else {
            try {
                Runtime.getRuntime().exec(enable ? "yftools.sh device" : "yftools.sh host");
                SystemProperties.set("persist.adb.tls_server.enable", enable ? "1" : "0");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Toast.makeText((Context) this, (CharSequence) (enable ? "adb opened !!!" : "adb closed !!!"), 0).show();
    }

    private void screenshot() {
    }

    private void back() {
        BaseFragment baseFragment = this.mCurrentFragment;
        if (baseFragment != null && baseFragment.isAdded()) {
            getSupportFragmentManager().beginTransaction().remove(this.mCurrentFragment).commitAllowingStateLoss();
            this.fl_container.setVisibility(8);
            this.tv_cur_view.setVisibility(8);
            this.tv_cur_view.setText(BuildConfig.FLAVOR);
            this.mCurrentFragment = null;
            this.mLastTag = BuildConfig.FLAVOR;
        }
    }

    private List<Module> loadModule() {
        AssetManager assets;
        InputStream open;
        List<Module> modules = new ArrayList<>();
        try {
            AssetManager assets2 = getAssets();
            InputStream open2 = assets2.open("module_config.json");
            StringBuilder stringBuilder = new StringBuilder();
            InputStreamReader inputStreamReader = new InputStreamReader(open2);
            BufferedReader reader = new BufferedReader(inputStreamReader);
            while (true) {
                String line = reader.readLine();
                if (line == null) {
                    break;
                }
                stringBuilder.append(line);
            }
            reader.close();
            inputStreamReader.close();
            open2.close();
            JSONArray jsonArray = new JSONArray(stringBuilder.toString());
            int i = 0;
            while (i < jsonArray.length()) {
                JSONObject jsonObject = (JSONObject) jsonArray.get(i);
                if (!"additional".equals(jsonObject.getString("tag"))) {
                    assets = assets2;
                    open = open2;
                } else if (!PlatformProjectDescribe.isCA1105Project()) {
                    assets = assets2;
                    open = open2;
                } else {
                    Module module = new Module();
                    assets = assets2;
                    module.setTag(jsonObject.getString("tag"));
                    open = open2;
                    int resId = getResources().getIdentifier("module_" + jsonObject.getString("tag"), "string", getPackageName());
                    module.setName(getString(resId));
                    module.setShow(jsonObject.getBoolean("show"));
                    modules.add(module);
                    i++;
                    assets2 = assets;
                    open2 = open;
                }
                if (jsonObject.getBoolean("show")) {
                    Module module2 = new Module();
                    module2.setTag(jsonObject.getString("tag"));
                    int resId2 = getResources().getIdentifier("module_" + jsonObject.getString("tag"), "string", getPackageName());
                    module2.setName(getString(resId2));
                    module2.setShow(jsonObject.getBoolean("show"));
                    modules.add(module2);
                }
                i++;
                assets2 = assets;
                open2 = open;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modules;
    }

    private void loadFragments() {
        this.mFragments.put("product_info", new ProductInfoFragment());
        this.mFragments.put("log", new LogFragment());
        this.mFragments.put("temperature_info", new TemperatureInfoFragment());
        this.mFragments.put("usb_upgrade", new UsbUpgradeFragment());
        this.mFragments.put("camera", new CameraFragment());
        this.mFragments.put("config", new ConfigFragment());
        this.mFragments.put("tbox_info", null);
        this.mFragments.put("app_info", new AppInfoFragment());
        this.mFragments.put("internet", null);
        this.mFragments.put("tuner", new TunerFragment());
        this.mFragments.put("wifi", new WifiFragment());
        this.mFragments.put("bluetooth", new BluetoothFragment());
        this.mFragments.put("screen", new ScreenFragment());
        this.mFragments.put("gps", null);
        this.mFragments.put("source", null);
        this.mFragments.put("link", null);
        this.mFragments.put("mic", new MicTestFragment());
        this.mFragments.put("digital_amplifier", null);
        this.mFragments.put("loudspeaker", new LoudSpeakerFragment());
        this.mFragments.put("usb", new USBTestFragment());
        this.mFragments.put("key", null);
        this.mFragments.put("steering_wheel_key", new StreelingWheelKeyFragment());
        this.mFragments.put("fault_code_clean", new FaultCodeFragment());
        this.mFragments.put("can", null);
        this.mFragments.put("backup_recovery", new BackupRecoveryFragment());
        this.mFragments.put("additional", new AdditionalFragment());
        this.mFragments.put("authentication", new AuthenticationFragment());
        this.mFragments.put("atcmetazone", new AtcMetazoneFragment());
        this.mFragments.put("eq", new EQFragment());
        this.mFragments.put("aa_info", new AAHeadUnitInfoFragment());
        this.mFragments.put("other", new OtherFragment());
    }

    protected void onStart() {
        super.onStart();
        Log.i(TAG, "onStart()");
        checkInfo();
    }

    protected void onResume() {
        super.onResume();
        Log.i(TAG, "onResume()");
        CarMiscManager.get().registerReceiver(this.mCarMiscListener);
    }

    protected void onPause() {
        super.onPause();
        Log.i(TAG, "onPause()");
        CarMiscManager.get().unregisterReceiver(this.mCarMiscListener);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.yftech.engineeringmode.EngineeringModeActivity$3, reason: invalid class name */
    /* loaded from: /home/user/work/dex/classes2.dex */
    public class AnonymousClass3 implements Handler.Callback {
        AnonymousClass3() {
        }

        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message message) {
            if (message.what == 1) {
                EngineeringModeActivity engineeringModeActivity = EngineeringModeActivity.this;
                engineeringModeActivity.mCheckInfoDialog = new CheckInfoDialog(engineeringModeActivity.getApplicationContext(), EngineeringModeActivity.this.mCheckInfos);
                EngineeringModeActivity.this.mCheckInfoDialog.show();
                EngineeringModeActivity.this.mCheckInfoDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.yftech.engineeringmode.-$$Lambda$EngineeringModeActivity$3$5MDyn73EudZFB5IGgsur8DyafZg
                    @Override // android.content.DialogInterface.OnDismissListener
                    public final void onDismiss(DialogInterface dialogInterface) {
                        EngineeringModeActivity.AnonymousClass3.this.lambda$handleMessage$0$EngineeringModeActivity$3(dialogInterface);
                    }
                });
                return false;
            }
            return false;
        }

        public /* synthetic */ void lambda$handleMessage$0$EngineeringModeActivity$3(DialogInterface dialog) {
            EngineeringModeActivity.this.mCheckInfoDialog = null;
        }
    }

    private void checkInfo() {
        List<String> udiskPaths = CarMediaDataManager.getInstance().getExistUdiskList();
        if (udiskPaths == null) {
            Log.i(TAG, "checkInfo() udiskPaths is null.");
            return;
        }
        String checkInfoFilePath = BuildConfig.FLAVOR;
        Iterator<String> it = udiskPaths.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            String udiskPath = it.next();
            Log.i(TAG, "checkInfo() udiskPath=" + udiskPath);
            File file = new File(udiskPath + "/check_info.json");
            if (file.exists()) {
                checkInfoFilePath = file.getPath();
                break;
            }
        }
        Log.i(TAG, "checkInfo() checkInfoFilePath=" + checkInfoFilePath);
        if (!TextUtils.isEmpty(checkInfoFilePath)) {
            startCheckInfo(checkInfoFilePath);
        } else {
            Log.i(TAG, "checkInfo() no checkInfoFile");
        }
    }

    private void startCheckInfo(final String checkInfoFilePath) {
        new Thread(new Runnable() { // from class: com.yftech.engineeringmode.EngineeringModeActivity.4
            @Override // java.lang.Runnable
            public void run() {
                EngineeringModeActivity.this.mCheckInfos.clear();
                BufferedReader reader = null;
                try {
                    try {
                        try {
                            StringBuilder stringBuilder = new StringBuilder();
                            reader = new BufferedReader(new FileReader(checkInfoFilePath));
                            while (true) {
                                String line = reader.readLine();
                                if (line == null) {
                                    break;
                                } else {
                                    stringBuilder.append(line);
                                }
                            }
                            Log.i(EngineeringModeActivity.TAG, "startCheckInfo() " + stringBuilder.toString());
                            JSONArray jsonArray = new JSONArray(stringBuilder.toString());
                            int i = 0;
                            while (true) {
                                int i2 = 1;
                                if (i >= jsonArray.length()) {
                                    break;
                                }
                                JSONObject jsonObject = (JSONObject) jsonArray.get(i);
                                CheckInfo checkInfo = new CheckInfo();
                                checkInfo.setName(jsonObject.getString("name"));
                                checkInfo.setKey(jsonObject.getString("key"));
                                checkInfo.setValue(jsonObject.getString("value"));
                                String realValue = SystemProperties.get(checkInfo.getKey(), BuildConfig.FLAVOR);
                                checkInfo.setRealValue(realValue);
                                if (realValue.equals(checkInfo.getValue())) {
                                    i2 = 0;
                                }
                                checkInfo.setResult(i2);
                                Log.d(EngineeringModeActivity.TAG, checkInfo.toString());
                                EngineeringModeActivity.this.mCheckInfos.add(checkInfo);
                                i++;
                            }
                            EngineeringModeActivity.this.mHandlerCheckInfo.sendEmptyMessage(1);
                            reader.close();
                        } catch (Throwable th) {
                            if (reader != null) {
                                try {
                                    reader.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                            throw th;
                        }
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        if (reader != null) {
                            reader.close();
                        }
                    }
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
            }
        }, "EngineeringmodeCheckInfoThread").start();
    }
}
