package com.example.DurePRteam.listener;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionConfig implements HttpSessionListener {

private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();

	//중복로그인 지우기
	public synchronized static String getSessionidCheck(String type, String compareId){
		//System.out.println("getSessionidCheck_type : " + type );
		//System.out.println("getSessionidCheck_compareId : " + compareId );

		String result = "";
		//System.out.println("sessions.keySet()" + sessions.keySet());
		for( String key : sessions.keySet() ){
			HttpSession hs = sessions.get(key);

			if(hs != null &&  hs.getAttribute(type) != null && hs.getAttribute(type).toString().equals(compareId) ){
				result =  key.toString();
				System.out.println("result : " + result);
			}
		}
		removeSessionForDoubleLogin(result);
		return result;
	}

	private static void removeSessionForDoubleLogin(String userId){
		//System.out.println("remove userId : " + userId);
		if(userId != null && userId.length() > 0){
			System.out.println("세션으로 아이디가 들어옴");
			sessions.get(userId).invalidate();
			sessions.remove(userId);
		}
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("sessionCreated" + se);
	    sessions.put(se.getSession().getId(), se.getSession());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		if(sessions.get(se.getSession().getId()) != null){
			sessions.get(se.getSession().getId()).invalidate();
			sessions.remove(se.getSession().getId());
		}
	}

}
