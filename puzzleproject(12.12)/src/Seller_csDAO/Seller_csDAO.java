package Seller_csDAO;

import java.util.ArrayList;
import java.util.List;

import DBconnect.DBconnect;
import Guest_csDTO.Guest_csDTO;
import Seller_csDTO.Seller_csDTO;

public class Seller_csDAO extends DBconnect{

	public Seller_csDAO() {
		super();
	}
	
	// 고객 민원글에 답변 작성
	public void insertSeller_cs(Seller_csDTO dto) {
			
			String sql = "insert into seller_cs(guest_csnum, sel_id, sel_title, content) values(?,?,?,?)";
			 
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, dto.getGuest_csnum());
				psmt.setString(2, dto.getSel_id());
				psmt.setString(3, dto.getSel_title());
				psmt.setString(4, dto.getContent());
				
				psmt.executeUpdate();
				
				System.out.println("insertSeller_cs 성공");
			} catch (Exception e) {
				System.out.println("insertSeller_cs 오류");
				e.printStackTrace();
			}
		}
	
	// 민원 답변 출력
	public List<Seller_csDTO> selectSeller_cs(List<Guest_csDTO> listfromCsnum){
		List<Seller_csDTO> list = new ArrayList<Seller_csDTO>();
		List<Guest_csDTO> glist = new ArrayList<Guest_csDTO>();
		
		String sql = "select * from seller_cs where guest_csnum=?";
		for(Guest_csDTO guest_csnum : glist) {
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1,guest_csnum.getCsnum());
				psmt.executeQuery();
				
				while(rs.next()) {
					Seller_csDTO dto = new Seller_csDTO();
					dto.setSel_csnum(rs.getInt("sel_csnum"));
					dto.setGuest_csnum(rs.getInt("guest_csnum"));
					dto.setSel_id(rs.getString("sel_id"));
					dto.setSel_title(rs.getString("sel_title"));
					dto.setContent(rs.getString("content"));
					dto.setSel_created(rs.getString("sel_created"));
					list.add(dto);
				}
				
				System.out.println("고객에게 셀러가 민원보내기 성공");
			} catch (Exception e) {
				System.out.println("고객에게 셀러가 민원보내기 오류");
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
	// 답변 내용 삭제
	public void deleteSeller_cs(int sel_csnum) {
		
		String sql = "delete from seller_cs where sel_csnum = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, sel_csnum);
			psmt.executeUpdate();
			
			System.out.println("deleteSeller_cs 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteSeller_cs 오류");
		}
	}


	// 고객이 질문한내용 열거 
	public List<Guest_csDTO> listGuest_cs() {
		List<Guest_csDTO> list = new ArrayList<Guest_csDTO>();
		
		String sql = "select * from guest_cs"; 
		
		try {
			psmt=con.prepareStatement(sql);
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
				dto.setCreated(rs.getString("created"));
				
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
