package com.yftech.engineeringmode.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.model.Module;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ModuleAdapter extends RecyclerView.Adapter<ViewHolder> {
    private OnItemClickListener listener;
    private List<Module> modules;

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface OnItemClickListener {
        void onItemClick(View view, int i, Module module);
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    public class ViewHolder extends RecyclerView.ViewHolder {
        Button button;

        public ViewHolder(View view) {
            super(view);
            this.button = (Button) view.findViewById(R.id.button);
        }
    }

    public ModuleAdapter(List<Module> list) {
        this.modules = list;
    }

    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_module, parent, false);
        ViewHolder holder = new ViewHolder(view);
        return holder;
    }

    public void onBindViewHolder(final ViewHolder holder, int position) {
        Module module = this.modules.get(position);
        holder.button.setText(module.getName());
        holder.button.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.adapter.-$$Lambda$ModuleAdapter$aMpvB38uQR_K_Yp24KW8-1zmOp0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ModuleAdapter.this.lambda$onBindViewHolder$0$ModuleAdapter(holder, view);
            }
        });
    }

    public /* synthetic */ void lambda$onBindViewHolder$0$ModuleAdapter(ViewHolder holder, View v) {
        int pos;
        if (this.listener != null && (pos = holder.getAdapterPosition()) >= 0 && pos < this.modules.size()) {
            this.listener.onItemClick(v, pos, this.modules.get(pos));
        }
    }

    public int getItemCount() {
        return this.modules.size();
    }

    public void setOnItemClickListener(OnItemClickListener listener) {
        this.listener = listener;
    }
}
