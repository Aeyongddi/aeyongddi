package hahaha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hahaha.service.CusService;
import hahaha.vo.Customer;
import hahaha.vo.Financialreport;

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

    // http://localhost:7080/hahaha/financialreport.do
    @RequestMapping("financialreport.do")
    public String finList(Financialreport sch, Model d) {
    	d.addAttribute("finList", service.getFiList());
    	return "freport";
    }
    @RequestMapping("fr.do")
    public String fr(Financialreport sch, Model d) {
    	d.addAttribute("finList", service.schFiList(sch));
    	return "freport";
    }
    
    @RequestMapping("insertFinanc.do")
    public String insertFinanc(Financialreport ins, Model d) {
    	d.addAttribute("msg", service.insertFina(ins));
    	return "jsonView";
    }
}
