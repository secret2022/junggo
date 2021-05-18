package com.sneuron.junggo.login;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;


public class UserDAO {

//DB연결	선언 
	 Connection CN; //db서버연결정보, 명령어생성할때 참조
	 Statement ST; //명령어생성 ST = CN.createStatement()
	 PreparedStatement PST; //속도가빠름 PST = CN.prepareStatement("insert~/update~")
	 CallableStatement CST ; //데이터베이스의 함수프로시저 사용 
	 ResultSet RS; //select조회한결과 RS=ST.executeQuery("select~~")	

//전역변수 선언	 
	
	  
//DB로딩 및 연결	
	 public UserDAO() {
			try {
				 System.out.println("db드라이버");
				 Class.forName("oracle.jdbc.driver.OracleDriver");
				 CN = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			}catch(Exception e){
				System.out.println("DB오류: "+e);
			}//end
		}//end
		 
//로그인	
	 public int loginid(String userID , String userPassword) {
		try {
			System.out.println("id " + userID +"  pwd " + userPassword);
			String msg = "select userPassword from member where userID=?";
			PST = CN.prepareStatement(msg);
				PST.setString(1, userID);
			RS = PST.executeQuery();
			if(RS.next()==true) {
				System.out.println("RS.next()");
				if(RS.getString(1).equals(userPassword)) { return 1; }
				else { return 0;  } //비번이 틀린경우
			}//end
			return -1; //DB에 저장된 userID 없음
		}catch(Exception e) { e.printStackTrace();}//end
		return -2; //DB 오류
	}//end

//회원가입	
	  public int join(UserDTO user) {
		try {
			//값전달 정상유무
			System.out.println(user.getuserID());
			System.out.println(user.getUserPassword());
			System.out.println(user.getUserEmail());
			System.out.println(user.getUserEmailHash());
			System.out.println(user.getUseremailChecked());
			//쿼리 실행
			String msg = "insert into member values(?,?,?,?,0,sysdate)";
			PST = CN.prepareStatement(msg);
			 PST.setString(1, user.getuserID()); 
			 PST.setString(2, user.getUserPassword());
			 PST.setString(3, user.getUserEmail());
			 PST.setString(4, user.getUserEmailHash());
			return PST.executeUpdate(); //회원가입 성공
		}catch(Exception e) { e.printStackTrace();}//end

		return -1; //가입실패 오류
	}//end

//특정이메일 반환 8.12:49	
	public String  getUseremail(String userID) {
		try {
			//String msg = "select useremail from userID where userID ='"+userID+"'";
			String msg = "select useremail from member where userID = ?";
			PST = CN.prepareStatement(msg);
				PST.setString(1, userID);
			RS = PST.executeQuery();
			if(RS.next()) { return RS.getString("useremail"); } 
		}catch(Exception e) { e.printStackTrace();}//end
		return null; //db오류
	}//end
	
	
	
//이메일 체크
	public int getUseremailChecked(String userID) {
		try {
			System.out.println("getUseremailChecked: " +userID);
			String msg = "select useremailChecked from member where userID = ?";
			PST = CN.prepareStatement(msg);
				PST.setString(1, userID);
			RS = PST.executeQuery();
			if(RS.next()) { 
				int num = RS.getInt(1);
				System.out.println("bl: "+num);
				return num;  
				}
		}catch(Exception e) { e.printStackTrace();}//end
		return 0; //db오류
	}//end

	
//이메일 체크 업데이트
	public int setUseremailChecked(String userID) {
		try {
			String msg = "update member set useremailChecked = 1 where userID = ?";
			PST = CN.prepareStatement(msg);
				PST.setString(1, userID);
			PST.executeUpdate(); 
			return 1;
			
		}catch(Exception e) { e.printStackTrace();}//end
		return 0; //db오류
	}//end	
	
}//END
