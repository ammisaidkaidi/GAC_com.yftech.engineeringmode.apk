package com.yftech.engineeringmode.adapter;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.FaultCodeDetailDialog;
import com.yftech.vehicle.internal.adapter.ICarMisc;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: /home/user/work/dex/classes2.dex */
public class FaultCodeAdapter extends BaseAdapter {
    private static final String TAG = "FaultDetail";
    private final Context context;
    private FaultMapping faultMapping;
    private final List<ICarMisc.ErrorCodeInfo> list;

    /* loaded from: /home/user/work/dex/classes2.dex */
    public static class ViewHolder {
        public TextView faultCode;
        public Button faultDetail;
        public TextView faultName;
    }

    public FaultCodeAdapter(Context context, List<ICarMisc.ErrorCodeInfo> list) {
        this.context = context;
        this.list = list;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.list.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int i) {
        return this.list.get(i);
    }

    @Override // android.widget.Adapter
    public long getItemId(int i) {
        return i;
    }

    @Override // android.widget.Adapter
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder;
        final ICarMisc.ErrorCodeInfo codeInfo = (ICarMisc.ErrorCodeInfo) getItem(i);
        this.faultMapping = new FaultMapping();
        if (view == null) {
            viewHolder = new ViewHolder();
            view = LayoutInflater.from(this.context).inflate(R.layout.item_fault, (ViewGroup) null);
            viewHolder.faultCode = (TextView) view.findViewById(R.id.fault_code);
            viewHolder.faultName = (TextView) view.findViewById(R.id.fault_name);
            viewHolder.faultDetail = (Button) view.findViewById(R.id.fault_detail);
            view.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) view.getTag();
        }
        viewHolder.faultCode.setText(this.faultMapping.indexAndCodeMap.get(Integer.valueOf(codeInfo.dtc_index)));
        viewHolder.faultName.setText(this.faultMapping.codeAndFaultMap.get(this.faultMapping.indexAndCodeMap.get(Integer.valueOf(codeInfo.dtc_index))));
        viewHolder.faultDetail.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.adapter.-$$Lambda$FaultCodeAdapter$L43IGu69XGXmRcZ7gkSzFVgJLfI
            @Override // android.view.View.OnClickListener
            public final void onClick(View view2) {
                FaultCodeAdapter.this.lambda$getView$0$FaultCodeAdapter(codeInfo, view2);
            }
        });
        return view;
    }

    public /* synthetic */ void lambda$getView$0$FaultCodeAdapter(ICarMisc.ErrorCodeInfo codeInfo, View viewList) {
        openDialog(codeInfo);
    }

    private void openDialog(ICarMisc.ErrorCodeInfo codeInfo) {
        Log.d(TAG, codeInfo.toString());
        FaultCodeDetailDialog detailDialog = new FaultCodeDetailDialog(this.context, codeInfo);
        detailDialog.show();
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    private static class FaultMapping {
        private Integer[] indexes = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31};
        private String[] codes = {"B27011C", "B27101C", "B27111C", "B27121C", "B27131C", "U007388", "U012987", "U048186", "U014087", "U042286", "U012687", "U042886", "B278187", "U015987", "U045A81", "U015187", "U045281", "B276400", "B271002", "B271102", "B271202", "B271302", "U007480", "U016487", "U015587", "U014687", "U044781", "U042481", "B1B0016", "B1B0017", "B1B4313", "B1B4011"};
        private String[] faults = {"摄像头供电电压异常（屏蔽摄像头故障）", "前摄像头电压异常", "后摄像头电压异常", "左摄像头电压异常", "右摄像头电压异常", "CAN节点离线", "BCS 信号报文丢失", "BCS 信号报文数据异常", "BCM 信号报文丢失", "BCM 信号报文数据异常", "SAS 信号报文丢失", "SAS 信号报文数据异常", "MCU-EMRALD通讯故障", "PAS_1 信号报文丢失", "PAS_1 信号报文数据异常", "SRS 信号报文丢失", "SRS 信号报文数据异常", "LVDS输出故障", "前摄像头没有信号", "后摄像头没有信号", "左摄像头没有信号", "右摄像头没有信号", "进入跛行状态时间过长", "与HVAC丢失通信", "与ICM丢失通信", "与GWM丢失通信", "接收到的GWM节点信号无效", "接收到的HVAC节点信号无效", "电池电压过低", "电池电压过高", "收音天线开路", "收音天线短路到地"};
        public Map<Integer, String> indexAndCodeMap = new HashMap();
        public Map<String, String> codeAndFaultMap = new HashMap();

        public FaultMapping() {
            int i = 0;
            while (true) {
                Integer[] numArr = this.indexes;
                if (i < numArr.length) {
                    this.indexAndCodeMap.put(numArr[i], this.codes[i]);
                    this.codeAndFaultMap.put(this.codes[i], this.faults[i]);
                    i++;
                } else {
                    return;
                }
            }
        }
    }
}
