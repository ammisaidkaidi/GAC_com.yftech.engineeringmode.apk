package com.yftech.engineeringmode.adapter;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class AppInfoAdapter extends RecyclerView.Adapter<ViewHolder> {
    private Context mContext;
    private List<PackageInfo> mPackageInfos;
    private PackageManager mPackageManager;

    public AppInfoAdapter(Context context) {
        this.mContext = context;
        this.mPackageManager = this.mContext.getPackageManager();
    }

    public void setPackageInfos(List<PackageInfo> packageInfos) {
        this.mPackageInfos = packageInfos;
        notifyDataSetChanged();
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.item_app_info, viewGroup, false);
        return new ViewHolder(view);
    }

    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        PackageInfo packageInfo = this.mPackageInfos.get(i);
        viewHolder.setAppIcon(packageInfo.applicationInfo.loadIcon(this.mPackageManager));
        viewHolder.setAppName(packageInfo.applicationInfo.loadLabel(this.mPackageManager).toString());
        viewHolder.setAppPackage(packageInfo.packageName);
        viewHolder.setVersionCode("versionCode：" + packageInfo.versionCode);
        viewHolder.setVersionName("versionName：" + packageInfo.versionName);
    }

    public int getItemCount() {
        List<PackageInfo> list = this.mPackageInfos;
        if (list == null) {
            return 0;
        }
        return list.size();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: /home/user/work/dex/classes2.dex */
    public class ViewHolder extends RecyclerView.ViewHolder {
        private ImageView mIvIcon;
        private TextView mTvAppName;
        private TextView mTvAppPackage;
        private TextView mTvVersionCode;
        private TextView mTvVersionName;

        public ViewHolder(View itemView) {
            super(itemView);
            this.mIvIcon = (ImageView) itemView.findViewById(R.id.iv_icon);
            this.mTvAppName = (TextView) itemView.findViewById(R.id.tv_app_name);
            this.mTvAppPackage = (TextView) itemView.findViewById(R.id.tv_app_package);
            this.mTvVersionCode = (TextView) itemView.findViewById(R.id.tv_version_code);
            this.mTvVersionName = (TextView) itemView.findViewById(R.id.tv_version_name);
        }

        public void setAppIcon(Drawable drawable) {
            this.mIvIcon.setBackground(drawable);
        }

        public void setAppName(String appName) {
            this.mTvAppName.setText(appName);
        }

        public void setAppPackage(String appPackage) {
            this.mTvAppPackage.setText(appPackage);
        }

        public void setVersionCode(String versionCode) {
            this.mTvVersionCode.setText(versionCode);
        }

        public void setVersionName(String versionName) {
            this.mTvVersionName.setText(versionName);
        }
    }
}
