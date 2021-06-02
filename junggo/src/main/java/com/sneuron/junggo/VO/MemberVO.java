package com.sneuron.junggo.VO;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {


	private String userpw;
	private String userid;
	
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userEmailHash;
	private int userEmailChecked;
	private String userName;
	private boolean enabled;

	private Date regDate;  //private java.util.Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;

}
