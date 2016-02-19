package com.chenlm.web.service.aspact;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * Created by chenlm on 15-12-13.
 */
@Component
@Aspect
public class ServiceAspect {
    @Pointcut("execution(* com.chenlm.web.service.*Service.*(..))")
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
}
