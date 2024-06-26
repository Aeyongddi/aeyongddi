package h.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import h.service.CusService;
import h.vo.Customer;

@Controller
public class CusCt {
    @Autowired(required=false)
    private CusService service;
    
    // http://localhost:7080/h/customerList.do
    @RequestMapping("customerList.do")
    public String cusList(Customer sch, Model d) {
        d.addAttribute("cusList", service.getCusList(sch));
        return "customer";
    }
}
