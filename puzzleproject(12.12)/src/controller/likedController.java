package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import boardDAO.likedDAO;
import boardDTO.likedDTO;
import jdk.nashorn.api.scripting.JSObject;

public class likedController extends HttpServlet {

	
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
		
		if(command.equals("/likedCheck.liked")) {
			likedCheck(request, response);
		}
		
	}
	
	public void likedCheck(HttpServletRequest request, HttpServletResponse response) {
	    likedDAO dao = new likedDAO();

	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");
	    int likeNum = Integer.parseInt(request.getParameter("likeNum"));
	    int searchResult = dao.searchRecommed(id, likeNum);

	    if (searchResult == 1) {
	        try {
				sendResponse(response, "duplicate", 0);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 중복 추천인 경우 응답을 보냅니다.
	    } else {
	      

	        likedDTO dto = new likedDTO();
	        dto.setC_id(id);
	        dto.setNum(likeNum);
	        dao.likedCheck(dto);
	        dao.updateRecommend(likeNum);
	        int count = dao.likedCount(likeNum);
	        try {
				sendResponse(response, "success", count);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 성공적인 추천인 경우 응답을 보냅니다.
	    }

	    dao.close();
	}
	public class LikedResponse {
	    private String result;
	    private int likeCount;
		public String getResult() {
			return result;
		}
		public void setResult(String result) {
			this.result = result;
		}
		public int getLikeCount() {
			return likeCount;
		}
		public void setLikeCount(int likeCount) {
			this.likeCount = likeCount;
		}

	    // 게터와 세터를 추가하세요.
	}
	private void sendResponse(HttpServletResponse response, String result, int likeCount) throws IOException {
	    
	    
	    JSONObject jsonResponse = new JSONObject();
	    jsonResponse.put("result", result);
	    jsonResponse.put("likeCount", likeCount);

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    try (PrintWriter out = response.getWriter()) {
	        out.print(jsonResponse.toString());
	    }
	}

	
	
	
}
