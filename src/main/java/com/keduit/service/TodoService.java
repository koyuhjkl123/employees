package com.keduit.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.keduit.domain.TodoVO;

public interface TodoService {
	
	// 등록
	public void register(TodoVO list);
	
	// 목록 조회
	public List<TodoVO> getTodoList();
	
	// 목록 조회(중요도(우선순위) 순으로 급한 순으로 하되, 중요도가 같을 경우 날짜 순으
	public List<TodoVO> getTodoDateList();
	
	// 삭제
	public boolean remove(Long tno);
	
	// 수정
	public boolean modify(TodoVO todo, String duedate);
	
	// 상새 조회 
	public TodoVO get(Long tno);

	// dueDate format 작업을 하기 위한 메서드
	public TodoVO convertToTimestamp(String dueDateStr, TodoVO todo);
	

}
