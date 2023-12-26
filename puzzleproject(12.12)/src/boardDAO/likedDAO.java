package boardDAO;

import DBconnect.DBconnect;
import boardDTO.likedDTO;

public class likedDAO extends DBconnect {

	public likedDAO() {
		super();
	}

	// 추천하기 클릭시 DB에 값 들어가기
	public void likedCheck(likedDTO dto) {

		String sql = "insert into liked values(?,?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getC_id());
			psmt.setInt(2, dto.getNum());
			psmt.executeUpdate();

			System.out.println("likedChcek 성공");
		} catch (Exception e) {
			System.out.println("likedChcek 오류");
			e.printStackTrace();
		}

	}
	
	
	// 추천 개수 확인
	public int likedCount(int num) {
		int count = 0;

		String sql = "select count(*) from liked where num = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("likedCount 성공");
		} catch (Exception e) {
			System.out.println("likedCount 오류");
			e.printStackTrace();
		}

		return count;
	}
		
	
		
		// 추천했는지 확인 (중복 추천 방지)
		public int searchRecommed(String id, int num) {
		    int count = 0;
		    
		    String sql = "select count(*) from liked where c_id = ? and num = ?";
		    
		    try {
		        psmt = con.prepareStatement(sql);
		        psmt.setString(1, id);
		        psmt.setInt(2, num);
		        rs = psmt.executeQuery();
		        
		        if (rs.next()) {
		            count = rs.getInt(1);
		        }
		        
		        System.out.println("중복 추천 확인 성공");
		    } catch (Exception e) {
		        System.out.println("중복 추천 확인 실패");
		        e.printStackTrace();
		    }
		    
		    return count;
		}
		
		public void updateRecommend(int num) {
			
			try {
				//DB에 증가된 횟수를 업데이트 시킴
				String sql = "update board set recommend = recommend + 1 where num=?;";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				psmt.executeUpdate();
				
				System.out.println("게시판 추천수 증가 성공");
			} catch (Exception e) {
				System.out.println("게시판 추천수 증가 오류");
				e.printStackTrace();
			
			}
			
		}

}
