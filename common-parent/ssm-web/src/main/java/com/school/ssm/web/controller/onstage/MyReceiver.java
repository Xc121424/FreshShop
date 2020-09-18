package com.school.ssm.web.controller.onstage;

import com.school.ssm.po.PageBean;
import com.school.ssm.po.Receiver;
import com.school.ssm.po.Shop;
import com.school.ssm.po.User;
import com.school.ssm.service.IReceiverService;
import com.school.ssm.service.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller("myReceiver")
@RequestMapping("myReceiver")
public class MyReceiver {
    @Autowired
    private IReceiverService receiverServiceImpl;

    @RequestMapping("shipAddress")
    public ModelAndView shipAddress(HttpSession session) {
        User user=(User)session.getAttribute("user");
        List<Receiver> all =  receiverServiceImpl.findAll(user.getUuid());
//        List<Receiver> all = receiverServiceImpl.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("address", all);
        modelAndView.setViewName("shipAddress");
        session.setAttribute("tid", 14);
        session.setAttribute("tname", "收货地址");
        return modelAndView;
    }

    @RequestMapping(value = "updateOrSaveRecevier")
    public @ResponseBody Receiver updateOrSaveRecevier(@RequestBody Receiver receiver, HttpSession session) {
        User user = (User) session.getAttribute("user");
        receiver.setUuid(user.getUuid());
        receiverServiceImpl.save(receiver);
        return null;
    }

    @RequestMapping(value = "findReceiverByRid")
    public @ResponseBody Receiver findReceiverByRid(int rid) {
        Receiver byId = receiverServiceImpl.findById(rid);
        return byId;
    }

    @RequestMapping(value = "deleteAddress")
    public @ResponseBody String deleteAddress(int rid) {
        receiverServiceImpl.delete(rid);
        return "1";
    }
    @RequestMapping(value = "setDefaultAddress")
    public @ResponseBody String setDefaultAddress(HttpSession session,int rid) {
        User user=(User)session.getAttribute("user");

        receiverServiceImpl.setDefaultAddress(user.getUuid(),rid);
        return "1";
    }
}
