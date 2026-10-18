package com.yftech.engineeringmode.adapter;

import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.ConfigModifyDialog;
import com.yftech.engineeringmode.util.Utils;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ConfigReadAdapter extends RecyclerView.Adapter<ViewHolder> {
    InputMethodManager inputMethodManager;
    private ConfigModifyDialog mConfigModifyDialog;
    private Context mContext;
    private byte[] mData;

    public ConfigReadAdapter(Context context) {
        this.mContext = context;
        this.inputMethodManager = (InputMethodManager) this.mContext.getSystemService("input_method");
    }

    public void setData(byte[] data) {
        if (data != null) {
            if (this.mData != null) {
                this.mData = null;
            }
            this.mData = new byte[data.length];
            System.arraycopy(data, 0, this.mData, 0, data.length);
            notifyDataSetChanged();
        }
    }

    public byte[] getData() {
        return this.mData;
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.item_config, viewGroup, false);
        return new ViewHolder(view);
    }

    public void onBindViewHolder(final ViewHolder viewHolder, final int positon) {
        viewHolder.mTvPositon.setVisibility(positon < 10 ? 0 : 8);
        viewHolder.mTvPositon.setText(this.mContext.getString(R.string.config_byte) + positon);
        viewHolder.mTvValue.setText(String.format("%02x", Integer.valueOf(this.mData[positon] & 255)));
        if (!Utils.isSupportConfigSetting()) {
            return;
        }
        viewHolder.mLayoutItem.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.adapter.-$$Lambda$ConfigReadAdapter$pT8wxNWuSEfUISmwRdYqn981Mqs
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ConfigReadAdapter.this.lambda$onBindViewHolder$0$ConfigReadAdapter(positon, viewHolder, view);
            }
        });
    }

    public /* synthetic */ void lambda$onBindViewHolder$0$ConfigReadAdapter(int positon, ViewHolder viewHolder, View v) {
        showConfigModifyDialog(positon, viewHolder.mTvPositon.getText().toString(), viewHolder.mTvValue.getText().toString());
    }

    public int getItemCount() {
        byte[] bArr = this.mData;
        if (bArr == null) {
            return 0;
        }
        return bArr.length;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: /home/user/work/dex/classes2.dex */
    public class ViewHolder extends RecyclerView.ViewHolder {
        private View mLayoutItem;
        private TextView mTvPositon;
        private TextView mTvValue;

        public ViewHolder(View itemView) {
            super(itemView);
            this.mLayoutItem = itemView.findViewById(R.id.layout_item);
            this.mTvPositon = (TextView) itemView.findViewById(R.id.tv_positon);
            this.mTvValue = (TextView) itemView.findViewById(R.id.tv_value);
        }
    }

    private void showConfigModifyDialog(int pos, String title, String content) {
        this.mConfigModifyDialog = new ConfigModifyDialog(this.mContext);
        this.mConfigModifyDialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.yftech.engineeringmode.adapter.-$$Lambda$ConfigReadAdapter$uBQEBT-FcvuzhjlcdgGUT1JWStQ
            @Override // android.content.DialogInterface.OnDismissListener
            public final void onDismiss(DialogInterface dialogInterface) {
                ConfigReadAdapter.this.lambda$showConfigModifyDialog$1$ConfigReadAdapter(dialogInterface);
            }
        });
        this.mConfigModifyDialog.setOnConfigModifyDialogListener(new ConfigModifyDialog.OnConfigModifyDialogListener() { // from class: com.yftech.engineeringmode.adapter.-$$Lambda$ConfigReadAdapter$y9ivDAcg7FtOzkOgNqDltjQhW7w
            @Override // com.yftech.engineeringmode.dialog.ConfigModifyDialog.OnConfigModifyDialogListener
            public final void onValue(int i, byte b) {
                ConfigReadAdapter.this.lambda$showConfigModifyDialog$2$ConfigReadAdapter(i, b);
            }
        });
        this.mConfigModifyDialog.show();
        this.mConfigModifyDialog.setView(pos, title, content);
    }

    public /* synthetic */ void lambda$showConfigModifyDialog$1$ConfigReadAdapter(DialogInterface dialog) {
        this.mConfigModifyDialog = null;
    }

    public /* synthetic */ void lambda$showConfigModifyDialog$2$ConfigReadAdapter(int position, byte value) {
        this.mData[position] = value;
        notifyItemChanged(position);
    }
}
