package productbuyDAO;



import java.util.ArrayList;
import java.util.List;

import DBconnect.DBconnect;
import productDTO.productDTO;
import productbuyDTO.productbuyDTO;

public class productbuyDAO extends DBconnect {

	public productbuyDAO() {
		super();
	}
	
	// 장바구니 목록 가져오기
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
		

		
		//장바구니 상품 삭제
		public void deleteProduct(String id, String productId) {
			String sql = "delete from cart where id=? and productId=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1,id);
				psmt.setString(2,productId);
				psmt.executeUpdate();
				
				System.out.println("장바구니 상품 삭제하기 성공");
			} catch(Exception e) {
				System.out.println("장바구니 상품 삭제하기 오류");
				e.printStackTrace();
			}
			
		}

				
			// 장바구니 등록
			public String addCart(String id, String productId, String productName, int productUnitPrice, int productNumber, int productInStock, String productImage ) {
			    String query = "select * from cart where id=?";
			    String result = "이미 장바구니에 등록된 상품입니다.";

			    try {
			        psmt = con.prepareStatement(query);
			        psmt.setString(1, id);
			        rs = psmt.executeQuery();

			        // 장바구니에 등록된 상품이 없는 경우
			        if (!rs.next()) {
			            String query2 = "insert into cart values(?,?,?,?,?,?,?)";
			            psmt = con.prepareStatement(query2);
			            psmt.setString(1, id);
			            psmt.setString(2, productId);
			            psmt.setString(3, productName);
			            psmt.setInt(4, productUnitPrice);
			            psmt.setInt(5, productNumber);
			            psmt.setInt(6, productInStock);
			            psmt.setString(7, productImage);
			            psmt.executeUpdate();
			            result = "장바구니 등록";
			        } else {
			            boolean isAlreadyInCart = false;

			            do {
			                String productIdInCart = rs.getString(2);
			                // 기존에 등록된 상품과 현재 추가하려는 상품이 중복되는 경우
			                if (productIdInCart.equals(productId)) {
			                    isAlreadyInCart = true;
			                    break;
			                }
			            } while (rs.next());

			            // 중복된 상품이 없는 경우에만 추가
			            if (!isAlreadyInCart) {
			            	 String query2 = "insert into cart values(?,?,?,?,?,?,?)";
					            psmt = con.prepareStatement(query2);
					            psmt.setString(1, id);
					            psmt.setString(2, productId);
					            psmt.setString(3, productName);
					            psmt.setInt(4, productUnitPrice);
					            psmt.setInt(5, productNumber);
					            psmt.setInt(6, productInStock);
					            psmt.setString(7, productImage);
					            psmt.executeUpdate();
			                result = "장바구니 등록";
			            }
			        }

			        System.out.println("장바구니 dao 성공");
			    } catch (Exception e) {
			        e.printStackTrace();
			        System.out.println("장바구니 dao 실패");
			    }
			    return result;
			}
			
			
		// 장바구니에서 해당 id에 해당하는 장바구니상품db 가져오기 
		public List<productbuyDTO> searchCartId(String id) {
			String query = "select * from cart where id=?";
			  List<productbuyDTO> products = new ArrayList<>();

			    try {
			        psmt = con.prepareStatement(query);
			        psmt.setString(1, id);
			        rs = psmt.executeQuery();

			        while (rs.next()) {
			        	productbuyDTO dto = new productbuyDTO();
			            // 여러 개의 값을 받아올 때는 ArrayList에 추가
			            dto.setId(rs.getString(1));
			            dto.setProductId(rs.getString(2));
			            dto.setProductName(rs.getString(3));
			            dto.setProductUnitPrice(rs.getInt(4));
			            dto.setProductNumber(rs.getInt(5));
			            dto.setProductInStock(rs.getInt(6));
			            dto.setProductImage(rs.getString(7));
			            products.add(dto);
			        }
			        System.out.println("장바구니 상품db 가져오기 성공");
			    } catch (Exception e) {
			        e.printStackTrace();
			        System.out.println("장바구니 상품db 가져오기 실패");
			    } 

			    return products;
		}
		
		// 장바구니에서 해당 id에 해당하는 장바구니상품db의 총액합을 구하기
		public int SumCartAll(String id) {
			String query = "select * from cart where id=?";
			int sum=0;
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				
				while (rs.next()) {
					int productUnitPrice= rs.getInt("productUnitPrice");
					int productNumber= rs.getInt("productNumber");
					sum+=productUnitPrice*productNumber;
				}
				System.out.println("장바구니 상품db 총액합 가져오기 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("장바구니 상품db 총액합 가져오기 실패");
			} 
			
			return sum;
		}
		

		// 장바구니에서 해당 id에 해당하는 장바구니상품db를 주문table에 추가하기 
				public void addOrdersfromCart(String id, String name, String address, String phone, String postmessage, List<productbuyDTO> products) {
					String query ="insert into productorder(id, name, address, phone, postmessage, productId, productName, productUnitPrice, productNumber, productImage)"
							+ "  values(?,?,?,?,?,?,?,?,?,?)";
					for(productbuyDTO product: products)
					    try {
					        psmt = con.prepareStatement(query);
					        psmt.setString(1, id);
					        psmt.setString(2, name);
					        psmt.setString(3, address);
					        psmt.setString(4, phone);
					        psmt.setString(5, postmessage);
					        psmt.setString(6, product.getProductId());
					        psmt.setString(7, product.getProductName());
					        psmt.setInt(8, product.getProductUnitPrice());
					        psmt.setInt(9, product.getProductNumber());
					        psmt.setString(10, product.getProductImage());
					        psmt.executeUpdate();

					        System.out.println("장바구니 상품db 주문table 입력 성공");
					    } catch (Exception e) {
					        e.printStackTrace();
					        System.out.println("장바구니 상품db 주문table 입력 실패");
					    } 

				}
					
			
			// 상세페이지에서 해당 id에 해당하는 상품db를 주문table에 추가하기 
			public void addOrdersfromItems(String id, String name, String address, String phone, String postmessage, String productId, String productName, int productUnitPrice, int productNumber, String productImage ) {
				String query = "insert into productorder(id, name, address, phone, postmessage, productId, productName, productUnitPrice, productNumber, productImage)"
						+ "  values(?,?,?,?,?,?,?,?,?,?)";
					try {
						psmt = con.prepareStatement(query);
						psmt.setString(1, id);
						psmt.setString(2, name);
						psmt.setString(3, address);
						psmt.setString(4, phone);
						psmt.setString(5, postmessage);
						psmt.setString(6, productId);
						psmt.setString(7, productName);
						psmt.setInt(8, productUnitPrice);
						psmt.setInt(9, productNumber);
						psmt.setString(10, productImage);
						psmt.executeUpdate();
						
						System.out.println("상세페이지 상품db 주문table 입력 성공");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("상세페이지 상품db 주문table 입력 실패");
					} 
				
			}
			
			//주문할경우 장바구니 비우기(전체삭제)
			public void clearCart(String id) {
				String sql = "delete from cart where id=?";
				
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1,id);
					psmt.executeUpdate();
					
					System.out.println("장바구니 비우기 성공");
				} catch(Exception e) {
					System.out.println("장바구니 비우기 오류");
					e.printStackTrace();
				}
				
			}
			
			// 주문테이블에서 해당 id에 해당하는 주문db 가져오기 
			public List<productbuyDTO> searchOrderId(String id) {
				String query = "select * from productorder where id=?";
				  List<productbuyDTO> products = new ArrayList<>();

				    try {
				        psmt = con.prepareStatement(query);
				        psmt.setString(1, id);
				        rs = psmt.executeQuery();

				        while (rs.next()) {
				        	productbuyDTO dto = new productbuyDTO();
				            // 여러 개의 값을 받아올 때는 ArrayList에 추가
				        	
				        	
				        	dto.setOrderNumber(rs.getInt(1));
				            dto.setId(rs.getString(2));
				            dto.setName(rs.getString(3));
				            dto.setAddress(rs.getString(4));
				            dto.setPhone(rs.getString(5));
				            dto.setPostmessage(rs.getString(6));
				            dto.setProductId(rs.getString(7));
				            dto.setProductName(rs.getString(8));
				            dto.setProductUnitPrice(rs.getInt(9));
				            dto.setProductNumber(rs.getInt(10));
				            dto.setProductImage(rs.getString(11));
				           
				            products.add(dto);
				        }
				        System.out.println("주문목록 상품db 가져오기 성공");
				    } catch (Exception e) {
				        e.printStackTrace();
				        System.out.println("주문목록 상품db 가져오기 실패");
				    } 

				    return products;
			}
			
			// 주문목록에서 해당 id에 해당하는 주문db의 총액합을 구하기
			public int SumOrderAll(String id) {
				String query = "select * from productorder where id=?";
				int sum=0;
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					
					while (rs.next()) {
						int productUnitPrice= rs.getInt("productUnitPrice");
						int productNumber= rs.getInt("productNumber");
						sum+=productUnitPrice*productNumber;
					}
					System.out.println("주문목록 상품db 총액합 가져오기 성공");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("주문목록 상품db 총액합 가져오기 실패");
				} 
				
				return sum;
			}
			
			//주문목록 상품 삭제
			public void deleteOrderProduct(int productOrderNumber) {
				String sql = "delete from productorder where ordernumber=?";
				
				try {
					psmt = con.prepareStatement(sql);
					psmt.setInt(1,productOrderNumber);
					psmt.executeUpdate();
					
					System.out.println("주문목록 상품 삭제하기 성공");
				} catch(Exception e) {
					System.out.println("주문목록 상품 삭제하기 오류");
					e.printStackTrace();
				}
				
			}	
			
		
			
			// 주문목록 리스트에서 결제테이블 추가
			public void addPaymentfromOrderlist(List<productbuyDTO> orderlist) {
				
				
				String query = "insert into payment(id, name, address, phone, postmessage, productId, productName, productUnitPrice, productNumber, orderSetNumber, productImage, status)"
						+ "  values(?,?,?,?,?,?,?,?,?,?,?,?)";
				
				int orderSetNumber = generateOrderSetNumber();
				
				for(productbuyDTO product: orderlist) {
					
					try {
						psmt = con.prepareStatement(query);
						psmt.setString(1, product.getId());
						psmt.setString(2, product.getName());
						psmt.setString(3, product.getAddress());
						psmt.setString(4, product.getPhone());
						psmt.setString(5, product.getPostmessage());
						psmt.setString(6, product.getProductId());
						psmt.setString(7, product.getProductName());
						psmt.setInt(8, product.getProductUnitPrice());
						psmt.setInt(9, product.getProductNumber());
						psmt.setInt(10, orderSetNumber);
						psmt.setString(11, product.getProductImage());
						psmt.setString(12, "배송준비중");
						psmt.executeUpdate();
						
						System.out.println("주문목록 상품db 결제table 입력 성공");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("주문목록 상품db 결제table 입력 실패");
					} 
				}
				
			}
			
			
			
			
			
			//주문할경우 주문목록 비우기(전체삭제)
			public void clearOrderlist(String id) {
				String sql = "delete from productorder where id=?";
				
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1,id);
					psmt.executeUpdate();
					
					System.out.println("주문목록 비우기 성공");
				} catch(Exception e) {
					System.out.println("주문목록 비우기 오류");
					e.printStackTrace();
				}
				
			}
			

			// 주문테이블에서 상세페이지에서 직접 주문한것 가져오기
			public ArrayList<productbuyDTO> getProductOrderlist(String id, int orderNumber) {
				ArrayList<productbuyDTO> orderlist = new ArrayList<productbuyDTO>();
				String query = "select * from productorder where id=? and ordernumber=?";
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, id);
					psmt.setInt(2, orderNumber);
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						productbuyDTO dto = new productbuyDTO();
						dto.setOrderNumber(rs.getInt(1));
						dto.setId(rs.getString(2));
						dto.setName(rs.getString(3));
						dto.setAddress(rs.getString(4));
						dto.setPhone(rs.getString(5));
						dto.setPostmessage(rs.getString(6));
						dto.setProductId(rs.getString(7));
						dto.setProductName(rs.getString(8));
						dto.setProductUnitPrice(rs.getInt(9));
						dto.setProductNumber(rs.getInt(10));
						dto.setProductImage(rs.getString(11));
						orderlist.add(dto);
					}
					System.out.println("상세페이지 주문 목록 가져오기 성공");
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("상세페이지 주문 목록 가져오기 오류");
				}
				return orderlist;
			}
			

			//주문할경우 주문목록 비우기(상세페이지에서 추가한것 삭제)
			public void clearOrderlist(String id, int orderNumber) {
				String sql = "delete from productorder where id=? and ordernumber=?";
				
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1,id);
					psmt.setInt(2, orderNumber);
					psmt.executeUpdate();
					
					System.out.println("상세페이지 아이템 주문목록 비우기 성공");
				} catch(Exception e) {
					System.out.println("상세페이지 아이템 주문목록 비우기 오류");
					e.printStackTrace();
				}
				
			}
			
			// 주문테이블에서 해당 id에 해당하는 주문db 가장 최신의 주문db 가져오기
						public productbuyDTO searchOrderIdDesc(String id) {
							String query = "select * from productorder where id=? order by ordernumber desc";
								productbuyDTO dto = new productbuyDTO();
							    try {
							        psmt = con.prepareStatement(query);
							        psmt.setString(1, id);
							        rs = psmt.executeQuery();

							        if (rs.next()) {
							        	
							        	
							        	
							        	dto.setOrderNumber(rs.getInt(1));
							            dto.setId(rs.getString(2));
							            dto.setName(rs.getString(3));
							            dto.setAddress(rs.getString(4));
							            dto.setPhone(rs.getString(5));
							            dto.setPostmessage(rs.getString(6));
							            dto.setProductId(rs.getString(7));
							            dto.setProductName(rs.getString(8));
							            dto.setProductUnitPrice(rs.getInt(9));
							            dto.setProductNumber(rs.getInt(10));
							            dto.setProductImage(rs.getString(11));
							           
							        }
							        System.out.println("주문목록 상품db 가장최신의것 가져오기 성공");
							    } catch (Exception e) {
							        e.printStackTrace();
							        System.out.println("주문목록 상품db 가장최신의것 가져오기 실패");
							    } 

							    return dto;
						}
						
			
				//주문번호 단체주문할경우 해당 결제번호 그룹 번호 가져오기 	
				private int generateOrderSetNumber() {
				    int orderSetNumber = 0; // 초기값을 1로 설정
				    // 최대 주문 번호를 얻기 위한 쿼리
			        String query = "SELECT MAX(orderSetNumber) FROM payment";
				    try {
				    		psmt = con.prepareStatement(query);
					        rs = psmt.executeQuery();

				        if (rs.next()) {
				            // 최대 주문 번호를 얻어와서 1을 더하여 새로운 주문 집합 번호를 생성
				            orderSetNumber = rs.getInt(1) + 1;
				        }

				        System.out.println("번호가져오기 성공");
				    } catch (Exception e) {
				        e.printStackTrace();
				        System.out.println("번호가져오기 실패");
				    }

				    return orderSetNumber;
				}		
			
				//결제 테이블에서 가장 큰 ordersetnumber 가져오기
				public int getordersetnumber(String id) {
					int orderSetNumber = 0; // 초기값을 0로 설정
					// 최대 주문 번호를 얻기 위한 쿼리
					String query = "select MAX(orderSetNumber) from payment where id=?";
					try {
						psmt = con.prepareStatement(query);
						psmt.setString(1, id);
						rs = psmt.executeQuery();
						
						if (rs.next()) {
							// 최대 주문 번호를 얻어와서 1을 더하여 새로운 주문 집합 번호를 생성
							orderSetNumber = rs.getInt(1);
						}
						
						System.out.println("결제오더번호가져오기 성공");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("결제오더번호가져오기 실패");
					}
					
					return orderSetNumber;
				}		
				
				
				// 결제테이블에서 해당 id에 해당하는 결제db 가져오기 
				public List<productbuyDTO> searchPaymentId(String id) {
					String query = "select * from payment where id=?";
					  List<productbuyDTO> products = new ArrayList<>();

					    try {
					        psmt = con.prepareStatement(query);
					        psmt.setString(1, id);
					        rs = psmt.executeQuery();

					        while (rs.next()) {
					        	productbuyDTO dto = new productbuyDTO();
					            // 여러 개의 값을 받아올 때는 ArrayList에 추가
					        	
					        	
					        	dto.setPaymentNumber(rs.getInt(1));
					            dto.setId(rs.getString(2));
					            dto.setName(rs.getString(3));
					            dto.setAddress(rs.getString(4));
					            dto.setPhone(rs.getString(5));
					            dto.setPostmessage(rs.getString(6));
					            dto.setProductId(rs.getString(7));
					            dto.setProductName(rs.getString(8));
					            dto.setProductUnitPrice(rs.getInt(9));
					            dto.setProductNumber(rs.getInt(10));
					            dto.setOrderSetNumber(rs.getInt(12));
					            dto.setProductImage(rs.getString(13));
					            dto.setStatus(rs.getString(14));
					            
					            products.add(dto);
					        }
					        System.out.println("결제목록 상품db 가져오기 성공");
					    } catch (Exception e) {
					        e.printStackTrace();
					        System.out.println("결제목록 상품db 가져오기 실패");
					    } 

					    return products;
				}
				
				// 결제테이블에서 전체 결제 db 가져오기
				public List<productbuyDTO> searchPaymentAll() {
					String query = "select * from payment";
					List<productbuyDTO> products = new ArrayList<>();
					
					try {
						psmt = con.prepareStatement(query);
						rs = psmt.executeQuery();
						
						while (rs.next()) {
							productbuyDTO dto = new productbuyDTO();
							// 여러 개의 값을 받아올 때는 ArrayList에 추가
							
							
							dto.setPaymentNumber(rs.getInt(1));
							dto.setId(rs.getString(2));
							dto.setName(rs.getString(3));
							dto.setAddress(rs.getString(4));
							dto.setPhone(rs.getString(5));
							dto.setPostmessage(rs.getString(6));
							dto.setProductId(rs.getString(7));
							dto.setProductName(rs.getString(8));
							dto.setProductUnitPrice(rs.getInt(9));
							dto.setProductNumber(rs.getInt(10));
							dto.setOrderSetNumber(rs.getInt(12));
							dto.setProductImage(rs.getString(13));
							dto.setStatus(rs.getString(14));
							products.add(dto);
						}
						System.out.println("결제목록 전체 상품db 가져오기 성공");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("결제목록 전체 상품db 가져오기 실패");
					} 
					
					return products;
				}
				
				
				// 결제목록 해당 id에 해당하는 결제db의 총액합을 구하기
				public int SumPaymentAllfromId(String id) {
					String query = "select * from payment where id=?";
					int sum=0;
					try {
						psmt = con.prepareStatement(query);
						psmt.setString(1, id);
						rs = psmt.executeQuery();
						
						while (rs.next()) {
							int productUnitPrice= rs.getInt("productUnitPrice");
							int productNumber= rs.getInt("productNumber");
							sum+=productUnitPrice*productNumber;
						}
						System.out.println("결제목록 상품db 총액합 가져오기 성공");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("결제목록 상품db 총액합 가져오기 실패");
					} 
					
					return sum;
				
				}	
				
				// 결제목록 해당 id에 해당하는 결제db의 총액합을 구하기
				public int SumPaymentAll() {
					String query = "select * from payment";
					int sum=0;
					try {
						psmt = con.prepareStatement(query);
						rs = psmt.executeQuery();
						
						while (rs.next()) {
							int productUnitPrice= rs.getInt("productUnitPrice");
							int productNumber= rs.getInt("productNumber");
							sum+=productUnitPrice*productNumber;
						}
						System.out.println("결제목록 상품db 총액합 가져오기 성공");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("결제목록 상품db 총액합 가져오기 실패");
					} 
					
					return sum;
				
				}	
				
				
				//결제목록 상품 삭제
				public void deletePaymentProduct(int paymentnumber) {
					String sql = "delete from payment where paymentnumber=?";
					
					try {
						psmt = con.prepareStatement(sql);
						psmt.setInt(1,paymentnumber);
						psmt.executeUpdate();
						
						System.out.println("결제목록 상품 삭제하기 성공");
					} catch(Exception e) {
						System.out.println("결제목록 상품 삭제하기 오류");
						e.printStackTrace();
					}
					
				}
				
				//결제목록 상품 삭제
				public void editShippment(String status, int paymentnumber) {
					String sql = "update payment set status=? where paymentnumber=?;";
					
					try {
						psmt = con.prepareStatement(sql);
						psmt.setString(1, status);
						psmt.setInt(2, paymentnumber);
						psmt.executeUpdate();
						
						System.out.println("배송상태변경 성공");
					} catch(Exception e) {
						System.out.println("배송상태변경 실패");
						e.printStackTrace();
					}
					
				}
				
				
}
