package com.sneuron.junggo.login;

import java.util.Date;

public class UserDTO {

	private String userID;
	private String userPassword;
	private String userEmail;
	private String userEmailHash;
	private int useremailChecked;
	private java.util.Date regDate;
	
	public String getuserID() {return userID;}
	public void setuserID(String userID) {this.userID = userID;}
	public String getUserPassword() {return userPassword;}
	public void setUserPassword(String userPassword) {this.userPassword = userPassword;}
	public String getUserEmail() {return userEmail;}
	public void setUserEmail(String userEmail) {this.userEmail = userEmail;}
	public String getUserEmailHash() {return userEmailHash;}
	public void setUserEmailHash(String userEmailHash) {this.userEmailHash = userEmailHash;}
	public int getUseremailChecked() {return useremailChecked;}
	public void setUseremailChecked(int useremailChecked) {this.useremailChecked = useremailChecked;}
	public java.util.Date getRegDate() {return regDate;}
	public void setRegDate(java.util.Date regDate) {this.regDate = regDate;}
	
	
	public UserDTO() {	}
	public UserDTO(String userID, String userPassword, String userEmail, String userEmailHash, int useremailChecked
			) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.useremailChecked = useremailChecked;
		//this.regDate = regDate;
	}
	

	
	

	
}//END
