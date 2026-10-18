package com.yftech.engineeringmode.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: /home/user/work/dex/classes2.dex */
public class Copier {
    private final CopyProgressCallback mCallback;
    private long mCurSize;
    private boolean mIsCopyFile;
    private long mTotalSize;

    /* loaded from: /home/user/work/dex/classes2.dex */
    public interface CopyProgressCallback {
        void onProgress(int i);
    }

    private Copier(CopyProgressCallback callback) {
        this.mCallback = callback;
    }

    private int getDirectoryFileCount(File dir) {
        if (!dir.isDirectory()) {
            return 0;
        }
        int fileCount = 0;
        File[] files = dir.listFiles();
        for (File f : files) {
            if (f.isDirectory()) {
                fileCount += getDirectoryFileCount(f);
            } else {
                fileCount++;
            }
        }
        return fileCount;
    }

    private boolean copyFile(File src, File dst) {
        if (!src.exists() || src.isDirectory() || (dst.exists() && !dst.isDirectory())) {
            return false;
        }
        if (!dst.exists() && !dst.mkdirs()) {
            return false;
        }
        String fileName = src.getName();
        File dstFile = new File(dst.getPath(), fileName);
        if (dstFile.exists()) {
            dstFile.delete();
        }
        boolean ret = true;
        byte[] buf = new byte[1048576];
        FileInputStream in = null;
        FileOutputStream out = null;
        try {
            try {
                try {
                    try {
                        in = new FileInputStream(src);
                        out = new FileOutputStream(dstFile);
                        while (true) {
                            int count = in.read(buf);
                            if (count != -1) {
                                out.write(buf, 0, count);
                                if (this.mIsCopyFile) {
                                    this.mCurSize += count;
                                    if (this.mCallback != null) {
                                        if (this.mCurSize >= this.mTotalSize) {
                                            this.mCallback.onProgress(100);
                                        } else {
                                            this.mCallback.onProgress((int) ((this.mCurSize * 100) / this.mTotalSize));
                                        }
                                    }
                                }
                            } else {
                                try {
                                    break;
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                        in.close();
                        out.close();
                    } catch (FileNotFoundException e2) {
                        e2.printStackTrace();
                        ret = false;
                        if (in != null) {
                            try {
                                in.close();
                            } catch (IOException e3) {
                                e3.printStackTrace();
                            }
                        }
                        if (out != null) {
                            out.close();
                        }
                    }
                } catch (IOException e4) {
                    e4.printStackTrace();
                    ret = false;
                    if (in != null) {
                        try {
                            in.close();
                        } catch (IOException e5) {
                            e5.printStackTrace();
                        }
                    }
                    if (out != null) {
                        out.close();
                    }
                }
            } catch (IOException e6) {
                e6.printStackTrace();
            }
            if (ret) {
                dstFile.setReadable(src.canRead());
                dstFile.setWritable(src.canWrite());
                dstFile.setExecutable(dst.canExecute());
            }
            return ret;
        } finally {
        }
    }

    private boolean copyDirectory(File src, File dst) {
        if (!src.exists() || !src.isDirectory() || (dst.exists() && !dst.isDirectory())) {
            return false;
        }
        if (!dst.exists() && !dst.mkdirs()) {
            return false;
        }
        String dirName = src.getName();
        File dstDir = new File(dst.getPath(), dirName);
        if ((dstDir.exists() && !dstDir.delete()) || !dstDir.mkdir()) {
            return false;
        }
        dstDir.setReadable(src.canRead());
        dstDir.setWritable(src.canWrite());
        dstDir.setExecutable(src.canExecute());
        File[] files = src.listFiles();
        if (files == null) {
            return true;
        }
        for (File f : files) {
            if (f.isDirectory()) {
                if (!copyDirectory(f, dstDir)) {
                    return false;
                }
            } else {
                if (!copyFile(f, dstDir)) {
                    return false;
                }
                if (!this.mIsCopyFile) {
                    this.mCurSize++;
                    CopyProgressCallback copyProgressCallback = this.mCallback;
                    if (copyProgressCallback != null) {
                        long j = this.mCurSize;
                        long j2 = this.mTotalSize;
                        if (j >= j2) {
                            copyProgressCallback.onProgress(100);
                        } else {
                            copyProgressCallback.onProgress((int) ((j * 100) / j2));
                        }
                    }
                }
            }
        }
        return true;
    }

    private boolean copy(File src, File dst) {
        CopyProgressCallback copyProgressCallback;
        if (src == null || !src.exists() || dst == null) {
            return false;
        }
        if (src.isDirectory()) {
            this.mIsCopyFile = false;
            this.mTotalSize = getDirectoryFileCount(src);
            this.mCurSize = 0L;
            boolean ret = copyDirectory(src, dst);
            if (ret && this.mTotalSize == 0 && (copyProgressCallback = this.mCallback) != null) {
                copyProgressCallback.onProgress(100);
            }
            return ret;
        }
        this.mIsCopyFile = true;
        this.mTotalSize = src.length();
        this.mCurSize = 0L;
        return copyFile(src, dst);
    }

    private boolean copy(File[] srcList, File dst) {
        if (srcList == null || dst == null || (dst.exists() && !dst.isDirectory())) {
            return false;
        }
        if (srcList.length == 0) {
            return true;
        }
        for (File f : srcList) {
            if (f != null) {
                if (!f.exists() || f.isDirectory()) {
                    return false;
                }
                this.mTotalSize += f.length();
            }
        }
        if (!dst.exists() && !dst.mkdirs()) {
            return false;
        }
        this.mCurSize = 0L;
        this.mIsCopyFile = true;
        for (File f2 : srcList) {
            if (f2 != null && !copyFile(f2, dst)) {
                return false;
            }
        }
        return true;
    }

    public static boolean copy(File src, File dst, CopyProgressCallback callback) {
        Copier copier = new Copier(callback);
        return copier.copy(src, dst);
    }

    public static boolean copy(File[] srcList, File dst, CopyProgressCallback callback) {
        Copier copier = new Copier(callback);
        return copier.copy(srcList, dst);
    }
}
