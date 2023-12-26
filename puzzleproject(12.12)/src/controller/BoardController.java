package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import boardDAO.BoardDAO;
import boardDAO.CommentDAO;
import boardDAO.ReplyDAO;
import boardDTO.BoardDTO;
import boardDTO.CommentDTO;
import boardDTO.ReplyDTO;



public class BoardController extends HttpServlet {
       
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
		if(command.equals("/BoardListAction.list")) {  //등록된 글 출력하기
			requestBoard(request);
			request.getRequestDispatcher("./list.jsp").forward(request, response);
			
		} else if(command.equals("/BoardWriteForm.list")) {	//글 등록 페이지 출력
			request.getRequestDispatcher("./write.jsp").forward(request, response);
			
		} else if(command.equals("/BoardWriteAction.list")) {	//새로운 글을 등록함
			requestBoardWrite(request);
			request.getRequestDispatcher("/BoardListAction.list").forward(request, response);
			
		} else if(command.equals("/BoardViewAction.list")) {	//게시물 상세 보기
			requestBoardView(request);
			requsetReplyView(request);
			request.getRequestDispatcher("./view.jsp").forward(request, response);
			
		} else if(command.equals("/BoardUpdateAction.list")) {	//게시물 수정
			requestBoardUpdate(request);
			response.sendRedirect("./BoardViewAction.list?num="+request.getParameter("num")+"&pageNum="+request.getParameter("pageNum"));
		} else if (command.equals("/BoardDeleteAction.list")) { // 게시물 삭제
			requestBoardDelete(request);
			request.getRequestDispatcher("/BoardListAction.list").forward(request, response);

		}
			 
	}
	public void requestBoard(HttpServletRequest request) {  //등록된 글 목록 가져오기
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum = 1;
		int limit = 20; // 한 페이지 당 표시할 게시물 개수 (상수값 20로 설정)
		
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String items = request.getParameter("items"); // 검색 항목
		String text = request.getParameter("text"); // 검색 내용
		
		int total_record = dao.getListCount(items, text); //조건에 맞는 행 개수
		boardlist = dao.getBoardList(pageNum, limit, items, text);
		dao.close();
		// 페이지 개수, 한 화면에 표시할 행 개수, 검색항목, 검색 내용을 boardlist에 대입
		
		int total_page;
		
		// 전체 게시물 개수에서 한 페이지당 표시할 개수를 나눈 나머지가 0과 같으면
			// 예) 한 페이지당 10개씩 게시물을 표시함, 전체 게시물이 100개
			// 100/10 - > 나머지 0 전체 페이지수는 10으로 표시함
		total_page = total_record/limit;
		if(total_record % limit != 0) {
			total_page++;
		}
		// 예) 한 페이지당 10개씩 표시, 전체 게시물이 105개면 
		// 전체 페이지 수는 10개에 더하기 1을 추가하여 11 페이지가 나와야 함
		
		int begin = (int)Math.floor((pageNum-1)/10);
		begin = begin*10+1;
		int end = begin+9;
		if (end > total_page) {
			end = total_page;
		}
		
		// 게시글 가상 번호
		int countNum = 1;
	    for (BoardDTO dto : boardlist) {
	        dto.setVirtualNum(total_record - (((pageNum - 1) * limit) + countNum++) + 1);
	    }

		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("begin", begin);
		request.setAttribute("end", end);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardlist);
		
	}

	public void requestBoardWrite(HttpServletRequest request) throws IOException {
		
		// 첨부파일(이미지) 삽입  
		String saveDirectory = request.getServletContext().getRealPath("/resources/images");  // 실제 저장 폴더 경로
		int maxPostSize = 1024 * 1024*10; // 10MB
		String encoding = "utf-8";
		MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding);  // 실제 업로드
		String photo = mr.getFilesystemName("photo");
		if (photo != null) {
			File file = new File(saveDirectory + File.separator + photo);
		}
		
		BoardDAO dao = new BoardDAO();
		
		String id = mr.getParameter("id");
		System.out.println("id: "+id);
		String nickname = mr.getParameter("nickname");
		System.out.println("nickname: "+nickname);
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		content = content.replaceAll("\r\n", "<br>");
		
		BoardDTO dto = new BoardDTO();
		
		dto.setId(id);
		dto.setNickname(nickname);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPhoto(photo);
		  
		dto.setCreated(new Date());  	// 오늘 날짜를 등록일자로 입력 
		dto.setHit(0); 		// 조회수 0 으로 세팅
		dto.setRecommend(0); 	// 좋아요 0으로 세팅
		dao.insertWrite(dto); 		// boardDAO를 호출해서 삽입구문 처리
		
		dao.close();
		
	}
	
	// 게시물 상세보기
	public void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = new BoardDAO();
		
		BoardDTO board = dao.getBoardByNum(Integer.parseInt(request.getParameter("num"))); //dao의 메소드 이용해 상세 내용 가져오기
		dao.close();
		
		request.setAttribute("board", board);
				
	}
	
	// 댓글 출력
	public void requsetReplyView(HttpServletRequest request) {
		ReplyDAO dao = new ReplyDAO();
		List<ReplyDTO> replylist = new ArrayList<ReplyDTO>();



		/* int c_num = 0; */ // 확인 및 수정
		int c_num = Integer.parseInt(request.getParameter("num"));
		replylist = dao.getListReply(c_num);
		dao.close();

		

		request.setAttribute("replylist", replylist);
	}
	
	//게시글 수정
	public void requestBoardUpdate(HttpServletRequest request) throws IOException {
		
		// 첨부파일(이미지) 삽입  
		String saveDirectory = request.getServletContext().getRealPath("/resources/images");  // 실제 저장 폴더 경로
		int maxPostSize = 1024 * 1024*10; // 10MB
		String encoding = "utf-8";
		MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding);  // 실제 업로드
		String photo = mr.getFilesystemName("photo");
		if (photo != null) {
			File file = new File(saveDirectory + File.separator + photo);
		}
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = new BoardDTO();
		
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPhoto(mr.getFilesystemName("photo"));
		dto.setNum(Integer.parseInt(mr.getParameter("num")));
		dao.updateBoard(dto);
		dao.close();
	}
	
	
		// 게시글 삭제
	public void requestBoardDelete(HttpServletRequest request) {
		BoardDAO dao = new BoardDAO();

		 HttpSession session = request.getSession(); 
		 String loginId = (String) session.getAttribute("id");
		String writeId = request.getParameter("id");
		

		
		if (writeId.equals(loginId)) {
			dao.deleteBoard(Integer.parseInt(request.getParameter("num")));
		}
		dao.close();

	}

}

