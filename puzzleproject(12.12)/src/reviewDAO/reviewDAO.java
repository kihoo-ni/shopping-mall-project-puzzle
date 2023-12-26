package reviewDAO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import DBconnect.DBconnect;
import reviewDTO.reviewDTO;


public class reviewDAO extends DBconnect{
		// 해당 상품id에 대한 리뷰 목록 가져오기 
			public ArrayList<reviewDTO> getAllReviewfromProductId(String productId) {
				ArrayList<reviewDTO> reviewList = new ArrayList<reviewDTO>();
				String query = "select * from productreview where productid=?";
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, productId);
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						reviewDTO dto = new reviewDTO();
						dto.setReviewNumber(rs.getInt(1));
						dto.setId(rs.getString(2));
						dto.setNickName(rs.getString(3));
						dto.setProductId(rs.getString(4));
						
						String content = rs.getString(5);
						content = content.replaceAll("<br>", "\r\n");
						dto.setReviewContent(content);
						
						
						dto.setReviewImage(rs.getString(6));
						
						// MySQL의 datetime 값을 가져오기
						Timestamp timestamp = rs.getTimestamp("reviewcreated");

						// java.util.Date로 변환 (또는 다른 필요한 형태로 변환 가능)
						java.util.Date date = new java.util.Date(timestamp.getTime());
						
						//원하는 형식으로 변환
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						String formattedDate = dateFormat.format(date);
						dto.setReviewcreated(formattedDate);
						reviewList.add(dto);
					}
					System.out.println("상품id에 대한 상품후기 목록 가져오기 성공");
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("상품id에 대한 상품후기 목록 가져오기 오류");
				}
				return reviewList;
			}
			
			// 해당 id에 대한 리뷰 목록 가져오기 
			public ArrayList<reviewDTO> getAllReviewfromId(String id) {
				ArrayList<reviewDTO> reviewList = new ArrayList<reviewDTO>();
				String query = "select * from productreview where id=?";
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						reviewDTO dto = new reviewDTO();
						dto.setReviewNumber(rs.getInt(1));
						dto.setId(rs.getString(2));
						dto.setNickName(rs.getString(3));
						dto.setProductId(rs.getString(4));
						
						String content = rs.getString(5);
						content = content.replaceAll("<br>", "\r\n");
						dto.setReviewContent(content);
						
						dto.setReviewImage(rs.getString(6));
						// MySQL의 datetime 값을 가져오기
						Timestamp timestamp = rs.getTimestamp("reviewcreated");

						// java.util.Date로 변환 (또는 다른 필요한 형태로 변환 가능)
						java.util.Date date = new java.util.Date(timestamp.getTime());
						
						//원하는 형식으로 변환
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						String formattedDate = dateFormat.format(date);
						dto.setReviewcreated(formattedDate);
						reviewList.add(dto);
					}
					System.out.println("id에 대한 상품후기 목록 가져오기 성공");
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("id에 대한 상품후기 목록 가져오기 오류");
				}
				return reviewList;
			}
			
			// 후기 등록
			public int addreview(String id, String nickName, String productId, String reviewContent, String reviewImage) {
				String sql = "insert into productreview (id, nickname, productId, reviewcontent, reviewimage)"
						+ "values(?,?,?,?,?)";
				int result=0;
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setString(2, nickName);
					psmt.setString(3, productId);
					psmt.setString(4, reviewContent);
					psmt.setString(5, reviewImage);
					result=psmt.executeUpdate();
					System.out.println("상품후기 추가하기 성공");
					
				} catch(Exception e) {
					System.out.println("상품후기 추가하기 오류");
					e.printStackTrace();
				}
				return result;
				
				
			 }
				
			//상품후기 삭제(상품후기번호기준)
			public int deletereview(int reviewNumber, String id) {
				String sql = "delete from productreview where reviewNumber=? and id=?";
				int result=0;
				try {
					psmt = con.prepareStatement(sql);
					psmt.setInt(1,reviewNumber);
					psmt.setString(2,id);
					result=psmt.executeUpdate();
					
					System.out.println("상품후기 삭제하기 성공");
				} catch(Exception e) {
					System.out.println("상품후기 삭제하기 오류");
					e.printStackTrace();
				}
				return result;
				
			}	
}
