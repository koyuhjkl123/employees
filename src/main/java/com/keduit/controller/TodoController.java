package com.keduit.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keduit.domain.TodoVO;
import com.keduit.service.TodoService;
import com.keduit.util.TodoVOComparator;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/todo/*")
@RequiredArgsConstructor
@Controller
public class TodoController {

	private final TodoService service;

	@GetMapping("/getlist")
	public void getList(Model model) {
		// DB doto 리스트
		List<TodoVO> list = service.getTodoList();
		
		// dueDate 날짜 format 리스트
		List<String> dates = new ArrayList<>();
		List<String> datess = new ArrayList<>();
		
		// priority 우선순위 기준 sort
		List<TodoVO> list_priority = service.getTodoDateList();		
		// 작업 완료, 작업 미완료 리스트
		List<Boolean> finishedList = new ArrayList<>();
		
		for (TodoVO tvo : list) {
			Date date = tvo.getDueDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = sdf.format(date);
			dates.add(formattedDate);
			finishedList.add(tvo.isFinished());
			
		}
		
		for(TodoVO pvo : list_priority) {
			
			Date date = pvo.getDueDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = sdf.format(date);
			datess.add(formattedDate);
		}
		
		System.out.println("===================================================="+list_priority);
		model.addAttribute("finishedList", finishedList);
		model.addAttribute("time", dates); // 각 날짜에 대한 리스트 추가
		model.addAttribute("List", list); // 전체 리스트 추가
		model.addAttribute("list_priority", list_priority);
		model.addAttribute("datess", datess);

	}

	@GetMapping("/get")
	public void get(Model model, @RequestParam("tno") Long tno) {

		getList(model);
		log.info("get입니다. ");

		model.addAttribute("List", service.get(tno));
	}

	@GetMapping("/modify")
	public void modify1(Model model, @RequestParam("tno") Long tno) {

		getList(model);
		log.info("modify입니다. ");

		model.addAttribute("List", service.get(tno));
	}
	
	
	
	@PostMapping("/modify")
	public String modify(Model model, TodoVO todo,String duedate) {

		log.info("post : modify 입니다.");
		service.modify(todo, duedate);
		return "redirect:/todo/getlist";
	}

	@PostMapping("/remove")
	public String remove(Model model, @RequestParam("tno") Long tno) {

		service.remove(tno);
		return "redirect:/todo/getlist";
	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(Model model, TodoVO todo) {

		service.register(todo);

		model.addAttribute("List", service.getTodoList());

		return "redirect:/todo/getlist";
	}

}
