package core;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

public class ManagerService {
private static final String CURRENT_USER = "CURRENT_USER";
    
    public static void login(HttpSession session, Manager manager) throws Exception{
    	session.setAttribute(CURRENT_USER, manager);
    }
    
    public static void logout(HttpSession session){
    	session.removeAttribute(CURRENT_USER);
    }
    
    public static Manager getCurrentManager(HttpSession session){
    	return (Manager)session.getAttribute(CURRENT_USER);
    }
    
    public static String getCurrentUserName(HttpSession session){
    	Manager manager = (Manager)session.getAttribute(CURRENT_USER);
    	return manager == null ? "¼Õ´Ô" : "°ü¸®ÀÚ";
    }
    
    public static boolean isCurrentUserLoggedIn(HttpSession session){
    	return session.getAttribute(CURRENT_USER) != null;
    }

    public static String encryptPasswd(String passwd) throws NoSuchAlgorithmException{
    	MessageDigest md = MessageDigest.getInstance("MD5");
    	byte[] passBytes = passwd.getBytes();
    	md.reset();
    	byte[] digested = md.digest(passBytes);
    	StringBuffer sb = new StringBuffer();
    	for(int i=0; i<digested.length; i++){
    		sb.append(Integer.toHexString(0xff & digested[i]));
    	}
    	System.out.println(sb);
    	return sb.toString();
    }
    
    public static String makeTempPassword(){
    	String s = "a";
    	for(int i=0; i<4; i++){
    		s += (int)(Math.random() * 10) % 10;
    	}
    	return s;
    }
}
