package com.chenlm.web.controller;

import com.chenlm.jpa.model.Company;
import com.chenlm.web.controller.model.Searcher;
import com.chenlm.web.service.CompanyService;
import com.chenlm.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

/**
 * 主页及搜索
 * Created by chenlm on 15-11-25.
 */
@Controller
public class HomeController extends BaseController {
    @Autowired
    private UserService userService;
    @Autowired
    private CompanyService companyService;

    @ModelAttribute
    public void sider(Model model) {
        Page<Company> top10 = companyService.findCompanyTop(10);
        model.addAttribute("top10", top10);
    }

    @RequestMapping("/")
    public String home(Model model) {
        PageRequest page = new PageRequest(0, 10);
        Page<Company> companyPage = companyService.findByTitleLike("%", page);
        model.addAttribute("all", companyPage);
        return "index";
    }

    @RequestMapping("/search")
    public String search(Searcher searcher, Model model) {
        Page<Company> companyPage = companyService.search(searcher);
//        PageRequest pageRequest = new PageRequest(page, size);
//        Page<Company> companyPage = companyService.findByTitleLike("%" + keyword + "%", pageRequest);
        model.addAttribute("all", companyPage);
        return "index";
    }

    /*生成验证码方法**/
    @RequestMapping("/vcode")
    public void getValidateKey(HttpServletRequest request, HttpServletResponse response) {
        System.setProperty("java.awt.headless", "true");
        try {

            // 在内存中创建图象
            int width = 72, height = 28;
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            // 获取图形上下文
            Graphics g = image.getGraphics();

            // 设定背景色
            g.setColor(new Color(0xDCDCDC));
            g.fillRect(0, 0, width, height);

            //画边框
            g.setColor(Color.black);
            g.drawRect(0, 0, width - 1, height - 1);

            // 随机产生的认证码(4位数字)
            int n = 1000 + (int) (Math.random() * 9000);    //随机生成四位数字
            String randStr = n + "";
            // 将认证码存入SESSION
            request.getSession().setAttribute("vcode", randStr);

            // 将认证码显示到图象中
            g.setColor(Color.black);
            String numberStr = randStr;

            g.setFont(new Font("Atlantic Inline", Font.PLAIN, 24));
            String Str = numberStr.substring(0, 1);
            g.drawString(Str, 8, 22);

            Str = numberStr.substring(1, 2);
            g.drawString(Str, 20, 19);
            Str = numberStr.substring(2, 3);
            g.drawString(Str, 35, 24);

            Str = numberStr.substring(3, numberStr.length());
            g.drawString(Str, 45, 19);

            // 随机产生80个干扰点，使图象中的认证码不易被其它程序探测到
            Random random = new Random();
            for (int i = 0; i < 80; i++) {
                int x = random.nextInt(width);
                int y = random.nextInt(height);
                g.drawOval(x, y, 0, 0);
            }

            // 图象生效
            g.dispose();
            response.reset();//加上这句后图片能出来了  后台有错

            // 输出图象到页面
            ImageIO.write(image, "JPEG", response.getOutputStream());
            //在页面上调用  <img src="/yourPath/servlet/CreateValidateKeyServlet" />

            // 输出图象到字节数组
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(image, "JPEG", baos);

            /*byte[] bytes = baos.toByteArray();

            BASE64Encoder base64Encoder = new BASE64Encoder();
            String base64String = base64Encoder.encode(bytes);*/
            //log.info( "图像数据(base64Encoder后): " + base64String );
            /*Map ecode = new HashMap();
            if (null != randStr && null != base64String) {
                ecode.put("Key", randStr);
                ecode.put("VerifyImage", base64String);
            }*/
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
