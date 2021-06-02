package com.sneuron.junggo.mapper;

import org.apache.ibatis.annotations.Select;

import com.sneuron.junggo.VO.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);

	@Select("select sysdate from dual")
	String getTime();
}
