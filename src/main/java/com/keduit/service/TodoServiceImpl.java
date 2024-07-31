package com.keduit.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.keduit.domain.TodoVO;
import com.keduit.mapper.TodoMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {

	private final TodoMapper mapper;

	@Override
	public List<TodoVO> getTodoList() {

		return mapper.getTodoList();
	}
	@Override
	public List<TodoVO> getTodoDateList(){
		
		List<TodoVO> list = mapper.getTodoDateList();
		
		return mapper.getTodoDateList();
	}
	@Override
	public TodoVO get(Long tno) {

		return mapper.get(tno);
	}
	@Override
	public void register(TodoVO list) {
		
	 mapper.insert(list);

	}
	@Override
	public boolean remove(Long tno) {
		
		return mapper.remove(tno) == 1;
	}
	@Override
	public boolean modify(TodoVO todo, String dueDate) {
		todo = convertToTimestamp(dueDate, todo);
		
		return mapper.update(todo) == 1;
	}
	
	public TodoVO convertToTimestamp(String dueDateStr, TodoVO todo) {
	    // 문자열을 LocalDateTime으로 변환
	    LocalDateTime dateTime = LocalDateTime.parse(dueDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
	    // LocalDateTime을 Timestamp로 변환하여 TodoVO 객체의 dueDate 속성에 설정
	    todo.setDueDate(Timestamp.valueOf(dateTime));
	    // 변환된 TodoVO 객체 반환
	    return todo;
	}
}
