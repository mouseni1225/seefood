package member;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;


@WebFilter("/ckeditor/samples/login.jsp")
public class FindUser implements Filter {

    
    public FindUser() {
        
    }

	
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//由於精靈產生Filter的request和response的類別分別為ServletRequest和ServletResponse,
		//                       故先轉型態為HttpServletRequest和HttpServletResponse
		//準備存放訊息
		
		if(request instanceof HttpServletRequest && response instanceof HttpServletResponse){
			HttpServletRequest req=(HttpServletRequest)request;
			HttpServletResponse resp=(HttpServletResponse)response;
			HttpSession session=req.getSession();
//			============================================================
			String cookieName="";
			String user="";
			String password="";
			String rememberMe="false";
			Cookie[] cookies=req.getCookies();
			if(cookies!=null){
				for(int i=0;i<cookies.length;i++){
					cookieName=cookies[i].getName();
					if(cookieName.equals("user")){
						user=cookies[i].getValue();
					}else if(cookieName.equals("password")){
						String temp=cookies[i].getValue();
						if(temp!=null){
							byte[] be=DatatypeConverter.parseBase64Binary(temp);
							if(be!=null){
								password=new String(be);
							}
						}
					}else if(cookieName.equals("rememberMe")){
						rememberMe=cookies[i].getValue();
					}
				}
			}else{
				
			}
			session.setAttribute("rememberMe", rememberMe);
			
			
		}
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
