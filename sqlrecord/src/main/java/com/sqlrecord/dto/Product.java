package com.sqlrecord.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int pno;
    private String name;
    private String remark1;
    private String remark2;
    private int price;
    private String img1;
    private String img2;
    private String img3;
    private String img4;
    private String img5;
    private String tag;
}
