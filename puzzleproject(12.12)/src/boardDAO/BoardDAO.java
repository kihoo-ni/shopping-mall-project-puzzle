package boardDAO;



import java.util.Date;

import DBconnect.DBconnect;
import boardDTO.BoardDTO;

import java.util.ArrayList;

public class BoardDAO extends DBconnect{
	
	public BoardDAO() {
		super();
	}
	
	
	public int getListCount(String items, String text) { //게시물의 개수 세기
		int count =0;
		String sql;
		
		if(items == null && text == null)		 	//검색 조건이 없으면 전체 레코드 개수 출력
			sql = "select count(*) from board";
		else										// 검색 조건이 있으면 조건에 맞는 개수 출력
			sql = "select count(*) from board where " + items + " like '%" + text + "%'";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("getListCount 성공" + count);
		} catch (Exception e) {
			System.out.println("getListCount 오류");
			e.printStackTrace();
		}
		return count;
	}

	
	//board 테이블에 데이터 가져오기                      // limit 개수 제한?
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text){ 		
		
		
		int total_record = getListCount(items, text);
		int start = (page - 1) * limit + 1;
		int end = start + limit - 1;
		
		
		String sql;
		
		if(items == null && text == null) {
			sql = "select * from board order by num desc";
		} else {
			sql = "select * from board where " + items + " like '%" + text +"%'";
		}
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			int index = 1;  // 추가된 부분
			//absolute(index)
			while(rs.next()) {    //반복문 이용하여 해당 게시물을 게시판에 나오게 함
			 if(index >= start && index <=end) {	
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setNickname(rs.getString("nickname"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setPhoto(rs.getString("photo"));
				board.setHit(rs.getInt("hit"));
				board.setRecommend(rs.getInt("recommend"));
				board.setCreated(rs.getDate("created"));
				list.add(board);
			 }
			
		//	if(index < (start + limit) && index <= total_record) {
				index++;
		//	} else {
		//		break;
		//	}
				if(index > end) {
					break;
				}
		}	
			System.out.println("getBoardList 성공");
			return list;
			
		} catch (Exception e) {
			System.out.println("getBoardList 오류");
			e.printStackTrace();
		}
		return null;
	}

	
	public void insertWrite(BoardDTO dto) {
		
		String sql = "insert into board values(?,?,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getNum());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getNickname());
			psmt.setString(4, dto.getTitle());
			psmt.setString(5, dto.getContent());
			psmt.setString(6, dto.getPhoto());
			psmt.setInt(7, dto.getHit());
			psmt.setInt(8, dto.getRecommend());

			
			Date date1 = dto.getCreated();
			java.sql.Date date2 = new java.sql.Date(date1.getTime());
			
			psmt.setDate(9,date2);

			
			psmt.executeUpdate();
			
			
			System.out.println("insertWrite 성공");
		} catch (Exception e) {
			System.out.println("insertWrite 오류"+e);
			
		}
		
	}
	public BoardDTO getBoardByNum(int num) {
		
		String sql = "select * from board where num = ?";
		BoardDTO dto = null;
		
		// 게시판 조회수 증가
		updateHit(num);
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPhoto(rs.getString("photo"));
				dto.setHit(rs.getInt("hit"));
				dto.setRecommend(rs.getInt("recommend"));
				dto.setCreated(rs.getDate("created"));
			}
			System.out.println("getBoardByNum 성공");
			
			
		} catch (Exception e) {
			System.out.println("getBoardByNum 오류");
			e.printStackTrace();
		}
		return dto;
	}


	private void updateHit(int num) {
		
		try {
			//DB에 증가된 횟수를 업데이트 시킴
			String sql = "update board set hit=hit+1 where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			
			System.out.println("updateHit 성공");
		} catch (Exception e) {
			System.out.println("updateHit 오류");
			e.printStackTrace();
		
		}
		
	}
	
	public void updateBoard(BoardDTO dto) {
		
		try {
			String sql = "update board set title=?, content=?, photo=? where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getPhoto());
			psmt.setInt(4, dto.getNum());
			psmt.executeUpdate();
			
			System.out.println("updateHit 성공");
		} catch (Exception e) {
			System.out.println("updateHit 오류");
			e.printStackTrace();
		
		}
	}
	
	public void deleteBoard(int num) {
		
		try {
			
			String sql = "delete from board where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			
			System.out.println("deleteBoard 성공");
		} catch (Exception e) {
			System.out.println("deleteBoard 오류");
			e.printStackTrace();
			
		}
	
	}

}



