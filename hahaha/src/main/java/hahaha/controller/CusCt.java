package hahaha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hahaha.service.CusService;
import hahaha.vo.Customer;

@Controller
public class CusCt {
    @Autowired(required=false)
    private CusService service;
    
    // http://localhost:7080/hahaha/customerList.do
    @RequestMapping("customerList.do")
    public String cusList(Customer sch, Model d) {
        d.addAttribute("cusList", service.getCusList(sch));
        return "customer";
    }
    
 // http://localhost:7080/hahaha/updateCustomer.do    
    @RequestMapping("updateCustomer.do")
    public String updateCustomer(Customer upt, Model d) {
    	d.addAttribute("msg", service.updateCustomer(upt));
    	d.addAttribute("customer", service.getCustomer(upt.getCustomer_id()));
    	return "jsonView";
    }
    @RequestMapping("deleteCustomer.do")
    public String deleteCustomer(String ssn, Model d) {
        String result = service.deleteCustomer(ssn);
        d.addAttribute("msg", result);
        return "jsonView";
    }
}
