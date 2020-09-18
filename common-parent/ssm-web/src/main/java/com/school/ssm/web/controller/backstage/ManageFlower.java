package com.school.ssm.web.controller.backstage;

import com.school.ssm.po.FlowerDetail;
import com.school.ssm.po.FlowerDetailType;
import com.school.ssm.po.PageBean;
import com.school.ssm.service.IFlowerService;
import com.school.ssm.service.IFlowerTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller("manageFlower")
@RequestMapping("manageFlower")
public class ManageFlower {
    @Autowired
    private IFlowerService flowerServiceImpl;
    @Autowired
    private IFlowerTypeService flowerTypeServiceImpl;

    @RequestMapping(value = "dropFlower")
    public String dropFlower(HttpSession session, int Fid) {
        flowerServiceImpl.dropFlower(Fid);
        return "redirect:flowerList?infos=&CurrentPage=1";
    }
    @RequestMapping(value = "upFlower")
    public String upFlower(HttpSession session,int Fid) {
        flowerServiceImpl.uppFlower(Fid);
        return "redirect:dropflowerList?infos=&CurrentPage=1";
    }

    @RequestMapping("flowerList")
    public ModelAndView flowerList(String infos, int CurrentPage) {
        int rows=10;
        PageBean<FlowerDetail> flowerDetailPageBean = flowerServiceImpl.flowerDetailListByinfos(infos, CurrentPage, rows);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageBean", flowerDetailPageBean);
        modelAndView.addObject("infos", infos);
        modelAndView.setViewName("backStage/flowerlist");
        return modelAndView;

    }
    @RequestMapping("dropflowerList")
    public ModelAndView dropflowerList(String infos,int CurrentPage) {
        int rows=10;
        PageBean<FlowerDetail> flowerDetailPageBean = flowerServiceImpl.dropFlowerDetailListByinfos(infos, CurrentPage, rows);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageBean", flowerDetailPageBean);
        modelAndView.addObject("infos", infos);
        modelAndView.setViewName("backStage/dropflowerlist");
        return modelAndView;
    }
    @RequestMapping("flowerInfos")
    public ModelAndView flowerInfos(int Fid) {
        List<FlowerDetailType> flowerDetailTypeList= flowerTypeServiceImpl.findAllByFid(Fid);
        System.out.println(flowerDetailTypeList);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("flowerDetailTypeList", flowerDetailTypeList);
        modelAndView.setViewName("backStage/updateGoods");
        return modelAndView;

    }
}
