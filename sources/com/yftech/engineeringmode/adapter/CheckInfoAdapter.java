package com.yftech.engineeringmode.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.model.CheckInfo;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class CheckInfoAdapter extends RecyclerView.Adapter<ViewHolder> {
    private final List<CheckInfo> mCheckInfos;
    private final Context mContext;

    public CheckInfoAdapter(Context context, List<CheckInfo> checkInfos) {
        this.mContext = context;
        this.mCheckInfos = checkInfos;
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.item_check_info, viewGroup, false);
        return new ViewHolder(view);
    }

    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        CheckInfo checkInfo = this.mCheckInfos.get(i);
        boolean isResultOk = checkInfo.getResult() == 0;
        viewHolder.setName(checkInfo.getName());
        viewHolder.setFileValue(this.mContext.getString(R.string.check_info_file_value, checkInfo.getValue()));
        viewHolder.setDeviceValue(this.mContext.getString(R.string.check_info_device_value, checkInfo.getRealValue()));
        viewHolder.setResult(this.mContext.getString(isResultOk ? R.string.check_info_result_ok : R.string.check_info_result_ng), this.mContext.getColor(isResultOk ? R.color.check_info_result_ok_text_color : R.color.check_info_result_ng_text_color));
    }

    public int getItemCount() {
        List<CheckInfo> list = this.mCheckInfos;
        if (list == null) {
            return 0;
        }
        return list.size();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: /home/user/work/dex/classes2.dex */
    public class ViewHolder extends RecyclerView.ViewHolder {
        private final LinearLayout layout_value;
        private final TextView tv_device_value;
        private final TextView tv_file_value;
        private final TextView tv_name;
        private final TextView tv_result;

        public ViewHolder(View itemView) {
            super(itemView);
            this.layout_value = (LinearLayout) itemView.findViewById(R.id.layout_value);
            this.tv_name = (TextView) itemView.findViewById(R.id.tv_name);
            this.tv_file_value = (TextView) itemView.findViewById(R.id.tv_file_value);
            this.tv_device_value = (TextView) itemView.findViewById(R.id.tv_device_value);
            this.tv_result = (TextView) itemView.findViewById(R.id.tv_result);
        }

        public void setValueVisibility(int visibility) {
            this.layout_value.setVisibility(visibility);
        }

        public void setName(String name) {
            this.tv_name.setText(name);
        }

        public void setFileValue(String value) {
            this.tv_file_value.setText(value);
        }

        public void setDeviceValue(String value) {
            this.tv_device_value.setText(value);
        }

        public void setResult(String result, int textColor) {
            this.tv_result.setText(result);
            this.tv_result.setTextColor(textColor);
        }
    }
}
