package com.zzdc.iotloc.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

//当前用户是否登录拦截器
//放在需要的action上
public class UserLoginInterceptor implements Interceptor{
	private static final long serialVersionUID = 1593745236481514166L;
	private static final Logger LOGGER = LogManager.getLogger(UserLoginInterceptor.class);
	public void destroy() {
	}

	public void init() {
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();
		// 获取session
		Map<String, Object> session = context.getSession();
		Object user = session.get("loginUser");
		// 用户还未登陆
		if (user == null) {
			LOGGER.info("当前浏览器没有用户登录>>>>>>>>>>>>>>>>>>>>>>>>>");
			// 获取HttpServletRequest对象
			HttpServletRequest req = ServletActionContext.getRequest();
			// 获取此请求的地址，请求地址包含application name，进行subString操作，去除application name
			String path = req.getRequestURI().substring(10);
			// 获得请求中的参数
			String queryString = req.getQueryString();
			// 预防空指针
			if (queryString == null) {
				queryString = "";
			}
			// 拼凑得到登陆之前的地址
			String realPath = path + "?" +queryString;
			LOGGER.info("realPath>>>>>>>>>>>>>>>>"+realPath);
			// 存入session，方便调用
			session.put("prePage", realPath);
			return "loginAuth";//返回到登录页面
		}
		// 用户已经登陆，放行
		return invocation.invoke();
	}
}
