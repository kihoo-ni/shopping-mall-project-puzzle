package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Guest_csDAO.Guest_csDAO;
import Guest_csDTO.Guest_csDTO;
import Seller_csDAO.Seller_csDAO;
import Seller_csDTO.Seller_csDTO;


public class Seller_csController extends HttpServlet {
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 경로 설정
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
			
		// 한글처리
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
	
		if(command.equals("/insertSeller_cs.seller")) {
			insertSeller_cs(request, response);
			request.getRequestDispatcher("listCs.seller").forward(request, response);
		} else if(command.equals("/listCs.seller")) {
			listSeller_cs(request, response);
			request.getRequestDispatcher("sellerpage_cs.jsp").forward(request, response);
		}
	}
	// 고객센터 문의글 작성
	public void insertSeller_cs(HttpServletRequest request, HttpServletResponse response) {
		
		// 나중에 관리자 sessionId로 변경
		String sellerId  =request.getParameter("sel_id");
		
		
		Seller_csDTO dto = new Seller_csDTO();
		
		dto.setSel_id(sellerId);
		dto.setGuest_csnum(Integer.parseInt(request.getParameter("guest_csnum")));
		dto.setSel_title(request.getParameter("sel_title"));
		dto.setContent(request.getParameter("content").replaceAll("\r\n", "<br>"));
		
		Seller_csDAO dao = new Seller_csDAO();
		dao.insertSeller_cs(dto);

		dao.close();
		
	}
	

	
	
	
	// 셀러 고객센터 문의글 출력
		public void listSeller_cs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			Seller_csDAO dao=new Seller_csDAO();
			
			List<Guest_csDTO> list = dao.listGuest_cs();
			
			dao.close();
			
			request.setAttribute("list", list);
			
		
			
		}
	
}
