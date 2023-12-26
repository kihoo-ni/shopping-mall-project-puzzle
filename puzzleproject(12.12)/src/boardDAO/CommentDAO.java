package boardDAO;

import java.util.ArrayList;

import DBconnect.DBconnect;
import boardDTO.CommentDTO;
import boardDTO.ReplyDTO;

public class CommentDAO extends DBconnect {

	public CommentDAO() {
		super();
	}
	
	
	// 게시물 상세보기에서 댓글 밑에 답글 달기
		public int insertComment(CommentDTO dto) {
			
			int result = 0;
			
			String sql = "insert into comment(re_num, id, nickname, content) values(?,?,?,?)";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, dto.getRe_num());
				psmt.setString(2, dto.getId());
				psmt.setString(3, dto.getNickname());
				psmt.setString(4, dto.getContent());
				
				psmt.executeUpdate();
				
				System.out.println("insertComment 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("insertComment 오류");
			}
			
			return result;
		}
		
		// 답글 개수 세기
		public int countComment(int re_num){
			
			int count = 0;
			
			String sql = "select count(*) from comment where re_num =?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, re_num);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
				
				System.out.println("countComment 성공");
			} catch (Exception e) {
				System.out.println("countComment 오류");
				e.printStackTrace();
			}
			
			return count;
		}
		
		
		
		// 답글 수정
		public void updateComment(CommentDTO dto) {

			try {
				String sql = "update comment set content=? where co_num=?";
				psmt=con.prepareStatement(sql);
				psmt.setString(1, dto.getContent());
				psmt.setInt(2, dto.getRe_num());
				psmt.executeUpdate();
				
				System.out.println("updateComment 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("updateComment 오류");
			}
		}
		
		// 답글 삭제
		public void deleteComment(int co_num) {
			try {

				String sql = "delete from comment where co_num = ?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, co_num);
				psmt.executeUpdate();

				System.out.println("deleteComment 성공");
			} catch (Exception e) {
				System.out.println("deleteComment 오류");
				e.printStackTrace();

			}
		
		}
		
	
}
