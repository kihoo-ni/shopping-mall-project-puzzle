package boardDAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBconnect.DBconnect;
import boardDTO.BoardDTO;
import boardDTO.CommentDTO;
import boardDTO.ReplyDTO;

public class ReplyDAO extends DBconnect {

	public ReplyDAO() {
		super();
	}
	
	
	// 게시물 상세보기에서 댓글 작성
	public int insertReply(ReplyDTO dto) {
		
		int result = 0;
		
		String sql = "insert into reply(c_num, id, nickname, content) values(?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getC_num());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getNickname());
			psmt.setString(4, dto.getContent());
			
			psmt.executeUpdate();
			
			System.out.println("insertReply 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertReply 오류");
		}
		
		return result;
	}
	
	
	// 댓글 개수 세기(게시글 전체보기에 출력)
	public int countReply(int c_num){
		
		int count = 0;
		
		String sql = "select count(*) from reply";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("countReply 성공");
		} catch (Exception e) {
			System.out.println("countReply 오류");
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	
	  // 게시물 상세보기 밑에 댓글 데이터 출력 
		public ArrayList<ReplyDTO> getListReply(int c_num) {


			String sql = "select * from reply where c_num = ? order by r_num desc";
			ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();

			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, c_num);
				
				rs = psmt.executeQuery();
				while (rs.next()) { // 반복문 이용하여 해당 게시물을 게시판에 나오게 함
					ReplyDTO board = new ReplyDTO();
					board.setR_num(rs.getInt("r_num"));
					board.setC_num(rs.getInt("c_num"));
					board.setId(rs.getString("id"));
					board.setNickname(rs.getString("nickname"));
					String content = rs.getString("content");
					content = content.replaceAll("<br>", "\r\n");
					board.setContent(content);
					board.setRecommend(rs.getInt("recommend"));
					board.setCreated(rs.getDate("created"));
					board.setCommentList(getListComment(rs.getInt("r_num")));
					list.add(board);

				
				}
				System.out.println("getListReply 성공");
				return list;

			} catch (Exception e) {
				System.out.println("getListReply 오류");
				e.printStackTrace();
			}
			return null;

		}
	 
	// 게시물 상세보기의 댓글 밑에 답글 출력
	public ArrayList<CommentDTO> getListComment(int re_num) {
		
		String sql = "select * from comment where re_num = ? order by co_num";

		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, re_num);
			ResultSet rs2 = psmt.executeQuery();

			while (rs2.next()) { // 반복문 이용하여 해당 게시물을 게시판에 나오게 함
				CommentDTO board = new CommentDTO();
				board.setRe_num(rs2.getInt("re_num"));
				board.setCo_num(rs2.getInt("co_num"));
				board.setId(rs2.getString("id"));
				board.setNickname(rs2.getString("nickname"));
				board.setContent(rs2.getString("content"));
				board.setRecommend(rs2.getInt("recommend"));
				board.setCreated(rs2.getDate("created"));
				list.add(board);
			}
			rs2.close();
			System.out.println("getListComment 성공");
		} catch (Exception e) {
			System.out.println("getListComment 오류");
			e.printStackTrace();
		}
		return list;

	}
	
	
	// 댓글 수정
	public void updateReply(ReplyDTO dto) {

		try {
			String sql = "update reply set content=? where r_num=?";
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getContent());
			psmt.setInt(2, dto.getR_num());
			psmt.executeUpdate();
			
			System.out.println("updateReply 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateReply 오류");
		}
	}
	
	// 댓글 삭제
	public void deleteReply(int r_num) {
		try {

			String sql = "delete from reply where r_num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, r_num);
			psmt.executeUpdate();

			System.out.println("deleteReply 성공");
		} catch (Exception e) {
			System.out.println("deleteReply 오류");
			e.printStackTrace();

		}
	
	}

}
