package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardDAO.ReplyDAO;
import boardDTO.ReplyDTO;

public class ReplyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT=5;
	
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
		
		// 페이지 넘기는 값
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pageNum");
		
		if(command.equals("/ReplyListAction.reply")) { 	// 등록된 댓글 출력 = BoardController에서 넘기기로 함(사용x)
			/* requestReply(request); */
			/* request.getRequestDispatcher("BoardViewAction.do?num="+num+"&pageNum="+pageNum).forward(request, response); */
			response.sendRedirect("BoardViewAction.list?num="+num+"&pageNum="+pageNum);
			
		} else if(command.equals("/ReplyWriterAction.reply")) {		// 댓글 등록
			requestReplyWrite(request);
			response.sendRedirect("BoardViewAction.list?num="+num+"&pageNum="+pageNum);
			//request.getRequestDispatcher("./view.jsp?num="+num+"&pageNum="+pageNum).forward(request, response);
		
		} else if(command.equals("/ReplyUpdateAction.reply")) {		// 댓글 수정
			requestReplyUpdate(request, response);
			response.sendRedirect("BoardViewAction.list?num="+num+"&pageNum="+pageNum);
			/*
			 * request.getRequestDispatcher("./view.jsp").forward(request, response); //
			 * 확인하기
			 */		
		} else if(command.equals("/ReplyDeleteAction.reply")) { // 댓글 삭제
			requestReplyDelete(request);
			response.sendRedirect("BoardViewAction.list?num="+num+"&pageNum="+pageNum);
		}
	}
	
	// 댓글 작성
	public void requestReplyWrite(HttpServletRequest request) {
		ReplyDAO dao = new ReplyDAO();
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("content");
		content = content.replaceAll("\r\n", "<br>");
		ReplyDTO dto = new ReplyDTO();
		
		dto.setC_num(c_num);
		dto.setContent(content);
		dto.setId(id);
		dto.setNickname(nickname);
		dao.insertReply(dto);
		
		dao.close();
		
	}
	
	
	// 댓글 수정
	public void requestReplyUpdate(HttpServletRequest request, HttpServletResponse response) {
		ReplyDAO dao = new ReplyDAO();
		
		ReplyDTO dto = new ReplyDTO();
		dto.setContent(request.getParameter("content"));
		dto.setR_num(Integer.parseInt(request.getParameter("r_num")));
		dao.updateReply(dto);
		
		
		dao.close();
	}
	
	
	// 댓글 삭제
	public void requestReplyDelete(HttpServletRequest request) {
		ReplyDAO dao = new ReplyDAO();

		HttpSession session = request.getSession(); 
		String id = (String) session.getAttribute("id");
		String writeId = request.getParameter("id");
	

		if (writeId.equals(id)) {
			dao.deleteReply(Integer.parseInt(request.getParameter("r_num")));
		}
		dao.close();

	}
	








}
