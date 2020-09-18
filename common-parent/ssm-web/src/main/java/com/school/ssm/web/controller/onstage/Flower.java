package com.school.ssm.web.controller.onstage;

import com.school.ssm.po.*;
import com.school.ssm.service.IFlowerService;
import com.school.ssm.service.IFlowerTypeService;
import com.school.ssm.service.IReceiverService;
import com.school.ssm.service.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("flower")
public class Flower {
    @Autowired
    public IFlowerService flowerServiceImpl;
    @Autowired
    public IFlowerTypeService flowerTypeServiceImpl;
    @Autowired
    public IShopService shopServiceImpl;
    @Autowired
    private IReceiverService receiverServiceImpl;
    @RequestMapping("flowerDetail")
    public ModelAndView flowerDetail(int Fid) {
        FlowerDetail flowerDetailByFid = flowerServiceImpl.findFlowerDetailByFid(Fid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("flowerDetail", flowerDetailByFid);
        modelAndView.setViewName("flower_detail");
        return modelAndView;
    }

    @RequestMapping("findflowerByType")
    public @ResponseBody
    ModelAndView findflowerByType(HttpSession session, int tid, int currIndex) {
        int pageSize = 12;
        Map<String, Object> map = flowerTypeServiceImpl.findFlowerTypeByTid(tid, currIndex, pageSize);
        int listSize = (int) map.get("listSize");
        FlowerType flowerType = (FlowerType) map.get("FlowerType");
        ModelAndView mav = new ModelAndView();
        mav.addObject("flowerType", flowerType);
        mav.addObject("pageNumber", listSize);
        mav.addObject("currIndex", currIndex);
        mav.setViewName("flower_list");
        session.setAttribute("tid", tid);
        session.setAttribute("tname", map.get("tname"));
        return mav;
    }

    @RequestMapping(value = "flowerDetailListByinfos")
    public ModelAndView flowerDetailListByinfos(HttpSession session, String infos, int currIndex) {
        int pageSize = 20;
        if (infos == null) infos = "";
        PageBean<FlowerDetail> flowerDetailPageBean = flowerServiceImpl.flowerDetailListByinfos(infos, currIndex, pageSize);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageBean", flowerDetailPageBean);
        modelAndView.addObject("infos", infos);
        modelAndView.setViewName("all_flower");
        session.setAttribute("tid", 0);
        session.setAttribute("tname", "全部鲜花");
        return modelAndView;
    }

    @RequestMapping("findflowerNum")
    public @ResponseBody
    String findflowerNum(HttpSession session,int Fid,int flowerNum) {
        int num = flowerServiceImpl.findFlowerNumber(Fid);
        User user=(User)session.getAttribute("user");
        Integer uuid = user.getUuid();
        Shop shop = new Shop();
        shop.setUuid(uuid);
        shop.setFid(Fid);
        if(num>=flowerNum){
            shop.setNumber(flowerNum);
            shopServiceImpl.update(shop);
        }if(flowerNum>num){
            shop.setNumber(num);
            shopServiceImpl.update(shop);
        }
        return String.valueOf(num);
    }


}