package controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import productDAO.productDAO;
import productDTO.productDTO;
import reviewDAO.reviewDAO;
import reviewDTO.reviewDTO;



public class productsearchcontroller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI= request.getRequestURI(); // 프로젝트와 파일경로 둘다가져옴
		String contextPath= request.getContextPath(); // 프로젝트만 가져옴
		String command=requestURI.substring(contextPath.length()); // 파일경로만 가져옴 
		HttpSession session = request.getSession();
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//파일경로만 가져오기때문에 앞부분 자르고 *.search 가져올수 있음.
		if(command.equals("/leftmenu.search")) { // 상품카테고리 찾기 메소드
			leftmenusearch(request, response);
			request.getRequestDispatcher("./welcome_left_items.jsp").forward(request, response);
		} else if(command.equals("/view.search")) { // 상품 상세페이지
			productview(request, response, session);
			request.getRequestDispatcher("./items_info.jsp").forward(request, response);
		}  else if(command.equals("/recentItems.search")) { // 최근본 상품 페이지 로드 
			recentItems(request, response, session);
			request.getRequestDispatcher("./recentItems.jsp").forward(request, response);
		} else if(command.equals("/listProduct.search")) { // 상품목록 열거 페이지 로드 
			listProduct(request);
			request.getRequestDispatcher("./sellerpage_productlist.jsp").forward(request, response);
		} else if(command.equals("/editProduct.search")) { // 상품상세정보 변경 
			editProduct(request, response);
			request.getRequestDispatcher("/listProduct.search").forward(request, response);
		
		}else if(command.equals("/deleteProduct.search")) { // 상품삭제  
			deleteProduct(request, response);
			request.getRequestDispatcher("/listProduct.search").forward(request, response);
		
	} 
		
	}


	
	
	//상품카테고리 찾기 메소드
	public void leftmenusearch(HttpServletRequest request, HttpServletResponse response) {
		
		String productCategory1 = request.getParameter("productCategory1");
		String productCategory2 = request.getParameter("productCategory2");
		if(productCategory1==null) {
			productCategory1="0";
		}
		if(productCategory2==null) {
			productCategory2="0";
		}
		
		
		productDAO productdao=new productDAO(); 
		ArrayList<productDTO> productlist = new ArrayList<productDTO>();
		productlist=productdao.getcategoryProduct(productCategory1, productCategory2);
		
			request.setAttribute("productlist", productlist);
	}
	
	//상품 상세보기 메소드
	public void productview(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		// 상품 ID를 가져옴 
	    String productId = request.getParameter("productId");

	    // 세션에서 최근 본 상품 목록을 가져옴
	    List<String> recentlyViewedProducts = (List<String>) session.getAttribute("recentlyViewedProducts");

	    // 최근 본 상품 목록이 없다면 새로운 목록을 생성
	    if (recentlyViewedProducts == null) {
	        recentlyViewedProducts = new ArrayList<>();
	    }
	    
	    // 현재 상품 ID를 목록에 추가 (중복 허용하지 않음)
	    if (productId != null) {
	        // 이미 목록에 있다면 삭제
	        recentlyViewedProducts.remove(productId);

	        // 목록이 5개보다 크면 가장 오래된 상품 제거
	        if (recentlyViewedProducts.size() >= 5) {
	            recentlyViewedProducts.remove(0);
	        }

	        // 새로운 상품 추가
	        recentlyViewedProducts.add(productId);
	    }else {
			recentlyViewedProducts.add(productId);
		}
	   
	    // 세션에 최근 본 상품 목록을 다시 저장
	    session.setAttribute("recentlyViewedProducts", recentlyViewedProducts);
	    
	    reviewDAO reviewdao =new reviewDAO();
	    
	    
		//리뷰 목록 담기(productId 기준으로 가져옴)
	    ArrayList<reviewDTO> reviews = reviewdao.getAllReviewfromProductId(productId);
	
		 // 역순으로 정렬
		 Collections.reverse(reviews);
	
		 // request에 역순으로 정렬된 리뷰 리스트를 저장
		 request.setAttribute("reviews", reviews);
		    
	    
		productDTO productdto=new productDTO();
		productDAO productdao=new productDAO(); 
		productdto=productdao.detailProduct(productId);
		
		request.setAttribute("productdto", productdto);
	}
	
	
	//최근 본상품 가져오는 메소드
	public void recentItems(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		productDTO productdto=new productDTO();
		productDAO productdao=new productDAO(); 
	
		List<productDTO> products=new ArrayList<productDTO>();
		
		// 세션에서 최근 본 상품 목록을 가져옴
		List<String> recentlyViewedProducts = (List<String>) session.getAttribute("recentlyViewedProducts");
		 
		if (recentlyViewedProducts != null) {
				//역순 정렬
		        Collections.reverse(recentlyViewedProducts);

		     // 상품 id 리스트를 for문이용하여 각각 dao에 최근 본 상품 정보 넣기 
		        for (String productId : recentlyViewedProducts) {
		        	productdto=productdao.detailProduct(productId);
					products.add(productdto);
					request.setAttribute("products", products);
		        }
		    } else {
		    	request.setAttribute("warning", "최근 본 상품이 없습니다.");
		    }
		
		
	}
		//상품목록 가져오기 
		public void listProduct(HttpServletRequest request) { 
			productDAO dao= new productDAO(); 
			
			List<productDTO> Productlist = new ArrayList<productDTO>();
			
			String items =request.getParameter("items"); // 검색 항목
			String text =request.getParameter("text"); // 검색 내용
			
			Productlist = dao.getProductBoardList(items, text); 
			dao.close();
			
			request.setAttribute("Productlist", Productlist);
			
		}
		
		//상품정보 수정하기 
		public void editProduct(HttpServletRequest request,  HttpServletResponse response) { 
			String productName =request.getParameter("productName");
			int productUnitPrice =Integer.parseInt(request.getParameter("productUnitPrice"));
			String productDescription =request.getParameter("productDescription");
			String productBrand =request.getParameter("productBrand");
			int productInStock =Integer.parseInt(request.getParameter("productInStock"));
			String productId =request.getParameter("productId");
			
			productDAO dao= new productDAO(); 
			
			dao.EditProduct(productName, productUnitPrice, productDescription, productBrand, productInStock, productId);
			dao.close();
			
			
		}
		//상품삭제
		public void deleteProduct(HttpServletRequest request,  HttpServletResponse response) { 
			String productId =request.getParameter("productId");
			
			productDAO dao= new productDAO(); 
			
			dao.deleteProduct(productId);
			dao.close();
			
			
		}
}

	
	


