package com.school.ssm.web.controller.onstage;

import com.school.ssm.po.Favorities;
import com.school.ssm.po.FlowerDetail;
import com.school.ssm.po.PageBean;
import com.school.ssm.po.User;
import com.school.ssm.service.IFavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("Favorite")
@RequestMapping("favorite")
public class Favorite {
    @Autowired
    private IFavoriteService favoriteServiceImpl;

    @RequestMapping("intoFavorite")
    public ModelAndView intoFavorite(HttpSession session, int currIndex, int pageSize) {
        pageSize=6;
        ModelAndView mav = new ModelAndView();
        User user = (User) session.getAttribute("user");
        PageBean<Favorities> map = favoriteServiceImpl.findAllByUuid(user.getUuid(),currIndex,pageSize);
        mav.addObject("pageBean", map);
        mav.setViewName("myfavorite");
        session.setAttribute("tid",12);
        session.setAttribute("tname","收藏夹");
        return mav;
    }

    @RequestMapping("favorite")
    public @ResponseBody int favorite(HttpSession session,int Fid) {
        User user =(User) session.getAttribute("user");
        Favorities favorities = new Favorities();
        favorities.setFid(Fid);
        favorities.setUuid(user.getUuid());
        int i = favoriteServiceImpl.saveFavorite(favorities);
        return i;
    }
    @RequestMapping("isFavorited")
    public @ResponseBody Boolean isFavorited(HttpSession session,int Fid) {
        User user =(User) session.getAttribute("user");

        if(user==null){
            return false;
        }

        Favorities favorities = new Favorities();
        favorities.setFid(Fid);
        favorities.setUuid(user.getUuid());
        Boolean flag=favoriteServiceImpl.qryIsFavorited(favorities);
        return flag;
    }
    @RequestMapping("cancelFavorite")
    public @ResponseBody  int  cancelFavorite(HttpSession session,int Fid) {
        User user =(User) session.getAttribute("user");
        Favorities favorities = new Favorities();
        favorities.setFid(Fid);
        favorities.setUuid(user.getUuid());
        int i = favoriteServiceImpl.cancelFavorite(favorities);

        return i;
    }
    @RequestMapping("cancleFavoriteList")
    public @ResponseBody  String  cancleFavoriteList(HttpSession session,@RequestBody String[] Fids) {
        User user =(User) session.getAttribute("user");
        Favorities favorities = new Favorities();
        favorities.setUuid(user.getUuid());
        for(String fid:Fids){
            int Fid=Integer.parseInt(fid);
            favorities.setFid(Fid);
            favoriteServiceImpl.cancelFavorite(favorities);
        }
        return "true";
    }

}
