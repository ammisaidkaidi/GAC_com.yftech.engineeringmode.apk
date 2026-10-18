package com.yftech.engineeringmode.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.yftech.car.media.data.entity.MediaFile;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.dialog.MediaDialog;
import java.util.List;

/* loaded from: /home/user/work/dex/classes2.dex */
public class USBFileAdapter extends BaseAdapter {
    private static final String TAG = USBFileAdapter.class.getSimpleName();
    private final Context context;
    private final LayoutInflater inflater;
    private final List<MediaFile> mediaFileList;
    private final int usbIndex;

    public USBFileAdapter(Context context, List<MediaFile> list, int usbIndex) {
        this.context = context;
        this.mediaFileList = list;
        this.usbIndex = usbIndex;
        this.inflater = LayoutInflater.from(context);
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.mediaFileList.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.mediaFileList.get(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    public View getView(final int position, View convertView, ViewGroup parent) {
        View convertView2 = this.inflater.inflate(R.layout.item_usb_file, (ViewGroup) null);
        TextView media = (TextView) convertView2.findViewById(R.id.usb_media);
        media.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.adapter.-$$Lambda$USBFileAdapter$5f1_THVxccH0ip1-mcOfkGMtIIo
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                USBFileAdapter.this.lambda$getView$0$USBFileAdapter(position, view);
            }
        });
        media.setText(this.mediaFileList.get(position).getFileName());
        media.setOnClickListener(new View.OnClickListener() { // from class: com.yftech.engineeringmode.adapter.USBFileAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                MediaDialog mediaDialog = new MediaDialog(USBFileAdapter.this.context, (MediaFile) USBFileAdapter.this.mediaFileList.get(position), USBFileAdapter.this.usbIndex);
                mediaDialog.show();
                mediaDialog.getWindow();
            }
        });
        return convertView2;
    }

    public /* synthetic */ void lambda$getView$0$USBFileAdapter(int position, View v) {
        openMedia(this.mediaFileList.get(position));
    }

    private void openMedia(MediaFile mediaFile) {
        MediaDialog mediaDialog = new MediaDialog(this.context, mediaFile, this.usbIndex);
        mediaDialog.show();
    }
}
