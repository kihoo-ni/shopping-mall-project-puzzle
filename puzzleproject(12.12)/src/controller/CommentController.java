package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardDAO.CommentDAO;
import boardDAO.ReplyDAO;
import boardDTO.CommentDTO;
import boardDTO.ReplyDTO;

public class CommentController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
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
			
			// 페이지 이동시 넘기는 값
			String num = request.getParameter("num");
			String pageNum = request.getParameter("pageNum");
			
			if(command.equals("/CommentWriteAction.comment")) {
				requestCommentWrite(request);
				response.sendRedirect("BoardViewAction.list?num="+num+"&pageNum="+pageNum);
			}else if(command.equals("/CommentDeleteAction.comment")) { // 대댓글 삭제
				requestCommentDelete(request);
				response.sendRedirect("BoardViewAction.list?num="+num+"&pageNum="+pageNum);
			}
	}
			
			
		// 답글 작성
		public void requestCommentWrite(HttpServletRequest request) {
			
			CommentDAO dao = new CommentDAO();
			int re_num = Integer.parseInt(request.getParameter("re_num"));
			
			String id = request.getParameter("id");
			String nickname = request.getParameter("nickname");
			String content = request.getParameter("content");
			content = content.replaceAll("\r\n", "<br>");
			
			
			
			/*
			 * System.out.println(nickname); 
			 * System.out.println(content);
			 */
			
				
			CommentDTO dto = new CommentDTO();
				
			dto.setRe_num(re_num);
			dto.setContent(content);
			dto.setId(id);
			dto.setNickname(nickname);
			dao.insertComment(dto);
				
			dao.close();
				
		}	
		
		// 답글 삭제
		public void requestCommentDelete(HttpServletRequest request) {
			CommentDAO dao = new CommentDAO();

			HttpSession session = request.getSession(); 
			String id = (String) session.getAttribute("id");
			String writeId = request.getParameter("id");
			int co_num=Integer.parseInt(request.getParameter("co_num"));

			if (writeId.equals(id)) {
				dao.deleteComment(co_num);
			}
			dao.close();

		}
		


	
	



}
