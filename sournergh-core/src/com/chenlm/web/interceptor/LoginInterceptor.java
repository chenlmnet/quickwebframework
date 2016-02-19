package com.chenlm.web.interceptor;

import com.chenlm.jpa.model.AUser;
import com.chenlm.jpa.model.Role;
import com.chenlm.web.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private RoleService roleService;

    private String exclude;

    public void setExclude(String exclude) {
        if (exclude != null) {
            this.exclude = exclude.replaceAll("\\s*", "");
        } else {
            this.exclude = exclude;
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = request.getRequestURI();
        if (url.endsWith(".js") || url.endsWith(".css") || url.endsWith(".jpg") || url.endsWith(".zip")) {
            return true;
        }

        if (!(handler instanceof HandlerMethod)) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;

        // 获取方法role权限
        Privilege annotation = handlerMethod.getMethod().getAnnotation(Privilege.class);
        if (annotation == null) // 不需要登录
            return true;
        String roleName = annotation.value();
        Role role = roleService.findRole(roleName);
        if (role == null) {
            role = new Role();
            role.setName(roleName);
            role.setLevel(0l);
            roleService.save(role);
        }
        // 根据注解的用户组进行拦截
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (login == null) { // 未登录
            response.sendRedirect(request.getContextPath() + "/user/login");
            return false;
        } else if (login.getRole() == null) { // 用户组不存在
            response.sendRedirect(request.getContextPath() + "/error/role");
            return false;
        } else if (!login.getRole().hasPrivilege(role)) { // 权限校验不通过
            response.sendRedirect(request.getContextPath() + "/error/forbidden");
            return false;
        }
        return true;
    }

    public String decode(String key) {
        return key;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }

    class Request extends HttpServletRequestWrapper {
        public Request(HttpServletRequest request) {
            super(request);
        }

        @Override
        public String getParameter(String name) {
            // 返回值之前 先进行解码
            return decode(super.getParameter(name));
        }

        @Override
        public String[] getParameterValues(String name) {
            // 返回值之前 先进行解码
            String[] values = super.getParameterValues(name);
            for (int i = 0; i < values.length; i++) {
                values[i] = decode(values[i]);
            }
            return values;
        }
    }
}
