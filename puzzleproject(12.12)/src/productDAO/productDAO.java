package productDAO;



import java.util.ArrayList;
import java.util.List;

import DBconnect.DBconnect;
import productDTO.productDTO;
import productbuyDTO.productbuyDTO;

public class productDAO extends DBconnect {

	public productDAO() {
		super();
	}
	
	// 상품 목록 가져오기
		public ArrayList<productDTO> getAllProduct() {
			ArrayList<productDTO> productlist = new ArrayList<productDTO>();
			String query = "select * from product";
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					productDTO dto = new productDTO();
					dto.setProductId(rs.getString(1));
					dto.setProductName(rs.getString(2));
					dto.setProductUnitPrice(rs.getInt(3));
					dto.setProductDescription(rs.getString(4));
					dto.setProductBrand(rs.getString(5));
					dto.setProductCategory1(rs.getString(6));
					dto.setProductCategory2(rs.getString(7));
					dto.setProductInStock(rs.getInt(8));
					dto.setProductImage(rs.getString(9));
					productlist.add(dto);
				}
				System.out.println("상품 목록 가져오기 성공");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("상품 목록 가져오기 오류");
			}
			return productlist;
		}
		
		
		
		// 상품 등록
		public int addProduct(productDTO product) {
			String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
			int result=0;
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1,product.getProductId());
				psmt.setString(2,product.getProductName());
				psmt.setInt(3,product.getProductUnitPrice());
				psmt.setString(4,product.getProductDescription());
				psmt.setString(5,product.getProductBrand());
				psmt.setString(6,product.getProductCategory1());
				psmt.setString(7,product.getProductCategory2());
				psmt.setLong(8,product.getProductInStock());
				psmt.setString(9, product.getProductImage());
				result=psmt.executeUpdate();
				System.out.println("상품 추가하기 성공");
				
			} catch(Exception e) {
				System.out.println("상품 추가하기 오류");
				e.printStackTrace();
			}
			return result;
			
			
		 }
		
		//상품 삭제
		public void deleteProduct(String id) {
			String sql = "delete from product where productId=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1,id);
				psmt.executeUpdate();
				
				System.out.println("상품 삭제하기 성공");
			} catch(Exception e) {
				System.out.println("상품 삭제하기 오류");
				e.printStackTrace();
			}
			
		}
		// 상품 상세정보가져오기
		public productDTO detailProduct(String productId) {
			productDTO dto= new productDTO();
			String sql="select * from product where productId=?";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setString(1, productId);
				rs=psmt.executeQuery();
				if(rs.next()) {
					dto.setProductId(rs.getString(1));
					dto.setProductName(rs.getString(2));
					dto.setProductUnitPrice(rs.getInt(3));
					dto.setProductDescription(rs.getString(4));
					dto.setProductBrand(rs.getString(5));
					dto.setProductCategory1(rs.getString(6));
					dto.setProductCategory2(rs.getString(7));
					dto.setProductInStock(rs.getInt(8));
					dto.setProductImage(rs.getString(9));
				}
				System.out.println("상품상세보기 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("상품상세보기 실패");
			}
			
			return dto;
		}
		
		// 상품 목록 가져오기[카테고리별로 가져오기]
				public ArrayList<productDTO> getcategoryProduct(String productCategory1, String productCategory2 ) {
					ArrayList<productDTO> productlist = new ArrayList<productDTO>();
					String query = "select * from product where productCategory1=? or productCategory2=?";
					try {
						psmt = con.prepareStatement(query);
						psmt.setString(1, productCategory1);
						psmt.setString(2, productCategory2);
						rs = psmt.executeQuery();
						
						while(rs.next()) {
							productDTO dto = new productDTO();
							dto.setProductId(rs.getString(1));
							dto.setProductName(rs.getString(2));
							dto.setProductUnitPrice(rs.getInt(3));
							dto.setProductDescription(rs.getString(4));
							dto.setProductBrand(rs.getString(5));
							dto.setProductCategory1(rs.getString(6));
							dto.setProductCategory2(rs.getString(7));
							dto.setProductInStock(rs.getInt(8));
							dto.setProductImage(rs.getString(9));
							productlist.add(dto);
						}
						System.out.println("상품 목록 가져오기 성공");
					}catch(Exception e) {
						e.printStackTrace();
						System.out.println("상품 목록 가져오기 오류");
					}
					return productlist;
				}
			
			
				// 상품 재고 차감(구입시)
				public int minusInventory(String productId, int productNumber) {
					String sql = "UPDATE product SET productInStock = CASE WHEN productInStock > 0 THEN productInStock - ?  "
							+ "ELSE productInStock END WHERE productId =?";
					int result=0;
					try {
						psmt = con.prepareStatement(sql);
						psmt.setInt(1, productNumber);
						psmt.setString(2, productId);
						result=psmt.executeUpdate();
						System.out.println("상품 재고 차감 성공");
						
					} catch(Exception e) {
						System.out.println("상품 재고 차감 오류");
						e.printStackTrace();
					}
					return result;
				 }
				
				// 상품 재고 증가(주문취소, 결제취소시)
				public int plusInventory(int productNumber, String productId) {
					String sql = "UPDATE product SET productInStock =  productInStock + ? WHERE productId = ?";
					int result=0;
					try {
						psmt = con.prepareStatement(sql);
						psmt.setInt(1, productNumber);
						psmt.setString(2, productId);
						result=psmt.executeUpdate();
						System.out.println("상품 재고 증감 성공");
						
					} catch(Exception e) {
						System.out.println("상품 재고 증감 오류");
						e.printStackTrace();
					}
					return result;
				}
				
				// 장바구니 담긴 상품 재고 감소 
				public void decreaseInventoryForCart(List<productbuyDTO> cartlist) {
				    for (productbuyDTO cartItem : cartlist) {
				        String productId = cartItem.getProductId();
				        int productNumber=cartItem.getProductNumber();
				        int result = minusInventory(productId, productNumber);

				        if (result > 0) {
				            System.out.println("상품(" + productId + ") 재고 차감 성공");
				        } else {
				            System.out.println("상품(" + productId + ") 재고 차감 실패");
				            // 실패 시 예외 처리 또는 로깅을 수행할 수 있습니다.
				        }
				    }
				}
				
				// 상품목록 열거 
				public ArrayList<productDTO> getProductBoardList(String items, String text){ // board 테이블에 데이터 가져오기
					String sql;
					
					if(items == null && text ==null) {
						sql="select * from product";
					} else {
						sql ="select * from product where "+items+" like '%"+text+"%' ";
					}
					ArrayList<productDTO> list = new ArrayList<productDTO>();
					
					try {
						psmt= con.prepareStatement(sql);
						rs=psmt.executeQuery();
						
						while(rs.next()) { // 반복문을 이용하여 해당 상품목록을 게시판에 가져옴
							productDTO board=new productDTO();
							board.setProductId(rs.getString("productId"));
							board.setProductName(rs.getString("productName"));
							board.setProductUnitPrice(rs.getInt("productUnitPrice"));
							board.setProductDescription(rs.getString("productDescription"));
							board.setProductBrand(rs.getString("productBrand"));
							board.setProductCategory1(rs.getString("productCategory1"));
							board.setProductCategory2(rs.getString("productCategory2"));
							board.setProductInStock(rs.getInt("productInStock"));
							board.setProductImage(rs.getString("productImage"));
							list.add(board);
							
							
							System.out.println("상품목록 가져오기 성공");
						}
					} catch (Exception e) {
						System.out.println("상품목록 가져오기 성공");
						e.printStackTrace();
					} 
					
					return list;
				}
				
				//상품 정보 수정하는 메소드
				public void EditProduct(String productName, int productUnitPrice, String productDescription, String productBrand, int productInStock,
						String productId) {
					String query = "update product set productName=?, productUnitPrice=?, productDescription=?, productBrand=?, productInStock=?"
							+ " where productId=?";
					try {
						psmt = con.prepareStatement(query);
						psmt.setString(1, productName);
						psmt.setInt(2, productUnitPrice);
						psmt.setString(3, productDescription);
						psmt.setString(4, productBrand);
						psmt.setInt(5, productInStock);
						psmt.setString(6, productId);
						psmt.executeUpdate();
						System.out.println("상품정보 수정성공");
						
					} catch(Exception e) {
						e.printStackTrace();
						System.out.println("상품정보 수정실패");
					}
				}
				
				// 장바구니 수량 변경 
				public int cartProductNumberEdit(String id, String productId, int productNumber) {
					String sql = "UPDATE cart SET productNumber =?   WHERE id=? and productId = ?";
					int result=0;
					try {
						psmt = con.prepareStatement(sql);
						psmt.setInt(1, productNumber);
						psmt.setString(2, id);
						psmt.setString(3, productId);
						result=psmt.executeUpdate();
						System.out.println("장바구니 수량 변경 성공");
						
					} catch(Exception e) {
						System.out.println("장바구니 수량 변경 실패");
						e.printStackTrace();
					}
					return result;
				}
}
