package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;



import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.JSFunction;
import memberDTO.memberDTO;
import productDAO.productDAO;
import productDTO.productDTO;
import productbuyDAO.productbuyDAO;
import productbuyDTO.productbuyDTO;
import reviewDAO.reviewDAO;
import reviewDTO.reviewDTO;



public class sellercontroller extends HttpServlet {
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
		
		//파일경로만 가져오기때문에 앞부분 자르고 *.product 가져올수 있음.
		if(command.equals("/addproduct.product")) { // 상품 등록처리
			addproduct(request, response);
		} else if(command.equals("/addcart.product")){ // 장바구니 등록
			addCart(request, response, session);
		} else if(command.equals("/cartview.product")){ // 장바구니 뷰 가져오기
			viewCart(request, session);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}  else if(command.equals("/delectCartItem.product")){ // 장바구니 항목삭제
			delectCartItem(request, session);
			response.sendRedirect("./cartview.product");
			//request.getRequestDispatcher("./cartview.product").forward(request, response);
		} else if(command.equals("/listorder1.product")){ // 주문페이지로 이동(상세페이지에서)
			orderItemfromItems(request, response, session);
		} else if(command.equals("/listorder2.product")){ // 주문페이지로 이동(장바구니에서)
			orderItemfromCart(request, session);
			request.getRequestDispatcher("./productOrder_cart.jsp").forward(request, response);
		} else if(command.equals("/addProductOrderCart.product")){ // 홈페이지로 (장바구니 주문후)
			addorderCart(request, session);
			request.getRequestDispatcher("./welcome.jsp").forward(request, response);
		} else if(command.equals("/addProductOrderitems.product")){ // 결제페이지로 이동(상세페이지에서)
			addorder(request, session);
			request.getRequestDispatcher("./payment_items.jsp").forward(request, response);
		} else if(command.equals("/orderlist.product")){ // 주문목록페이지로
			listorder(request, session);
			request.getRequestDispatcher("./mypage_orderlist.jsp").forward(request, response);
		} else if(command.equals("/delectOrderItem.product")){ // 주문목록 항목 삭제
			deleteOrderItem(request);
			request.getRequestDispatcher("orderlist.product").forward(request, response);
		} else if(command.equals("/addreview.product")){ // 상품후기 등록
				addreview(request, response, session);
		} else if(command.equals("/deletereview.product")){ // 상품후기 삭제(상세보기페이지기준)
				deletereview(request, response, session);
		} else if(command.equals("/reviewlist.product")){ // 상품후기 보기(mypage에서 내가작성한것만)
				reviewlist(request, session, response);
		} else if(command.equals("/deletereviewfromMypage.product")){ //상품후기 삭제(마이페이지기준)
				deletereviewfromMypage(request, response, session);
		} else if(command.equals("/arrayProduct.product")){ //상품전체리스트 보이게하기 
				arrayProduct(request, response, session);
		} else if(command.equals("/addPaymentOrderlist.product")){ //결제 추가(주문목록에서)
				addPaymentOrderlist(request, response, session);
				request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
		} else if(command.equals("/addPaymentItem.product")){ //결제 추가(상세페이지에서)
				addPaymentItem(request, response, session);
				request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
		} else if(command.equals("/paymentlist.product")){ // 결제목록 페이지로 
				listpayment(request, session);
				request.getRequestDispatcher("./mypage_paymentlist.jsp").forward(request, response);
		} else if(command.equals("/deletePaymentItem.product")){ // 결제목록 페이지에있는 결제항목 삭제
				deletePaymentItem(request, session);
				request.getRequestDispatcher("/paymentlist.product").forward(request, response);
		} else if(command.equals("/updateCartProductNum.product")){ // 장바구니 수량변경 메소드 
			  updateCartProductNum(request,response, session);
			  request.getRequestDispatcher("/cartview.product").forward(request, response);
		} else if(command.equals("/shippinglist.product")){ // 배송관리
			listpaymentAll(request, session);
			request.getRequestDispatcher("./sellerpage_shipping.jsp").forward(request, response);
		} else if(command.equals("/shippment.product")){ // 배송상태 변경
			updateShippment(request, session);
			request.getRequestDispatcher("/shippinglist.product").forward(request, response);
		} 
	}
	
	//상품등록 메소드
	public void addproduct(HttpServletRequest request, HttpServletResponse response) {
		ServletContext application=getServletContext();
		String saveDirectory=application.getRealPath("/resources/images"); //저장할 디렉토리
//		String realFolder="C:\\jsp\\puzzleproject\\WebContent\\resources\\img"; // 실제 c:jsp 폴더에 저장
		
		int maxPostSize=1024*10000; // 파일 최대크기 (10MB)
		String encoding="utf-8"; 
		try {
		MultipartRequest mr=new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		String productId = mr.getParameter("productId");
		String productName = mr.getParameter("productName");
		int productUnitPrice = Integer.parseInt(mr.getParameter("productUnitPrice")); 
		String productDescription = mr.getParameter("productDescription");
		String productBrand = mr.getParameter("productBrand");
		String productCategory1 = mr.getParameter("productCategory1");
		String productCategory2 = mr.getParameter("productCategory2");
		int productInStock =Integer.parseInt(mr.getParameter("productInStock"));  
		String productImage = mr.getFilesystemName("productImage");
		
		
		productDTO productdto=new productDTO();
		productdto.setProductId(productId);
		productdto.setProductName(productName);
		productdto.setProductUnitPrice(productUnitPrice);
		productdto.setProductDescription(productDescription);
		productdto.setProductBrand(productBrand);
		productdto.setProductCategory1(productCategory1);
		productdto.setProductCategory2(productCategory2);
		productdto.setProductInStock(productInStock);
		productdto.setProductImage(productImage);
		
		productDAO productdao=new productDAO(); 
		int result =productdao.addProduct(productdto);
		productdao.close();
		if( result==1) {
			
			response.sendRedirect("./welcome.jsp");
		} else {
			request.setAttribute("warn", "등록에 실패하였습니다.");
			request.getRequestDispatcher("./sellerpage_addProduct.jsp").forward(request, response);
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니 등록 메소드

		public void addCart(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			String id=(String)session.getAttribute("id");
			String productId=request.getParameter("productId");
			String productName=request.getParameter("productName");
			String productImage=request.getParameter("productImage");
			int productUnitPrice=Integer.parseInt(request.getParameter("productUnitPrice"));
			int productNumber=Integer.parseInt(request.getParameter("productNumber"));
			int productInStock=Integer.parseInt(request.getParameter("productInStock"));
			
			System.out.println(id);
			System.out.println(productId);
			System.out.println(productName);
			System.out.println(productUnitPrice);
			System.out.println(productNumber);
			System.out.println(productInStock);
			System.out.println(productImage);
			
			productbuyDAO dao = new productbuyDAO();
			String result="이미 장바구니에 등록된 상품입니다.";
			productDAO dao2=new productDAO();
			productDTO dto= dao2.detailProduct(productId);
			System.out.println(dto.getProductInStock());
			dao2.close();
			if(dto.getProductInStock()>=productNumber) {
		
				if(productId==null||productId.equals("")) {
					
				} else {
					result=dao.addCart(id, productId, productName, productUnitPrice, productNumber, productInStock, productImage );
				}
			} else {
				result="현재 장바구니에 담을 재고가 부족합니다.";
			}
			
			
			
			request.setAttribute("result", result);
			dao.close();
			try {
				request.getRequestDispatcher("view.search?productId="+productId).forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	//장바구니 뷰 메소드
	
	public void viewCart(HttpServletRequest request, HttpSession session) {
		
		String id=(String)session.getAttribute("id");
		productbuyDAO dao = new productbuyDAO();
		List<productbuyDTO> products=dao.searchCartId(id);
		int sum=dao.SumCartAll(id);
		request.setAttribute("products", products);
		request.setAttribute("sum", sum);
		dao.close();
	}
	
	//장바구니 항목 삭제 메소드
	
	public void delectCartItem(HttpServletRequest request, HttpSession session) {
		
		String id=(String)session.getAttribute("id");
		String productId=request.getParameter("productId");
		productbuyDAO dao = new productbuyDAO();
		dao.deleteProduct(id, productId);
		dao.close();
	}
	
	//상품 주문페이지에 정보전달메소드(상세페이지에서 전달)	
	public void orderItemfromItems(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		
		String productId=request.getParameter("productId");
		String productName=request.getParameter("productName");
		String productImage=request.getParameter("productImage");
		int productUnitPrice=Integer.parseInt(request.getParameter("productUnitPrice"));
		int productNumber=Integer.parseInt(request.getParameter("productNumber"));
		int sum=productNumber*productUnitPrice;
		int productInStock=Integer.parseInt(request.getParameter("productInStock"));
		System.out.println("productInStock: "+productInStock);
		System.out.println("productNumber: "+productNumber);
		if(productNumber<=productInStock) {
			productbuyDTO dto= new productbuyDTO();
			dto.setProductId(productId);
			dto.setProductName(productName);
			dto.setProductUnitPrice(productUnitPrice);
			dto.setProductNumber(productNumber);
			dto.setProductImage(productImage);
			request.setAttribute("product", dto);
		} else {
			try {
				JSFunction.alertBack("구입하실 수량이 재고를 초과합니다.", response.getWriter());
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			request.getRequestDispatcher("./productOrder.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//상품 주문페이지에 정보전달메소드(장바구니에서 전달)	
	public void orderItemfromCart(HttpServletRequest request, HttpSession session) {
		
		String id=(String)session.getAttribute("id");
		productbuyDAO dao = new productbuyDAO();
		List<productbuyDTO> products=dao.searchCartId(id);
		int sum=dao.SumCartAll(id);
		request.setAttribute("products", products);
		request.setAttribute("sum", sum);
		
		dao.close();
		
	}
	
	//주문 추가 메소드(상세페이지)

			public void addorder(HttpServletRequest request,  HttpSession session) {
				String id=(String)session.getAttribute("id");
				String productId=request.getParameter("productId");
				String productName=request.getParameter("productName");
				int productUnitPrice=Integer.parseInt(request.getParameter("productUnitPrice"));
				int productNumber=Integer.parseInt(request.getParameter("productNumber"));
				String address1=request.getParameter("address1");
				String address2=request.getParameter("address2");
				String address3=request.getParameter("address3");
				String address=address1+" "+address2+" "+address3;
				String phone = request.getParameter("phone");
				String name = request.getParameter("name");
				String postmessage = request.getParameter("postmessage");
				String productImage = request.getParameter("productImage");
				
				/*
				 * productbuyDTO dto= new productbuyDTO(); dto.setProductId(productId);
				 * dto.setProductName(productName); dto.setProductUnitPrice(productUnitPrice);
				 * dto.setProductNumber(productNumber); request.setAttribute("product", dto);
				 */
				productDAO pdao=new productDAO();
				int result=pdao.minusInventory(productId, productNumber);
				
				productbuyDAO dao = new productbuyDAO();
				dao.addOrdersfromItems(id, name, address, phone, postmessage, productId, productName, productUnitPrice, productNumber, productImage);
				productbuyDTO dto=dao.searchOrderIdDesc(id);
				request.setAttribute("product", dto);
				dao.close();
				pdao.close();
			}
			
	
		//주문 추가 메소드(장바구니)
		
		public void addorderCart(HttpServletRequest request,  HttpSession session) {
			String id=(String)session.getAttribute("id");
			
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			String address3=request.getParameter("address3");
			String address=address1+" "+address2+" "+address3;
			String phone = request.getParameter("phone");
			String name = request.getParameter("name");
			String postmessage = request.getParameter("postmessage");
			
			
			productbuyDAO dao = new productbuyDAO();
			List<productbuyDTO> cartlist=dao.searchCartId(id);
			request.setAttribute("products", cartlist);
			
			dao.addOrdersfromCart(id, name, address, phone, postmessage, cartlist );
			int sum=dao.SumCartAll(id);
			request.setAttribute("sum", sum);
			
			productDAO pdao= new productDAO();
			//재고감소 메소드
			pdao.decreaseInventoryForCart(cartlist);
			
			//장바구니 비우기
			dao.clearCart(id);
			pdao.close();
			dao.close();
		}
		
		//주문목록 메소드
		
		public void listorder(HttpServletRequest request, HttpSession session) {
			
			String id=(String)session.getAttribute("id");
			productbuyDAO dao = new productbuyDAO();
			List<productbuyDTO> products=dao.searchOrderId(id);
			int sum=dao.SumOrderAll(id);
			request.setAttribute("products", products);
			request.setAttribute("sum", sum);
			dao.close();
		}
		
		//주문목록 항목 삭제 메소드
		
		public void deleteOrderItem(HttpServletRequest request) {
			
			int productOrderNumber=Integer.parseInt(request.getParameter("productOrderNumber"));
			int productNumber=Integer.parseInt(request.getParameter("productNumber"));
			String productId=request.getParameter("productId");
			productbuyDAO dao = new productbuyDAO();
			dao.deleteOrderProduct(productOrderNumber);
			
			productDAO pdao=new productDAO();
			int result=pdao.plusInventory(productNumber, productId);
			pdao.close();
			dao.close();
		}
		
		
		//상품 후기등록 메소드
		public void addreview(HttpServletRequest request, HttpServletResponse response , HttpSession session) {
			ServletContext application=getServletContext();
			String saveDirectory=application.getRealPath("/resources/images"); //저장할 디렉토리
//			String realFolder="C:\\jsp\\puzzleproject\\WebContent\\resources\\img"; // 실제 c:jsp 폴더에 저장
			
			int maxPostSize=1024*10000; // 파일 최대크기 (10MB)
			String encoding="utf-8"; 
			try {
			MultipartRequest mr=new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			
			
			String id=(String)session.getAttribute("id");
			
			String productId = mr.getParameter("productId");
			String nickName = mr.getParameter("nickName");
			String reviewContent = mr.getParameter("reviewContent");
			reviewContent.replaceAll("\r\n", "<br>");
			
			String reviewImage = mr.getFilesystemName("reviewImage");
			
			
			reviewDAO reviewdao=new reviewDAO();
			
			int result=reviewdao.addreview(id, nickName, productId, reviewContent, reviewImage);
			System.out.println(result);
			if( result==1) {
				request.getRequestDispatcher("view.search?productId="+productId).forward(request, response);
			} else {
				request.setAttribute("warning", "상품 후기 등록에 실패하였습니다.");
				request.getRequestDispatcher("view.search?productId="+productId).forward(request, response);
			}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//상품후기 삭제 메소드(상세보기페이지에서 삭제/ 자기것만 삭제하기 )
		
		public void deletereview(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			
			int reviewNumber=Integer.parseInt(request.getParameter("reviewNumber"));
			String id=(String)session.getAttribute("id");
			String productId = request.getParameter("productId");
			reviewDAO dao=new reviewDAO();
			
			int result=dao.deletereview(reviewNumber, id);
			dao.close();
			try {
				if(result==1) {
				} else {
					request.setAttribute("warn", "본인이 작성한 상품후기만 삭제 가능합니다.");
					
				}
				request.getRequestDispatcher("view.search?productId="+productId).forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//상품후기 목록가져오기 메소드
		
				public void reviewlist(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
					
					String id=(String)session.getAttribute("id");
					reviewDAO dao=new reviewDAO();
					ArrayList<reviewDTO> reviews = new ArrayList<reviewDTO>();
					reviews=dao.getAllReviewfromId(id);
					
					// 역순으로 정렬
					 Collections.reverse(reviews);
					
					request.setAttribute("reviews", reviews);
					dao.close();
					try {
						request.getRequestDispatcher("mypage_reviewlist.jsp").forward(request, response);
					} catch (ServletException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
		
			//상품후기 삭제 메소드(마이페이지에서 삭제)
			
			public void deletereviewfromMypage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
				
				int reviewNumber=Integer.parseInt(request.getParameter("reviewNumber"));
				String id=(String)session.getAttribute("id");
				String productId = request.getParameter("productId");
				reviewDAO dao=new reviewDAO();
				int result=dao.deletereview(reviewNumber, id);
				dao.close();
				try {
					
					request.getRequestDispatcher("reviewlist.product").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}	
			
			
			//셀러페이지_ 상품관리 전체 상품리스트 열거메소드
			
			public void arrayProduct(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
				ArrayList<productDTO> productlist = new ArrayList<productDTO>();
				productDAO dao=new productDAO();
				productlist=dao.getAllProduct();
				request.setAttribute("productlist", productlist);
				dao.close();
				try {
					
					request.getRequestDispatcher("sellerpage_productlist.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			//결제 추가 메소드(주문목록에서)
			
			public void addPaymentOrderlist(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
				String id=(String)session.getAttribute("id");
				
				productbuyDAO dao = new productbuyDAO();
				List<productbuyDTO> orderlist=dao.searchOrderId(id);
				//주문목록에있는거 결제목록으로 추가
				dao.addPaymentfromOrderlist(orderlist);	
				
				
				//주문목록 비우기
				dao.clearOrderlist(id);
				
				//결제주문번호 불러오기
				int result=dao.getordersetnumber(id);
				request.setAttribute("ordernumber", result);
				dao.close();
			}
			
		
			
			//결제 추가 메소드(상세페이지에서)
			public void addPaymentItem(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
				String id=(String)session.getAttribute("id");
				int orderNumber=Integer.parseInt(request.getParameter("orderNumber")); 
				System.out.println("orderNumber: "+orderNumber);
				
				productbuyDAO dao = new productbuyDAO();
				List<productbuyDTO> orderlist=dao.getProductOrderlist(id, orderNumber);
				System.out.println("orderlist: "+orderlist);
				//주문목록에있는거 결제목록으로 추가
				dao.addPaymentfromOrderlist(orderlist);	
				
				
				//주문목록 비우기
				dao.clearOrderlist(id, orderNumber);
				
				//결제주문번호 불러오기
				int result=dao.getordersetnumber(id);
				request.setAttribute("ordernumber", result);
				dao.close();
			}
			
			
			
			//결제목록 가져오는 메소드
			
			public void listpayment(HttpServletRequest request, HttpSession session) {
				String id=(String)session.getAttribute("id");
				productbuyDAO dao = new productbuyDAO();
				List<productbuyDTO> products=dao.searchPaymentId(id);
				int sum=dao.SumPaymentAllfromId(id);
				request.setAttribute("products", products);
				request.setAttribute("sum", sum);
				dao.close();
			}
			
			//결제한 목록 셀러페이지에 뿌리는 메소드
			
			public void listpaymentAll(HttpServletRequest request, HttpSession session) {
				productbuyDAO dao = new productbuyDAO();
				List<productbuyDTO> products=dao.searchPaymentAll();
				int sum=dao.SumPaymentAll();
				request.setAttribute("products", products);
				request.setAttribute("sum", sum);
				dao.close();
			}
			
			
			//결제목록에 있는 결제항목 삭제하는 메소드
			
			public void deletePaymentItem(HttpServletRequest request, HttpSession session) {
				
				String id=(String)session.getAttribute("id");
				int paymentnumber=Integer.parseInt(request.getParameter("paymentnumber"));
				int productNumber=Integer.parseInt(request.getParameter("productNumber"));
				String productId=request.getParameter("productId");
				
				productbuyDAO dao = new productbuyDAO();
				dao.deletePaymentProduct(paymentnumber);
				productDAO Pdao=new productDAO();
				int result =Pdao.plusInventory(productNumber, productId);
				dao.close();
				Pdao.close();
			}
			
			
			
			//장바구니 수량변경

			public void updateCartProductNum(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
				String id=(String)session.getAttribute("id");
				String productId=request.getParameter("productId");
				int productNumber=Integer.parseInt(request.getParameter("productNumber"));
				
				productbuyDAO dao = new productbuyDAO();
				productDAO dao2=new productDAO();
				productDTO dto= dao2.detailProduct(productId);
				
				
				System.out.println(id);
				System.out.println(productId);
				System.out.println(productNumber);
				System.out.println(dto.getProductInStock());
				
				String warnInstock="";

				
				if(dto.getProductInStock()>=productNumber) {
					int result=dao2.cartProductNumberEdit(id, productId, productNumber);
					System.out.println("result : "+result);
				} else {
					warnInstock="재고초과";
				}
				
								
				
				request.setAttribute("warnInstock", warnInstock);
				dao2.close();
				dao.close();
				
			}
			
			
			//결제목록에 있는 결제항목 삭제하는 메소드
			
			public void updateShippment(HttpServletRequest request, HttpSession session) {
				
				int paymentNumber=Integer.parseInt(request.getParameter("paymentNumber"));
				String shippingStatus=request.getParameter("shipping");
				productbuyDAO dao = new productbuyDAO();
				dao.editShippment(shippingStatus, paymentNumber);
				dao.close();
			}
			
			
			//결제한 목록 셀러페이지에 뿌리는 메소드
			
			public void searchShippment(HttpServletRequest request, HttpSession session) {
				productbuyDAO dao = new productbuyDAO();
				List<productbuyDTO> products=dao.searchPaymentAll();
				int sum=dao.SumPaymentAll();
				request.setAttribute("products", products);
				request.setAttribute("sum", sum);
				dao.close();
			}
			
}


