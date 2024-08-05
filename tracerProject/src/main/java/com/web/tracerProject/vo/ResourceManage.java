package com.web.tracerProject.vo;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ResourceManage {
    private String rid;
    private String rtype;
    private BigDecimal assigned_budget;
    private BigDecimal used_budget;
    private String software_name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date license_purchase_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date license_expiry_date;
    private BigDecimal software_price;
    private String pid;
}

