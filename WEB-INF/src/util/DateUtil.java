package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    static final SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
    static final SimpleDateFormat formatYMDHM = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    static final SimpleDateFormat formatYMDHMS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String toYMD(Date date) {
        return formatYMD.format(date);
    }

    public static String toYMDHM(Date date) {
        return formatYMDHM.format(date);
    }

    public static String toYMDHMS(Date date) {
        return formatYMDHMS.format(date);
    }
}
