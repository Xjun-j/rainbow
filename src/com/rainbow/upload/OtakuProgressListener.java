package com.rainbow.upload;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

public class OtakuProgressListener implements ProgressListener{
	private HttpSession session; 
	
    public OtakuProgressListener() {  
    }  
    
    public OtakuProgressListener(HttpSession _session) {  
        session=_session;  
        ProgressEntity ps = new ProgressEntity();  
        session.setAttribute("upload_ps", ps);  
    } 
    
//	public void setSession(HttpSession session){
//		this.session=session;
//		ProgressEntity status = new ProgressEntity();
//		session.setAttribute("upload_ps", status);
//	}
    
    public void update(long pBytesRead, long pContentLength, int items) {  
        ProgressEntity ps = (ProgressEntity) session.getAttribute("upload_ps");  
        ps.setUploaded(pBytesRead);  
        ps.setTotal(pContentLength);  
        ps.setItems(items);  
        session.setAttribute("upload_ps", ps);  
    }  
}
