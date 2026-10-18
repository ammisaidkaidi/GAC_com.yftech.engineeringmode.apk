package com.yftech.engineeringmode.fragment;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.yftech.car.media.data.CarMediaDataManager;
import com.yftech.car.media.data.entity.MediaFile;
import com.yftech.car.media.music.CarMusicManager;
import com.yftech.engineeringmode.R;
import com.yftech.engineeringmode.adapter.USBFileAdapter;
import com.yftech.engineeringmode.util.AppConstants;
import java.util.ArrayList;
import java.util.List;
import org.greenrobot.eventbus.EventBus;

/* loaded from: /home/user/work/dex/classes2.dex */
public class USBTestFragment extends BaseFragment implements View.OnClickListener {
    private static final String TAG = USBTestFragment.class.getSimpleName();
    private USBFileAdapter adapter;
    private int index;
    private ListView musicListview;
    private String music_source;
    private TextView selectingTextview;
    private int usb;
    private boolean usbState;
    private View usb_1;
    private View usb_2;
    private ListView videoListView;
    private Handler updateListViewHandler = new Handler() { // from class: com.yftech.engineeringmode.fragment.USBTestFragment.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            USBTestFragment uSBTestFragment = USBTestFragment.this;
            uSBTestFragment.adapter = new USBFileAdapter(uSBTestFragment.getContext(), USBTestFragment.this.musicList, USBTestFragment.this.usb);
            USBTestFragment.this.musicListview.setAdapter((ListAdapter) USBTestFragment.this.adapter);
            USBTestFragment uSBTestFragment2 = USBTestFragment.this;
            uSBTestFragment2.adapter = new USBFileAdapter(uSBTestFragment2.getContext(), USBTestFragment.this.videoList, USBTestFragment.this.usb);
            USBTestFragment.this.videoListView.setAdapter((ListAdapter) USBTestFragment.this.adapter);
        }
    };
    private final CarMusicManager.CarMusicControlCallback callback = new CarMusicManager.CarMusicControlCallback() { // from class: com.yftech.engineeringmode.fragment.USBTestFragment.2
        public void onChangePlayMusic(MediaFile musicFile) {
            if ((AppConstants.MUSIC_SOURCE_OF_USB1.equals(USBTestFragment.this.music_source) || AppConstants.MUSIC_SOURCE_OF_USB2.equals(USBTestFragment.this.music_source)) && musicFile != null) {
                String path = musicFile.getData();
                CarMusicManager.getInstance().getMusicAlbumBitmap(path, 224, 224);
            }
        }
    };
    private List<MediaFile> musicList = new ArrayList();
    private List<MediaFile> videoList = new ArrayList();
    private CarMediaDataManager.OnDataChangeCallback changeCallback = new CarMediaDataManager.OnDataChangeCallback() { // from class: com.yftech.engineeringmode.fragment.USBTestFragment.3
        public void onUsbStatusChange(int usbIndex, boolean isUsbExists) {
            super.onUsbStatusChange(usbIndex, isUsbExists);
            USBTestFragment.this.usb = usbIndex;
            USBTestFragment.this.usbState = isUsbExists;
            Log.i(USBTestFragment.TAG, "Usb下标-->" + usbIndex);
            Log.i(USBTestFragment.TAG, "onUsbStatusChange: " + isUsbExists);
            Message message = new Message();
            message.obj = Integer.valueOf(usbIndex);
            if (usbIndex == 0) {
                USBTestFragment.this.usb_1.setEnabled(true);
            } else if (usbIndex == 1) {
                USBTestFragment.this.usb_2.setEnabled(true);
            }
            USBTestFragment.this.index = usbIndex;
            USBTestFragment.access$1108(USBTestFragment.this);
            if (!isUsbExists) {
                Toast.makeText(USBTestFragment.this.getContext(), "USB " + USBTestFragment.access$1108(USBTestFragment.this) + " IS UNCONNECTED", 0).show();
                USBTestFragment.this.usb_1.setEnabled(false);
                USBTestFragment.this.usb_2.setEnabled(false);
                USBTestFragment.this.clearListView();
                return;
            }
            if (isUsbExists) {
                Toast.makeText(USBTestFragment.this.getContext(), "USB " + USBTestFragment.access$1108(USBTestFragment.this) + " IS CONNECTED", 0).show();
            }
        }
    };

    static /* synthetic */ int access$1108(USBTestFragment x0) {
        int i = x0.index;
        x0.index = i + 1;
        return i;
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    public class UsbInfomationReceiveer extends BroadcastReceiver {
        public static final String ACTION_USB_STATUS_CHANGE_IN_PHOTO_AND_VIDEO = "ACTION_USB_STATUS_CHANGE_IN_PHOTO_AND_VIDEO";
        public final String TAG = UsbInfomationReceiveer.class.getName();

        public UsbInfomationReceiveer() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (!((action.hashCode() == -1314300526 && action.equals(ACTION_USB_STATUS_CHANGE_IN_PHOTO_AND_VIDEO)) ? false : -1)) {
                int usbIndex = intent.getIntExtra("usbIndex", -1);
                boolean isUsbExists = intent.getBooleanExtra("isUsbExists", false);
                EventBus.getDefault().post(new USBStateForPhotoAndVideoEvent(usbIndex, isUsbExists));
            }
        }
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        CarMediaDataManager.getInstance().registerCarDataControlCallback(this.changeCallback);
        super.onResume();
        if (AppConstants.MUSIC_SOURCE_OF_USB1.equals(this.music_source) || AppConstants.MUSIC_SOURCE_OF_USB2.equals(this.music_source)) {
            CarMusicManager.getInstance().getPlayMusic();
            CarMusicManager.getInstance().getCurrentPlayProgress();
            CarMusicManager.getInstance().play();
            CarMusicManager.getInstance().requestPlay(true);
        }
    }

    public void onPause() {
        CarMediaDataManager.getInstance().unregisterCarDataControlCallback(this.changeCallback);
        super.onPause();
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_usb_test, container, false);
        initView(root);
        CarMediaDataManager.getInstance().isUsbExists(0);
        return root;
    }

    private void initView(View root) {
        root.findViewById(R.id.view_usb).setOnClickListener(this);
        root.findViewById(R.id.view_usb2).setOnClickListener(this);
        this.musicListview = (ListView) root.findViewById(R.id.listview_usb_music);
        this.videoListView = (ListView) root.findViewById(R.id.listview_usb_video);
        this.usb_1 = root.findViewById(R.id.view_usb);
        this.usb_2 = root.findViewById(R.id.view_usb2);
        List<String> parms = CarMediaDataManager.getInstance().getExistUdiskList();
        for (String o : parms) {
            int i = CarMediaDataManager.getInstance().getUsbIndex(o);
            if (i == 0) {
                this.usb_1.setEnabled(true);
                this.usb_2.setEnabled(false);
            } else if (i == 1) {
                this.usb_2.setEnabled(true);
                this.usb_1.setEnabled(false);
            } else if (i == Integer.parseInt(null)) {
                this.usb_1.setEnabled(false);
                this.usb_2.setEnabled(false);
            } else {
                this.usb_1.setEnabled(true);
                this.usb_2.setEnabled(true);
            }
            this.usb = i;
        }
        if (CarMediaDataManager.getInstance().isUsbExists(this.usb)) {
            int i2 = this.usb;
            if (i2 == 0) {
                this.usb_1.setEnabled(true);
            } else if (i2 == 1) {
                this.usb_2.setEnabled(true);
            } else {
                this.usb_1.setEnabled(false);
                this.usb_2.setEnabled(false);
            }
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.view_usb /* 2131296674 */:
            case R.id.view_usb2 /* 2131296675 */:
                getMusic();
                getVideo();
                this.updateListViewHandler.sendEmptyMessage(1);
                return;
            default:
                return;
        }
    }

    /* loaded from: /home/user/work/dex/classes2.dex */
    public class USBStateForPhotoAndVideoEvent {
        public boolean isUsbExists;
        public int usbIndex;

        public USBStateForPhotoAndVideoEvent(int usbIndex, boolean isUsbExists) {
            this.usbIndex = usbIndex;
            this.isUsbExists = isUsbExists;
        }

        public String toString() {
            return "usbIndex=" + this.usbIndex + ", isUsbExists=" + this.isUsbExists;
        }
    }

    private void getMusic() {
        this.musicList = CarMediaDataManager.getInstance().getFileMusic(this.usb);
        for (MediaFile mediaFile : this.musicList) {
            System.out.println(mediaFile.getFileName());
        }
    }

    private void getVideo() {
        this.videoList = CarMediaDataManager.getInstance().getFileVideo(this.usb);
        for (MediaFile mediaFile : this.videoList) {
            System.out.println(mediaFile.getFileName());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearListView() {
        this.musicList.clear();
        this.videoList.clear();
        this.musicListview.setAdapter((ListAdapter) this.adapter);
        this.videoListView.setAdapter((ListAdapter) this.adapter);
    }
}
