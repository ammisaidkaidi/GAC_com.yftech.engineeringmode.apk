package com.yftech.engineeringmode.fragment;

import android.net.ConnectivityManager;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.yftech.engineeringmode.BuildConfig;
import com.yftech.engineeringmode.R;

/* loaded from: /home/user/work/dex/classes2.dex */
public class WifiFragment extends BaseFragment {
    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_wifi, container, false);
        initView(root);
        return root;
    }

    private void initView(View root) {
        ((TextView) root.findViewById(R.id.wifi_switch_status)).setText(getWifiSwitchStatus());
        ((TextView) root.findViewById(R.id.wifi_connect_status)).setText(String.valueOf(getWifiConnectStatus()));
        ((TextView) root.findViewById(R.id.wifi_name)).setText(getWifiName());
        ((TextView) root.findViewById(R.id.IP_address)).setText(getIPaddress());
        ((TextView) root.findViewById(R.id.Internet_ID)).setText(String.valueOf(getInternetId()));
        ((TextView) root.findViewById(R.id.wifi_connect_speed)).setText(String.valueOf(getConnectSpeed()));
        ((TextView) root.findViewById(R.id.wifi_signal_strength)).setText(String.valueOf(getWifiSignalStrength()));
        ((TextView) root.findViewById(R.id.mac_address)).setText(getMacAddress());
        ((TextView) root.findViewById(R.id.client_status_information)).setText(String.valueOf(getClientStatusInfo()));
    }

    private String getWifiSwitchStatus() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        wifiManager.getConnectionInfo();
        System.out.println(wifiManager.getWifiState());
        int wifiState = wifiManager.getWifiState();
        if (wifiState == 0) {
            return getString(R.string.wifi_closing);
        }
        if (wifiState == 1) {
            return getString(R.string.wifi_closed);
        }
        if (wifiState == 2) {
            return getString(R.string.wifi_opening);
        }
        if (wifiState == 3) {
            return getString(R.string.wifi_opened);
        }
        return null;
    }

    private String getWifiConnectStatus() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        if (wifiManager.getWifiState() == 3) {
            ConnectivityManager connectivityManager = (ConnectivityManager) getContext().getSystemService("connectivity");
            connectivityManager.getNetworkInfo(1);
            return getString(R.string.wifi_connected);
        }
        return getString(R.string.wifi_disconnect);
    }

    private String getWifiName() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        WifiInfo wifiInfo = wifiManager.getConnectionInfo();
        return wifiInfo.getSSID().replace("\"", BuildConfig.FLAVOR).replace("\"", BuildConfig.FLAVOR);
    }

    private String getIPaddress() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        WifiInfo wifiInfo = wifiManager.getConnectionInfo();
        int ipAddress = wifiInfo.getIpAddress();
        if (ipAddress == 0) {
            return getString(R.string.wifi_disconnect_wifi);
        }
        return (ipAddress & 255) + "." + ((ipAddress >> 8) & 255) + "." + ((ipAddress >> 16) & 255) + "." + ((ipAddress >> 24) & 255);
    }

    private int getInternetId() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        WifiInfo wifiinfo = wifiManager.getConnectionInfo();
        return wifiinfo.getNetworkId();
    }

    private String getConnectSpeed() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        WifiInfo wifiInfo = wifiManager.getConnectionInfo();
        int LinkSpeed = wifiInfo.getLinkSpeed();
        if (LinkSpeed != 0) {
            int speed = wifiInfo.getLinkSpeed();
            return speed + "Mbps";
        }
        return String.valueOf(LinkSpeed);
    }

    private String getWifiSignalStrength() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        WifiInfo info = wifiManager.getConnectionInfo();
        return info.getRssi() + "dBm";
    }

    private String getMacAddress() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        WifiInfo info = wifiManager.getConnectionInfo();
        String MacAddress = info.getMacAddress();
        return MacAddress;
    }

    private SupplicantState getClientStatusInfo() {
        WifiManager wifiManager = (WifiManager) getContext().getSystemService("wifi");
        WifiInfo wifiInfo = wifiManager.getConnectionInfo();
        return wifiInfo.getSupplicantState();
    }
}
