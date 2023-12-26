package memberDAO;


import java.sql.SQLException;
import java.util.Random;

import DBconnect.DBconnect;
import memberDTO.memberDTO;

public class memberDAO extends DBconnect {

	public memberDAO() {
		super();
	}
	
	// 아이디 비번 일치하는 멤버 찾기 
	public memberDTO getMemberDTO(String id, String pw) {
		memberDTO dto = new memberDTO();
		String query = "select * from member where id=? and pw=?";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setNickname(rs.getString(4));
				dto.setBirthday(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setEmail(rs.getString(7));
				dto.setPhone(rs.getString(8));
			}
			System.out.println("memberdto 가져오기 성공");
		} catch(Exception e) {
			System.out.println("memberdto 가져오기 실패");
		}
		
		return dto;
	}
	
	// 카카오멤버 정보 가져오기
		public memberDTO getkakaoMemberDTO(String email) {
			memberDTO dto = new memberDTO();
			String query = "select * from member where email=? and phone=?";
			
			
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, email);
				psmt.setString(2, "kakao");
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setNickname(rs.getString("nickname"));
					dto.setEmail(rs.getString("email"));
					dto.setPhone(rs.getString("phone"));
				}
				System.out.println("kakao memberdto 가져오기 성공");
			} catch(Exception e) {
				System.out.println("kakao memberdto 가져오기 실패");
			}
			
			return dto;
		}
		
	
	// 멤버 추가하기
	public void register(String id, String pw, String name, String nickname, String birthday, 
			String address, String email, String phone) {
		String query = "insert into member values(?,?,?,?,?,?,?,?)";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, nickname);
			psmt.setString(5, birthday);
			psmt.setString(6, address);
			psmt.setString(7, email);
			psmt.setString(8, phone);
			psmt.executeUpdate();
			System.out.println("회원 추가 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 추가 실패");
		}

	}
	
	// 카카오멤버 추가하기
		public void kakaoregister(String id,String name,String nickname, String email, String kakao) {
			String query = "insert into member(id, name,nickname, email, phone) values(?,?,?,?,?)";
			
			
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, id);
				psmt.setString(2, name);
				psmt.setString(3, nickname);
				psmt.setString(4, email);
				psmt.setString(5, kakao);
			
				psmt.executeUpdate();
				System.out.println("카카오 회원 추가 성공");
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("카카오 회원 추가 실패");
			}

		}
		
	
	// 아이디 중복확인하기
	public int CheckDuplicateId(String id)  {
		int result=0;
		String sql="select id from  member where id=?";
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			} else {
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 이메일 중복확인하기
	public int CheckDuplicateEmail(String email)  {
		int result=0;
		String sql="select email from  member where email=?";
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, email);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			} else {
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 닉네임 중복확인하기
	public int CheckDuplicateNickName(String nickname)  {
		int result=0;
		String sql="select nickname from  member where nickname=?";
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, nickname);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			} else {
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//회원 정보 수정하는 메소드
	public void EditMember(String id, String pw, String nickname, String address, String phone) {
		String query = "update member set pw=?, nickname=?, address=?, phone=? where id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pw);
			psmt.setString(2, nickname);
			psmt.setString(3, address);
			psmt.setString(4, phone);
			psmt.setString(5, id);
			psmt.executeUpdate();
			System.out.println("회원정보 수정성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 수정실패");
		}
	}
	
	//회원탈퇴하는 메소드
	public void deleteMember(String id) {
		String query = "delete from member where id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.executeUpdate();
		
			System.out.println("회원 삭제 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 삭제 실패");
		}
	}
	
	// 아이디 찾기
		public String searchId(String name, String birthday, String email)  {
			String result="";
			String sql="select id from  member where name=? and birthday=? and email=?";
			
			try {
				psmt=con.prepareStatement(sql);
				psmt.setString(1, name);
				psmt.setString(2, birthday);
				psmt.setString(3, email);
				rs=psmt.executeQuery();
				if(rs.next()) {
					result="아이디는 "+rs.getString(1)+"입니다.";
				} else {
					result="아이디를 찾을 수가 없습니다.";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
		
		// 비번 찾기
			public String searchPw(String id, String email)  {
				String result="";
				String sql="select pw from  member where id=? and email=?";
				
				try {
					psmt=con.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setString(2, email);
					rs=psmt.executeQuery();
					if(rs.next()) {
						 int leftLimit = 97; // letter 'a'
						    int rightLimit = 122; // letter 'z'
						    int targetStringLength = 10;
						    Random random = new Random();
						    StringBuilder buffer = new StringBuilder(targetStringLength);
						    for (int i = 0; i < targetStringLength; i++) {
						        int randomLimitedInt = leftLimit + (int) 
						          (random.nextFloat() * (rightLimit - leftLimit + 1));
						        buffer.append((char) randomLimitedInt);
						    }
						    String generatedString = buffer.toString();

						    System.out.println(generatedString);
						
						String password=sha256.SHA256.encodeSha256(generatedString);
						String sql2="update member set pw=? where id=?";
						
						try {
							psmt=con.prepareStatement(sql2);
							psmt.setString(1, password);
							psmt.setString(2, id);
							psmt.executeUpdate();
							
							System.out.println("비밀번호 변경 성공");
						} catch (Exception e) {
							e.printStackTrace();
							System.out.println("비밀번호 변경 실패");
						}
						
						result="임시 비밀번호는 \'"+generatedString+"\'입니다.  가급적 빠른 시일내에 비밀번호를 변경해주시기 바랍니다.";
						
						
					} else {
						result="아이디와 이메일을 다시확인해주세요.";
					}
					System.out.println("비밀번호 변경을위해 찾기 성공");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("비밀번호 변경을위해 찾기 실패");
				}
				
				return result;
			}
		
	
	
}
