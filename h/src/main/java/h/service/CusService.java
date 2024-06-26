package h.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import h.dao.CusDao;
import h.vo.Customer;

@Service
public class CusService {
	@Autowired(required=false)
	private CusDao dao;
	
	public List<Customer> getCusList(Customer sch){
		return dao.getCusList(sch);
	}
}
