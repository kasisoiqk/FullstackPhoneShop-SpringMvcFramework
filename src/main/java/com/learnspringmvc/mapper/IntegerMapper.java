package com.learnspringmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class IntegerMapper implements RowMapper<Integer> {

	@Override
	public Integer mapRow(ResultSet rs) {
		try {
			return rs.getInt("quantity");
		}
		catch (SQLException e) {
			return null;
		}
	}

}
