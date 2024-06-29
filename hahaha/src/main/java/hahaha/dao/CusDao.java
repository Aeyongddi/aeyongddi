package hahaha.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import hahaha.vo.Customer;

public interface CusDao {
		@Select("SELECT * FROM customer")
		List<Customer> getCusList(Customer sch);
		/*
WHERE name = #{name} "
				+ "OR phone = #{phone} OR passport_number = #{passport_number}")
		
		 * */
		@Update("UPDATE customer "
	            + "SET ssn = #{ssn}, "
	            + "passport_number = #{passport_number} "
	            + "WHERE customer_id = #{customer_id}")
	    int updateCustomer(Customer upt);

	    @Select("SELECT * FROM customer WHERE customer_id = #{customer_id}")
	    Customer getCustomer(String customerId);
	    
	    @Delete("Delete from customer\r\n"
	    		+ "where ssn = #{ssn}")
	    int deleteCustomer(@Param("ssn") String ssn);
	}
