package com.sneuron.junggo.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.sneuron.junggo.mapper.*;

import lombok.Setter;
import lombok.extern.log4j.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Test
	public void testGetTime() {
		log.info(memberMapper.getClass().getName());
		log.info(memberMapper.getTime());
	}

	@Test
	public void tetGetTime2() {

		log.info("getTime2");
		log.info(memberMapper.getTime());

	}
}//END