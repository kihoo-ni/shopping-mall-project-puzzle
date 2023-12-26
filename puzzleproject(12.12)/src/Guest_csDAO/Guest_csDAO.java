package Guest_csDAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBconnect.DBconnect;
import Guest_csDTO.Guest_csDTO;
import Seller_csDTO.Seller_csDTO;
import boardDTO.CommentDTO;

public class Guest_csDAO extends DBconnect {

	public Guest_csDAO() {
		super();
	}
	
	// 상품상세페이지 고객센터에서 질문
	public void insertGuest_cs(Guest_csDTO dto) {
		
		String sql = "insert into guest_cs(id, title, content, productId) values(?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getProductId());
			
			psmt.executeUpdate();
			
			System.out.println("insertGuest_cs 성공");
		} catch (Exception e) {
			System.out.println("insertGuest_cs 오류");
			e.printStackTrace();
		}
	}
	
	
	
	// 상품상세페이지 고객센터에서 질문한 내용 출력
	public List<Guest_csDTO> listGuest_cs(String id) {
		List<Guest_csDTO> list = new ArrayList<Guest_csDTO>();
		
		String sql = "select * from guest_cs where id=?"; 
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				Guest_csDTO dto = new Guest_csDTO();
				dto.setCsnum(rs.getInt("csnum"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				
				String content = rs.getString("content");
				content = content.replaceAll("<br>", "\r\n");
				
				dto.setContent(content);
				
				dto.setProductId(rs.getString("productId"));
				String fullDateTime = rs.getString("created");
			    String datePart = fullDateTime.substring(0, 10);
				dto.setCreated(datePart);
				dto.setReplylist(getListReply(rs.getInt("csnum")));
				
				list.add(dto);
			}
			System.out.println("listGuest_cs 성공");
		} catch (Exception e) {
			System.out.println("listGuest_cs 오류");
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 고객질문에 대한 판매자의 답글 메소드 
		public ArrayList<Seller_csDTO> getListReply(int guest_csnum) {
			
			String sql = "select * from seller_cs where guest_csnum = ?";

			ArrayList<Seller_csDTO> list = new ArrayList<Seller_csDTO>();

			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, guest_csnum);
				ResultSet rs2 = psmt.executeQuery();

				while (rs2.next()) { // 반복문 이용하여 해당 게시물을 게시판에 나오게 함
					Seller_csDTO replylist = new Seller_csDTO();
					replylist.setSel_csnum(rs2.getInt("sel_csnum"));
					replylist.setGuest_csnum(rs2.getInt("guest_csnum"));
					replylist.setSel_id(rs2.getString("sel_id"));
					replylist.setSel_title(rs2.getString("sel_title"));
					replylist.setContent(rs2.getString("content"));
					String fullDateTime = rs2.getString("sel_created");
				    String datePart = fullDateTime.substring(0, 10);
					replylist.setSel_created(datePart);
					list.add(replylist);
				}
				rs2.close();
				System.out.println("CS_REPLY 성공");
			} catch (Exception e) {
				System.out.println("CS_REPLY 오류");
				e.printStackTrace();
			}
			return list;

		}
	
	//질문한 내용 삭제
	public void deleteGuset_cs(int csnum) {
		
		String sql = "delete from guest_cs where csnum = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, csnum);
			psmt.executeUpdate();
			
			System.out.println("deleteGuset_cs 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteGuset_cs 오류");
		}
		
	}
	
	
	// 상품상세페이지 고객센터에서 질문한 번호 출력
	public List<Guest_csDTO> listGuest_csfromCsnum(String id) {
		List<Guest_csDTO> list = new ArrayList<Guest_csDTO>();
		
		String sql = "select csnum from guest_cs where id=?"; 
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				Guest_csDTO dto = new Guest_csDTO();
				dto.setCsnum(rs.getInt("csnum"));
				
				list.add(dto);
			}
			System.out.println("listGuest_cs 성공");
		} catch (Exception e) {
			System.out.println("listGuest_cs 오류");
			e.printStackTrace();
		}
		
		return list;
	}
	
}
