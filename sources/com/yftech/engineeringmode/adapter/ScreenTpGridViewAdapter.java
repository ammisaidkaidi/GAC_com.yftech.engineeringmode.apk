package com.yftech.engineeringmode.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.ScreenTpTestDialog;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class ScreenTpGridViewAdapter extends BaseAdapter implements View.OnLongClickListener {
    private Context context;
    private int heightCount;
    private List<ScreenTpTestDialog.TouchScreenBean> list;
    private int widthCount;

    public ScreenTpGridViewAdapter(Context context, List<ScreenTpTestDialog.TouchScreenBean> list, int wCount, int hCount) {
        this.context = context;
        this.list = list;
        this.widthCount = wCount;
        this.heightCount = hCount;
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
        if (view == null) {
            ViewHolder viewHolder = new ViewHolder();
            view = LayoutInflater.from(this.context).inflate(R.layout.item_screen_tp, (ViewGroup) null);
            viewHolder.title = (TextView) view.findViewById(R.id.screen_tp_content);
            if (i == this.list.size() - 1) {
                viewHolder.title.setText("长按此处退出");
                view.setOnLongClickListener(this);
            } else {
                int i2 = this.widthCount;
                int i3 = this.heightCount;
                if (i == (i3 - 1) * i2) {
                    viewHolder.title.setText("长按此处清除已触摸点");
                    view.setOnLongClickListener(this);
                } else if (i == ((i3 / 2) * i2) - ((i2 / 2) + 1)) {
                    viewHolder.title.setText("滑动屏幕，使色块全部变色");
                } else {
                    viewHolder.title.setText(String.valueOf(i));
                    view.setTag(viewHolder);
                }
            }
        }
        if (this.list.get(i).isSelect()) {
            view.setBackgroundColor(-65536);
        } else if (!this.list.get(i).isSelect()) {
            view.setBackgroundColor(-1);
        }
        return view;
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View view) {
        return false;
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    class ViewHolder {
        public TextView title;

        ViewHolder() {
        }
    }
}
