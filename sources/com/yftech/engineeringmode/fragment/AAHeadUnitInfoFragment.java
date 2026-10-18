package com.yftech.engineeringmode.fragment;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.util.Xml;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.yftech.engineeringmode.R;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: /home/user/work/dex/classes2.dex */
public class AAHeadUnitInfoFragment extends BaseFragment {
    private String TAG = "AAHeadUnitInfoFragment";
    private final String[] XML_TAGS = {"Manufacturer", "Model", "HeadUnitMake", "HeadUnitModel", "DisplayName"};

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.fragment_aa_info, container, false);
        initView(root);
        return root;
    }

    @Override // com.yftech.engineeringmode.fragment.BaseFragment
    public void onResume() {
        super.onResume();
    }

    private void initView(View root) {
        List<Map<String, String>> maps = parseHeadUnitInfoXml(getContext(), this.XML_TAGS);
        Log.w(this.TAG, "initView: " + Arrays.toString(maps.toArray()));
        StringBuilder stringBuilder = new StringBuilder();
        if (maps != null && maps.size() > 0) {
            for (Map<String, String> next : maps) {
                for (Map.Entry<String, String> next1 : next.entrySet()) {
                    String key = next1.getKey();
                    String value = next1.getValue();
                    stringBuilder.append(key + ":" + value + System.lineSeparator());
                }
            }
        }
        if (TextUtils.isEmpty(stringBuilder.toString())) {
            stringBuilder.append("无文件");
        }
        TextView viewById = (TextView) root.findViewById(R.id.aa_info);
        viewById.setText(stringBuilder);
    }

    public static List<Map<String, String>> parseHeadUnitInfoXml(Context context, String[] tags) {
        List<Map<String, String>> resultList = new ArrayList<>();
        File dir = new File("/system/etc/androidauto");
        if (!dir.exists() || !dir.isDirectory()) {
            return resultList;
        }
        File[] files = dir.listFiles(new FilenameFilter() { // from class: com.yftech.engineeringmode.fragment.-$$Lambda$AAHeadUnitInfoFragment$gQ17wePRwuw-8PGgDn9Pq7jB44Q
            @Override // java.io.FilenameFilter
            public final boolean accept(File file, String str) {
                return AAHeadUnitInfoFragment.lambda$parseHeadUnitInfoXml$0(file, str);
            }
        });
        if (files == null || files.length == 0) {
            return resultList;
        }
        for (File file : files) {
            Map<String, String> fileValues = parseSingleXmlFile(file, tags);
            if (!fileValues.isEmpty()) {
                resultList.add(fileValues);
            }
        }
        return resultList;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ boolean lambda$parseHeadUnitInfoXml$0(File dir1, String name) {
        return name.startsWith("headunitinfo") && name.endsWith(".xml");
    }

    private static Map<String, String> parseSingleXmlFile(File file, String[] tags) {
        Map<String, String> resultMap = new HashMap<>();
        try {
            FileInputStream fis = new FileInputStream(file);
            try {
                XmlPullParser parser = Xml.newPullParser();
                parser.setInput(fis, null);
                String currentTag = null;
                for (int eventType = parser.getEventType(); eventType != 1; eventType = parser.next()) {
                    if (eventType == 2) {
                        currentTag = parser.getName();
                    } else if (eventType != 3) {
                        if (eventType == 4 && currentTag != null) {
                            String text = parser.getText().trim();
                            if (!text.isEmpty()) {
                                for (String tag : tags) {
                                    if (tag.equals(currentTag)) {
                                        resultMap.put(tag, text);
                                    }
                                }
                            }
                        }
                    } else {
                        currentTag = null;
                    }
                }
                fis.close();
                return resultMap;
            } catch (Throwable th) {
                try {
                    fis.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
                throw th;
            }
        } catch (IOException | XmlPullParserException e) {
            e.printStackTrace();
            return new HashMap();
        }
    }
}
