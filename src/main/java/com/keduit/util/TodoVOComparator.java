package com.keduit.util;

import java.util.Comparator;

import com.keduit.domain.TodoVO;

public class TodoVOComparator implements Comparator<TodoVO>{

	@Override
	public int compare(TodoVO o1, TodoVO o2) {
		return Integer.compare(o1.getPriority(), o2.getPriority());
	}

}
