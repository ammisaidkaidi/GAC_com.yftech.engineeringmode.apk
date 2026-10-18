package com.yftech.engineeringmode.fragment;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.adapter.AppInfoAdapter;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class AppInfoFragment extends BaseFragment {
    private AppInfoAdapter mAppInfoAdapter;

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_app_info, container, false);
        initView(root);
        return root;
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
        this.mAppInfoAdapter.setPackageInfos(getPackageInfos());
    }

    private void initView(View root) {
        RecyclerView recyclerView = root.findViewById(R.id.recycler_view);
        this.mAppInfoAdapter = new AppInfoAdapter(getContext());
        recyclerView.setAdapter(this.mAppInfoAdapter);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
    }

    private List<PackageInfo> getPackageInfos() {
        Context context = getContext();
        if (context == null) {
            return null;
        }
        return context.getPackageManager().getInstalledPackages(0);
    }
}
