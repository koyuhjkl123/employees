package com.keduit.domain;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

@Data
public class TodoVO {

	private Long tno;
	private String title;
	private String writer;
	private Timestamp dueDate;
	private boolean finished;
	private int priority;

	
	
	
	

}
