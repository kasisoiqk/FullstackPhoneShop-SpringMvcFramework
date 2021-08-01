package com.learnspringmvc.dao;

import java.util.List;

import com.learnspringmvc.mapper.RowMapper;

public interface GenericDAO<T> {
	<T> List <T> query(String sql, RowMapper<T> rowMapper, Object... parameter);
	void update(String sql, Object... parameter);
	Long insert(String sql, Object... parameter);
	int count(String sql, Object... parameter);
}
