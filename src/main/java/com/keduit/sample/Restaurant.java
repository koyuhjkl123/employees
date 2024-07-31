package com.keduit.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;

// 자바 반으로 관리
@Component
// lombok : getter, setter,
@Data
public class Restaurant {
	
	
	@Autowired
	private Chef chef;
	
	

}
