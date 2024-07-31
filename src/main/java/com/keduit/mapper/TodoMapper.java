package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.TodoVO;

public interface TodoMapper {

	// 업무 게시글 등록
	public void insert(TodoVO list);

	// 업무 게시글 목록 조회
	public List<TodoVO> getTodoList();
	
	// 우선순위 목록 조회(날짜, 우선순위)
	public List<TodoVO> getTodoDateList();

	//  업무 게시글 삭제
	public int remove(Long tno);

	//  업무 게시글수정
	public int update(TodoVO todo);

	//  업무 게시글 1건 조회
	public TodoVO get(Long tno);

}
