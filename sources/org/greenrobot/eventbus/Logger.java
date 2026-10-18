package org.greenrobot.eventbus;

import android.os.Looper;
import java.util.logging.Level;
import org.greenrobot.eventbus.android.AndroidLogger;

/* loaded from: /home/user/work/dex/classes.dex */
public interface Logger {
    void log(Level level, String str);

    void log(Level level, String str, Throwable th);

    /* loaded from: /home/user/work/dex/classes.dex */
    public static class JavaLogger implements Logger {
        protected final java.util.logging.Logger logger;

        public JavaLogger(String tag) {
            this.logger = java.util.logging.Logger.getLogger(tag);
        }

        @Override // org.greenrobot.eventbus.Logger
        public void log(Level level, String msg) {
            this.logger.log(level, msg);
        }

        @Override // org.greenrobot.eventbus.Logger
        public void log(Level level, String msg, Throwable th) {
            this.logger.log(level, msg, th);
        }
    }

    /* loaded from: /home/user/work/dex/classes.dex */
    public static class SystemOutLogger implements Logger {
        @Override // org.greenrobot.eventbus.Logger
        public void log(Level level, String msg) {
            System.out.println("[" + level + "] " + msg);
        }

        @Override // org.greenrobot.eventbus.Logger
        public void log(Level level, String msg, Throwable th) {
            System.out.println("[" + level + "] " + msg);
            th.printStackTrace(System.out);
        }
    }

    /* loaded from: /home/user/work/dex/classes.dex */
    public static class Default {
        public static Logger get() {
            if (AndroidLogger.isAndroidLogAvailable() && getAndroidMainLooperOrNull() != null) {
                return new AndroidLogger("EventBus");
            }
            return new SystemOutLogger();
        }

        static Object getAndroidMainLooperOrNull() {
            try {
                return Looper.getMainLooper();
            } catch (RuntimeException e) {
                return null;
            }
        }
    }
}
