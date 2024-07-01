package hahaha.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;

import hahaha.vo.Customer;

public interface CusDao {
    @Select("SELECT * FROM customer WHERE name = #{name}")
    List<Customer> getCusListByName(@Param("name") String name);

    @Select("SELECT * FROM customer WHERE phone = #{phone}")
    List<Customer> getCusListByPhone(@Param("phone") String phone);

    @Select("SELECT * FROM customer WHERE passport_number = #{passport_number}")
    List<Customer> getCusListByPassport(@Param("passport_number") String passport_number);

    @Update("UPDATE customer SET ssn = #{ssn}, passport_number = #{passport_number} WHERE customer_id = #{customer_id}")
    int updateCustomer(Customer upt);

    @Select("SELECT * FROM customer WHERE customer_id = #{customer_id}")
    Customer getCustomer(String customerId);

    @Delete("DELETE FROM customer WHERE ssn = #{ssn}")
    int deleteCustomer(@Param("ssn") String ssn);
}
