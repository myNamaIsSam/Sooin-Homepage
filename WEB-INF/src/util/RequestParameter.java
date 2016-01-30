package util;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;

public class RequestParameter {

    private HttpServletRequest request;

    public RequestParameter(HttpServletRequest request) throws UnsupportedEncodingException {
        this.request = request;
        request.setCharacterEncoding("UTF-8");
    }

    public String getString(String name, String defaultValue) {
        String s = request.getParameter(name);
        return s == null ? defaultValue : s.trim();
    }

    public int getInt(String name, int defaultValue) {
        String s = request.getParameter(name);
        if (s == null) return defaultValue;
        try {
            return Integer.parseInt(s);
        } catch (NumberFormatException e) {
        }
        return defaultValue;
    }

    public boolean getBoolean(String name, boolean defaultValue) {
        String s = request.getParameter(name);
        if (s == null) return defaultValue;
        s = s.toLowerCase();
        return s.equals("on") || s.equals("true") || s.equals("yes");
    }
    
    public boolean hasValue(String name) {
        return request.getParameter(name) != null;
    }

    public String[] getStringValues(String name) {
        String[] a = request.getParameterValues(name);
        if (a == null) return new String[0];
        return a;
    }

    public int[] getIntValues(String name) {
        String[] slist = request.getParameterValues(name);
        if (slist == null) return new int[0];
        int[] ilist = new int[slist.length];
        for (int i=0; i < slist.length; ++i)
            ilist[i] = Integer.parseInt(slist[i]);
        return ilist;
    }
}