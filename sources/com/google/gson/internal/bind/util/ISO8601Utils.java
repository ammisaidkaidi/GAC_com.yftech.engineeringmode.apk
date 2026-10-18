package com.google.gson.internal.bind.util;

import com.yftech.tbox.sdk.BuildConfig;
import java.text.ParseException;
import java.text.ParsePosition;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: /home/user/work/dex/classes.dex */
public class ISO8601Utils {
    private static final String UTC_ID = "UTC";
    private static final TimeZone TIMEZONE_UTC = TimeZone.getTimeZone(UTC_ID);

    public static String format(Date date) {
        return format(date, false, TIMEZONE_UTC);
    }

    public static String format(Date date, boolean millis) {
        return format(date, millis, TIMEZONE_UTC);
    }

    public static String format(Date date, boolean millis, TimeZone tz) {
        Calendar calendar = new GregorianCalendar(tz, Locale.US);
        calendar.setTime(date);
        int capacity = "yyyy-MM-ddThh:mm:ss".length();
        StringBuilder formatted = new StringBuilder(capacity + (millis ? ".sss".length() : 0) + (tz.getRawOffset() == 0 ? "Z" : "+hh:mm").length());
        padInt(formatted, calendar.get(1), "yyyy".length());
        formatted.append('-');
        padInt(formatted, calendar.get(2) + 1, "MM".length());
        formatted.append('-');
        padInt(formatted, calendar.get(5), "dd".length());
        formatted.append('T');
        padInt(formatted, calendar.get(11), "hh".length());
        formatted.append(':');
        padInt(formatted, calendar.get(12), "mm".length());
        formatted.append(':');
        padInt(formatted, calendar.get(13), "ss".length());
        if (millis) {
            formatted.append('.');
            padInt(formatted, calendar.get(14), "sss".length());
        }
        int offset = tz.getOffset(calendar.getTimeInMillis());
        if (offset != 0) {
            int hours = Math.abs((offset / 60000) / 60);
            int minutes = Math.abs((offset / 60000) % 60);
            formatted.append(offset >= 0 ? '+' : '-');
            padInt(formatted, hours, "hh".length());
            formatted.append(':');
            padInt(formatted, minutes, "mm".length());
        } else {
            formatted.append('Z');
        }
        return formatted.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:85:0x0232  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x024e  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0234  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Date parse(String date, ParsePosition pos) throws ParseException {
        Exception fail;
        String input;
        String msg;
        int year;
        int month;
        int offset;
        int day;
        int hour;
        int minutes;
        int seconds;
        int milliseconds;
        String str;
        int offset2;
        TimeZone timezone;
        int offset3;
        try {
            int offset4 = pos.getIndex();
            int offset5 = offset4 + 4;
            year = parseInt(date, offset4, offset5);
            if (checkOffset(date, offset5, '-')) {
                offset5++;
            }
            int offset6 = offset5 + 2;
            month = parseInt(date, offset5, offset6);
            if (checkOffset(date, offset6, '-')) {
                offset6++;
            }
            offset = offset6 + 2;
            day = parseInt(date, offset6, offset);
            hour = 0;
            minutes = 0;
            seconds = 0;
            milliseconds = 0;
            boolean hasT = checkOffset(date, offset, 'T');
            if (!hasT) {
                try {
                    if (date.length() <= offset) {
                        Calendar calendar = new GregorianCalendar(year, month - 1, day);
                        pos.setIndex(offset);
                        return calendar.getTime();
                    }
                } catch (IndexOutOfBoundsException e) {
                    e = e;
                    fail = e;
                    if (date != null) {
                        input = null;
                    } else {
                        input = '\"' + date + "'";
                    }
                    msg = fail.getMessage();
                    if (msg != null || msg.isEmpty()) {
                        msg = "(" + fail.getClass().getName() + ")";
                    }
                    ParseException ex = new ParseException("Failed to parse date [" + input + "]: " + msg, pos.getIndex());
                    ex.initCause(fail);
                    throw ex;
                } catch (NumberFormatException e2) {
                    e = e2;
                    fail = e;
                    if (date != null) {
                    }
                    msg = fail.getMessage();
                    if (msg != null) {
                    }
                    msg = "(" + fail.getClass().getName() + ")";
                    ParseException ex2 = new ParseException("Failed to parse date [" + input + "]: " + msg, pos.getIndex());
                    ex2.initCause(fail);
                    throw ex2;
                } catch (IllegalArgumentException e3) {
                    e = e3;
                    fail = e;
                    if (date != null) {
                    }
                    msg = fail.getMessage();
                    if (msg != null) {
                    }
                    msg = "(" + fail.getClass().getName() + ")";
                    ParseException ex22 = new ParseException("Failed to parse date [" + input + "]: " + msg, pos.getIndex());
                    ex22.initCause(fail);
                    throw ex22;
                }
            }
            if (hasT) {
                int offset7 = offset + 1;
                int offset8 = offset7 + 2;
                hour = parseInt(date, offset7, offset8);
                if (checkOffset(date, offset8, ':')) {
                    offset8++;
                }
                int offset9 = offset8 + 2;
                minutes = parseInt(date, offset8, offset9);
                if (!checkOffset(date, offset9, ':')) {
                    offset = offset9;
                } else {
                    offset = offset9 + 1;
                }
                if (date.length() > offset) {
                    char c = date.charAt(offset);
                    if (c != 'Z' && c != '+' && c != '-') {
                        int offset10 = offset + 2;
                        int seconds2 = parseInt(date, offset, offset10);
                        seconds = (seconds2 <= 59 || seconds2 >= 63) ? seconds2 : 59;
                        if (checkOffset(date, offset10, '.')) {
                            int offset11 = offset10 + 1;
                            offset = indexOfNonDigit(date, offset11 + 1);
                            int parseEndOffset = Math.min(offset, offset11 + 3);
                            int fraction = parseInt(date, offset11, parseEndOffset);
                            int i = parseEndOffset - offset11;
                            if (i == 1) {
                                milliseconds = fraction * 100;
                            } else if (i == 2) {
                                milliseconds = fraction * 10;
                            } else {
                                milliseconds = fraction;
                            }
                        } else {
                            offset = offset10;
                        }
                    }
                }
            }
        } catch (IllegalArgumentException e4) {
            e = e4;
        } catch (IndexOutOfBoundsException e5) {
            e = e5;
        } catch (NumberFormatException e6) {
            e = e6;
        }
        try {
            if (date.length() <= offset) {
                throw new IllegalArgumentException("No time zone indicator");
            }
            char timezoneIndicator = date.charAt(offset);
            if (timezoneIndicator == 'Z') {
                timezone = TIMEZONE_UTC;
                offset3 = offset + 1;
            } else {
                if (timezoneIndicator != '+' && timezoneIndicator != '-') {
                    throw new IndexOutOfBoundsException("Invalid time zone indicator '" + timezoneIndicator + "'");
                }
                String timezoneOffset = date.substring(offset);
                if (timezoneOffset.length() >= 5) {
                    str = timezoneOffset;
                } else {
                    str = timezoneOffset + "00";
                }
                String timezoneOffset2 = str;
                int offset12 = offset + timezoneOffset2.length();
                if ("+0000".equals(timezoneOffset2)) {
                    offset2 = offset12;
                } else if ("+00:00".equals(timezoneOffset2)) {
                    offset2 = offset12;
                } else {
                    String timezoneId = "GMT" + timezoneOffset2;
                    TimeZone timezone2 = TimeZone.getTimeZone(timezoneId);
                    String act = timezone2.getID();
                    if (act.equals(timezoneId)) {
                        offset2 = offset12;
                    } else {
                        offset2 = offset12;
                        String cleaned = act.replace(":", BuildConfig.FLAVOR);
                        if (!cleaned.equals(timezoneId)) {
                            throw new IndexOutOfBoundsException("Mismatching time zone indicator: " + timezoneId + " given, resolves to " + timezone2.getID());
                        }
                    }
                    timezone = timezone2;
                    offset3 = offset2;
                }
                timezone = TIMEZONE_UTC;
                offset3 = offset2;
            }
            Calendar calendar2 = new GregorianCalendar(timezone);
            calendar2.setLenient(false);
            calendar2.set(1, year);
            calendar2.set(2, month - 1);
            calendar2.set(5, day);
            calendar2.set(11, hour);
            calendar2.set(12, minutes);
            calendar2.set(13, seconds);
            calendar2.set(14, milliseconds);
            pos.setIndex(offset3);
            return calendar2.getTime();
        } catch (IllegalArgumentException e7) {
            e = e7;
            fail = e;
            if (date != null) {
            }
            msg = fail.getMessage();
            if (msg != null) {
            }
            msg = "(" + fail.getClass().getName() + ")";
            ParseException ex222 = new ParseException("Failed to parse date [" + input + "]: " + msg, pos.getIndex());
            ex222.initCause(fail);
            throw ex222;
        } catch (IndexOutOfBoundsException e8) {
            e = e8;
            fail = e;
            if (date != null) {
            }
            msg = fail.getMessage();
            if (msg != null) {
            }
            msg = "(" + fail.getClass().getName() + ")";
            ParseException ex2222 = new ParseException("Failed to parse date [" + input + "]: " + msg, pos.getIndex());
            ex2222.initCause(fail);
            throw ex2222;
        } catch (NumberFormatException e9) {
            e = e9;
            fail = e;
            if (date != null) {
            }
            msg = fail.getMessage();
            if (msg != null) {
            }
            msg = "(" + fail.getClass().getName() + ")";
            ParseException ex22222 = new ParseException("Failed to parse date [" + input + "]: " + msg, pos.getIndex());
            ex22222.initCause(fail);
            throw ex22222;
        }
    }

    private static boolean checkOffset(String value, int offset, char expected) {
        return offset < value.length() && value.charAt(offset) == expected;
    }

    private static int parseInt(String value, int beginIndex, int endIndex) throws NumberFormatException {
        if (beginIndex < 0 || endIndex > value.length() || beginIndex > endIndex) {
            throw new NumberFormatException(value);
        }
        int digit = beginIndex;
        int result = 0;
        if (digit < endIndex) {
            int i = digit + 1;
            int digit2 = Character.digit(value.charAt(digit), 10);
            if (digit2 < 0) {
                throw new NumberFormatException("Invalid number: " + value.substring(beginIndex, endIndex));
            }
            result = -digit2;
            digit = i;
        }
        while (digit < endIndex) {
            int i2 = digit + 1;
            int digit3 = Character.digit(value.charAt(digit), 10);
            if (digit3 < 0) {
                throw new NumberFormatException("Invalid number: " + value.substring(beginIndex, endIndex));
            }
            result = (result * 10) - digit3;
            digit = i2;
        }
        return -result;
    }

    private static void padInt(StringBuilder buffer, int value, int length) {
        String strValue = Integer.toString(value);
        for (int i = length - strValue.length(); i > 0; i--) {
            buffer.append('0');
        }
        buffer.append(strValue);
    }

    private static int indexOfNonDigit(String string, int offset) {
        for (int i = offset; i < string.length(); i++) {
            char c = string.charAt(i);
            if (c < '0' || c > '9') {
                return i;
            }
        }
        int i2 = string.length();
        return i2;
    }
}
