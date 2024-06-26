package h.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import h.vo.Customer;

public interface CusDao {
		@Select("SELECT * FROM customer WHERE name = #{name} "
				+ "OR phone = #{phone} OR passport_number = #{passport_number}")
		List<Customer> getCusList(Customer sch);
	}
