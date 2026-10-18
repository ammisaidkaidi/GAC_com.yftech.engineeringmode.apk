package com.yftech.engineeringmode.util;

import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;

/* loaded from: /home/user/work/dex/classes2.dex */
public class DeleteUtil {
    private static String TAG = "DeleteUtil";

    public static boolean delete(String delFile) {
        File file = new File(delFile);
        if (!file.exists()) {
            Log.i(TAG, "删除文件失败:" + delFile + "不存在！");
            return false;
        }
        if (file.isFile()) {
            return deleteSingleFile(delFile);
        }
        return deleteDirectory(delFile);
    }

    private static boolean deleteSingleFile(String filePath$Name) {
        File file = new File(filePath$Name);
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                Log.e("--Method--", "Copy_Delete.deleteSingleFile: 删除单个文件" + filePath$Name + "成功！");
                return true;
            }
            Log.i(TAG, "删除单个文件" + filePath$Name + "失败");
            return false;
        }
        Log.i(TAG, "删除单个文件失败：" + filePath$Name + "不存在!");
        return false;
    }

    private static boolean deleteDirectory(String filePath) {
        boolean flag;
        if (!filePath.endsWith(File.separator)) {
            filePath = filePath + File.separator;
        }
        File dirFile = new File(filePath);
        if (!dirFile.exists() || !dirFile.isDirectory()) {
            Log.i(TAG, "删除目录失败：" + filePath + "不存在！");
            return false;
        }
        File[] files = dirFile.listFiles();
        if (files != null) {
            flag = true;
            for (File file : files) {
                if (file.isFile()) {
                    flag = deleteSingleFile(file.getAbsolutePath());
                    if (!flag) {
                        break;
                    }
                } else {
                    if (file.isDirectory() && !(flag = deleteDirectory(file.getAbsolutePath()))) {
                        break;
                    }
                }
            }
        } else {
            flag = true;
        }
        if (!flag) {
            Log.i(TAG, "deleteDirectory: 删除目录失败！");
            return false;
        }
        if (dirFile.delete()) {
            Log.e("--Method--", "Copy_Delete.deleteDirectory: 删除目录" + filePath + "成功！");
            return true;
        }
        Log.i(TAG, "删除目录：" + filePath + "失败！");
        return false;
    }

    public static void deleFotaData() {
        DirectoryStream<Path> stream;
        Path fotaDir = Paths.get("/cache/fota/", new String[0]);
        try {
            if (Files.exists(fotaDir, new LinkOption[0]) && Files.isDirectory(fotaDir, new LinkOption[0])) {
                stream = Files.newDirectoryStream(fotaDir);
                try {
                    for (Path entry : stream) {
                        deleteEntry(entry);
                    }
                    if (stream != null) {
                        stream.close();
                    }
                    Log.i(TAG, "已成功删除 " + fotaDir + " 目录下的所有内容。");
                } finally {
                    if (stream != null) {
                        try {
                            stream.close();
                        } catch (Throwable th) {
                            th.addSuppressed(th);
                        }
                    }
                }
            } else {
                Log.i(TAG, "目录不存在或不是一个目录: " + fotaDir);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        Path fotaDir1 = Paths.get("/sdcard/fota/", new String[0]);
        try {
            if (Files.exists(fotaDir1, new LinkOption[0]) && Files.isDirectory(fotaDir1, new LinkOption[0])) {
                stream = Files.newDirectoryStream(fotaDir1);
                try {
                    for (Path entry2 : stream) {
                        deleteEntry(entry2);
                    }
                    if (stream != null) {
                        stream.close();
                    }
                    Log.i(TAG, "已成功删除 " + fotaDir1 + " 目录下的所有内容。");
                } finally {
                }
            } else {
                Log.i(TAG, "目录不存在或不是一个目录: " + fotaDir1);
            }
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        File file = new File("/crypto/fota/VersionFeatures.txt");
        if (file.exists()) {
            file.delete();
            Log.i(TAG, "已成功删除 " + file.getPath());
        }
    }

    private static void deleteEntry(Path entry) throws IOException {
        if (Files.isDirectory(entry, new LinkOption[0])) {
            DirectoryStream<Path> stream = Files.newDirectoryStream(entry);
            try {
                for (Path subEntry : stream) {
                    deleteEntry(subEntry);
                }
                if (stream != null) {
                    stream.close();
                }
            } catch (Throwable th) {
                if (stream != null) {
                    try {
                        stream.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        }
        Files.delete(entry);
    }
}
