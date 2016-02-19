package com.chenlm.web.service.aspact;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/**
 * 权限管理
 * Created by chenlm on 15-12-13.
 */
@Component
@Aspect
public class AuthAspect {
    @Pointcut("execution(* com.chenlm.web.controller.*Controller.*(..))")
    public void pointCut() {
    }

    @After("pointCut()")
    public void after(JoinPoint joinPoint) {
        System.out.println("after aspect executed");
    }

    @Before("pointCut()")
    public void before(JoinPoint joinPoint) {
        //如果需要这里可以取出参数进行处理
        //Object[] args = joinPoint.getArgs();
        System.out.println("before aspect executing");
        HttpServletRequest requet = getRequet(joinPoint);
        System.out.println("requet = " + requet);
        Signature signature = joinPoint.getSignature();
        System.out.println("signature = " + signature);
        Object aThis = joinPoint.getThis();
        System.out.println("aThis = " + aThis);
        Annotation methodAnnotation = getMethodAnnotation(joinPoint, RequestMapping.class);
        System.out.println("methodAnnotation = " + methodAnnotation);
    }

    @AfterReturning(pointcut = "pointCut()", returning = "returnVal")
    public void afterReturning(JoinPoint joinPoint, Object returnVal) {
        System.out.println("afterReturning executed, return result is "
                + returnVal);
    }

    @Around("pointCut()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        System.out.println("around start..");
        try {
            return pjp.proceed();
        } catch (Throwable ex) {
            System.out.println("error in around");
            throw ex;
        } finally {
            System.out.println("around end");
        }
    }

    @AfterThrowing(pointcut = "pointCut()", throwing = "error")
    public void afterThrowing(JoinPoint jp, Throwable error) {
        System.out.println("error:" + error);
    }

    /**
     * 获取当前拦截对象的request请求对象
     *
     * @param pjp
     * @return
     */
    private HttpServletRequest getRequet(JoinPoint pjp) {
        Object target = pjp.getTarget();
        HttpServletRequest retValue;
        try {
            Method reqMethod = target.getClass().getMethod("getRequest");
            retValue = (HttpServletRequest) reqMethod.invoke(target);
        } catch (Exception e) {
            return null;
        }
        return retValue;
    }

    private <T extends Annotation> T getMethodAnnotation(JoinPoint joinPoint, Class<T> clazz) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        return method.getAnnotation(clazz);
    }
}
