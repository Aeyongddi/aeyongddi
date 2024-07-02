package hahaha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hahaha.dao.CusDao;
import hahaha.vo.Customer;
import hahaha.vo.Financialreport;

@Service
public class CusService {
    @Autowired(required=false)
    private CusDao dao;
    
    public List<Customer> getCusList(Customer sch) {
        if (sch.getName() != null && !sch.getName().isEmpty()) {
            return dao.getCusListByName(sch.getName());
        } else if (sch.getPhone() != null && !sch.getPhone().isEmpty()) {
            return dao.getCusListByPhone(sch.getPhone());
        } else if (sch.getPassport_number() != null && !sch.getPassport_number().isEmpty()) {
            return dao.getCusListByPassport(sch.getPassport_number());
        } else {
            // 기본 동작: 모든 고객 목록을 반환하거나 다른 기본 동작을 설정할 수 있음
            return dao.getCusListByName(""); // 빈 리스트 반환
        }
    }

    public String updateCustomer(Customer upt) {
        int result = dao.updateCustomer(upt);
        return result > 0 ? "success" : "failure";
    }

    public Customer getCustomer(String customer_id) {
        return dao.getCustomer(customer_id);
    }

    public String deleteCustomer(String ssn) {
        int result = dao.deleteCustomer(ssn);
        return result > 0 ? "success" : "failure";
    }
    
    public List<Financialreport> getFiList(){
        return dao.getFiList();
    }
}
