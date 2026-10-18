package com.yftech.engineeringmode.fragment;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.R;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;

/* loaded from: /home/user/work/dex/classes2.dex */
public class TemperatureInfoFragment extends BaseFragment {
    private static final String CPU_UTILIZATION_PATH = "/proc/stat";
    private static final String SOC_TEMPERATURE_PATH = "/sys/class/thermal/thermal_zone0/temp";
    private static final String TAG = "TemperatureInfo";
    private static final String TFT_TEMPERATURE_PATH = "/sys/bus/iio/devices/iio:device0/in_voltage0_input";
    private static final double VOLTAGE_TAG = 1.11385d;
    private volatile boolean exitThread = false;
    private BufferedReader reader = null;
    private final Handler updateTemperatureHandler = new Handler() { // from class: com.yftech.engineeringmode.fragment.TemperatureInfoFragment.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            Bundle bundle = msg.getData();
            ((TextView) TemperatureInfoFragment.this.viewRoot.findViewById(R.id.tv_soc)).setText(bundle.getString("soc"));
            ((TextView) TemperatureInfoFragment.this.viewRoot.findViewById(R.id.tv_cpu)).setText(bundle.getString("cpu"));
            ((TextView) TemperatureInfoFragment.this.viewRoot.findViewById(R.id.tv_tft)).setText(bundle.getString("tft"));
        }
    };
    private View viewRoot;

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_temperature_info, container, false);
        this.viewRoot = root;
        initView(root);
        return root;
    }

    public void onStart() {
        super.onStart();
        ReadTemperatureThread readTemperatureThread = new ReadTemperatureThread();
        readTemperatureThread.start();
        Log.d(TAG, "Read temperature thread start");
    }

    private void initView(View root) {
        ((TextView) root.findViewById(R.id.tv_soc)).setText(getSOCTemperature());
        ((TextView) root.findViewById(R.id.tv_cpu)).setText(getCPUUtilization());
        ((TextView) root.findViewById(R.id.tv_tft)).setText(getTFTTemperature());
    }

    private String getSOCTemperature() {
        return readSocTemperature();
    }

    private String getCPUUtilization() {
        return readCpuUtilization();
    }

    private String getAmplifierTemperature() {
        return BuildConfig.FLAVOR;
    }

    private String getTFTTemperature() {
        return readTFTTemperature();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String readSocTemperature() {
        String socTemperature = null;
        try {
            this.reader = new BufferedReader(new FileReader(SOC_TEMPERATURE_PATH));
            String line = this.reader.readLine();
            if (line == null) {
                Log.d(TAG, "Unable to read the data from path:/sys/class/thermal/thermal_zone0/temp");
            } else {
                long temperature = Long.parseLong(line);
                if (temperature < 0) {
                    Log.d(TAG, "SocTemperature don`t know");
                } else {
                    DecimalFormat decimalFormat = new DecimalFormat(".0");
                    socTemperature = decimalFormat.format(temperature / 1000.0d) + "°C";
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return socTemperature;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String readCpuUtilization() {
        double totalTime = 0.0d;
        double cpuUtilization = 0.0d;
        try {
            this.reader = new BufferedReader(new FileReader(CPU_UTILIZATION_PATH));
            String line = this.reader.readLine();
            if (line != null) {
                String[] cpuParamValues = line.split("\\s+");
                for (int i = 1; i < cpuParamValues.length; i++) {
                    totalTime += Double.parseDouble(cpuParamValues[i]);
                }
                cpuUtilization = (1.0d - (Double.parseDouble(cpuParamValues[4]) / totalTime)) * 100.0d;
            } else {
                Log.d(TAG, "Unable to read the data from path:/proc/stat");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        DecimalFormat decimalFormat = new DecimalFormat(".00");
        return decimalFormat.format(cpuUtilization) + "%";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String readTFTTemperature() {
        String tftTemperature = null;
        try {
            this.reader = new BufferedReader(new FileReader(TFT_TEMPERATURE_PATH));
            String line = this.reader.readLine();
            if (line == null) {
                Log.d(TAG, "Unable to read the data from path:/sys/bus/iio/devices/iio:device0/in_voltage0_input");
            } else {
                double voltage = Double.parseDouble(line);
                Log.d(TAG, "the data of the path(/sys/bus/iio/devices/iio:device0/in_voltage0_input) is " + voltage);
                if (voltage < 0.0d) {
                    Log.d(TAG, "TFTTemperature don`t know");
                } else {
                    DecimalFormat decimalFormat = new DecimalFormat(".0");
                    double mV = (float) ((voltage / 4096.0d) * 1800.0d);
                    double adVoltage = mV / 1000.0d;
                    if (adVoltage > VOLTAGE_TAG) {
                        double temperature = ((-110.43d) * adVoltage) + 193.08d;
                        tftTemperature = decimalFormat.format(temperature) + "°C";
                    } else if (adVoltage <= VOLTAGE_TAG) {
                        double temperature2 = ((-78.389d) * adVoltage) + 154.31d;
                        tftTemperature = decimalFormat.format(temperature2) + "°C";
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return tftTemperature;
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    class ReadTemperatureThread extends Thread {
        ReadTemperatureThread() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            super.run();
            while (!TemperatureInfoFragment.this.exitThread) {
                try {
                    Message message = new Message();
                    Bundle bundle = new Bundle();
                    bundle.putString("soc", TemperatureInfoFragment.this.readSocTemperature());
                    bundle.putString("cpu", TemperatureInfoFragment.this.readCpuUtilization());
                    bundle.putString("tft", TemperatureInfoFragment.this.readTFTTemperature());
                    message.setData(bundle);
                    TemperatureInfoFragment.this.updateTemperatureHandler.sendMessage(message);
                    sleep(1500L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            Log.d(TemperatureInfoFragment.TAG, "Read temperature thread finished.");
        }
    }

    public void onPause() {
        super.onPause();
        this.exitThread = true;
    }
}
