package com.school.ssm.web.controller.backstage;

import com.school.ssm.po.FlowerDetail;
import com.school.ssm.po.PageBean;
import com.school.ssm.po.User;
import com.school.ssm.service.IFlowerService;
import com.school.ssm.service.IFlowerTypeService;
import com.school.ssm.service.IUserService;
import com.school.ssm.web.controller.utils.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller("manager")
@RequestMapping("manager")
public class Manager {
    @Autowired
    private IUserService userServiceImpl;

    @RequestMapping("/intologin")
    public String intoLogin(HttpSession session) {
        session.setAttribute("managerTag", 0);
        return "backStage/login";
    }

    @RequestMapping(value = "managerlogin", method = RequestMethod.POST)
    public String managerlogin(Model model, String username, String password, String verifycode, HttpSession session, HttpServletResponse response) {
        //从session中获取随机数
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if (random.equalsIgnoreCase(verifycode)) {
            User user1 = userServiceImpl.findManager(username);
            if (user1 == null) {
                model.addAttribute("error", "账号错误！");
                return "backStage/login";
            } else if (!user1.getPassword().equals(password)) {
                model.addAttribute("error", "密码错误！");
                return "backStage/login";
            } else {
                session.setAttribute("Manager", user1);
                return "backStage/frame";
            }
        } else {
            model.addAttribute("error", "验证码错误");
            model.addAttribute("name", username);
            return "backStage/login";
        }

    }

    @RequestMapping(value = "exit")
    public String exit(HttpSession session) {
        session.removeAttribute("Manager");
//        session.setAttribute("clientTag", "0");
        return "redirect:intologin";
    }

}
