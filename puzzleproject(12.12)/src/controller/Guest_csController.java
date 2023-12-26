package controller;

import java.io.IOException;
import java.util.ArrayList;
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
import boardDAO.ReplyDAO;
import boardDTO.ReplyDTO;


public class Guest_csController extends HttpServlet {
	
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
	
		if(command.equals("/insertGuest_cs.guest")) {
			insertGuest_cs(request, response);
			
		} else if(command.equals("/listGuest_cs.guest")) {
			listGuest_cs(request, response);
			request.getRequestDispatcher("mypage_cs.jsp").forward(request, response);
		} else if(command.equals("/deleteGuestCs.guest")) {
			deleteGuest_cs(request, response);
			request.getRequestDispatcher("listGuest_cs.guest").forward(request, response);
		}
	}
	// 고객센터 문의글 작성
	public void insertGuest_cs(HttpServletRequest request, HttpServletResponse response) {
		
		// 나중에 sessionId로 변경
		 HttpSession session = request.getSession(); 
		 String customerId = (String) session.getAttribute("id");
		 String productId=request.getParameter("productId");
	
		Guest_csDTO dto = new Guest_csDTO();
		
		String content=request.getParameter("content");
		content.replaceAll("\r\n", "<br>");
		
		
		dto.setId(customerId);
		dto.setTitle(request.getParameter("title"));
		dto.setContent(content);
		
		dto.setProductId(productId);
		
		Guest_csDAO dao = new Guest_csDAO();
		dao.insertGuest_cs(dto);

		dao.close();
		try {
			request.getRequestDispatcher("view.search?productId="+productId).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 고객센터 문의글 출력
	public void listGuest_cs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Guest_csDAO dao = new Guest_csDAO();
		List<Guest_csDTO> replylist = new ArrayList<Guest_csDTO>();
		
		//세션아이디
		HttpSession session = request.getSession(); 
		String customerId = (String) session.getAttribute("id");
		


		replylist = dao.listGuest_cs(customerId);
		dao.close();

		

		request.setAttribute("replylist", replylist);
		
		
	}

	// 문의글 삭제
	public void deleteGuest_cs(HttpServletRequest request, HttpServletResponse response) {
		
		Guest_csDAO dao = new Guest_csDAO();
			dao.deleteGuset_cs(Integer.parseInt(request.getParameter("csnum")));
		dao.close();
		
		
	}
	
	
	
}
