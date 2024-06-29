package hahaha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hahaha.dao.CusDao;
import hahaha.vo.Customer;

@Service
public class CusService {
	@Autowired(required=false)
	private CusDao dao;
	
	public List<Customer> getCusList(Customer sch){
		return dao.getCusList(sch);
	}
	 public String updateCustomer(Customer upt) {
	        int result = dao.updateCustomer(upt);
	        return result > 0 ? "success" : "failure";
	    }

	    public Customer getCustomer(String customer_id) {
	        return dao.getCustomer(customer_id);
	    }
}
