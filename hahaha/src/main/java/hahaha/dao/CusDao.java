package hahaha.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import hahaha.vo.Customer;

public interface CusDao {
		@Select("SELECT * FROM customer")
		List<Customer> getCusList(Customer sch);
		/*
WHERE name = #{name} "
				+ "OR phone = #{phone} OR passport_number = #{passport_number}")
		
		 * */
	}
