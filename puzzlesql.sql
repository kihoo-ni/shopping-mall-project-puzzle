create database puzzle;
use puzzle;


create table member( -- 멤버테이블(유저정보)
    id varchar(20) primary key, -- 아이디
    pw varchar(500), -- 비번
	name varchar(50), -- 이름
    nickname varchar(50), -- 닉네임
	birthday varchar(50), -- 생년월일 19950502 << 이런식으로 작성
	address varchar(50), -- 주소 도로명주소  대충
	email varchar(50), -- 이메일 아무거나 쓰셈
	phone varchar(50) -- 0100000000 '-'표시 무조건 제거 공백없이
);

select * from member;
delete from member where id="seller";
drop table member;


-- 회원가입 더미데이터
insert into member values('user001','user001','진서원','서one','19970409','서울 성북구 정릉로26길 8','user001@gmail.com','01011111111');
insert into member values('user002','user002','한해나','갱얼쥐','19871218','서울 강남구 언주로 123','user002@gmail.com','01022222222');
insert into member values('user003','user003','이보겸','밥버거','20001120','서울 강남구 개포로30길 18','user003@gmail.com','01033333333');
insert into member values('user004','user004','최율','율곡이이','19970624','서울 은평구 연서로 216','user004@gmail.com','01044444444');
insert into member values('user005','user005','한유나','유나겅듀','19931025','충북 청주시 청원구 1순환로 123','user005@gmail.com','01055555555');
insert into member values('user006','user006','송우택','송아지','19880417','충북 청주시 청원구 상당로244번길 6','user006@gmail.com','01066666666');
insert into member values('user007','user007','민지아','짱구s2철수','19760102','대전 중구 선화로22번길 25','user007@gmail.com','01077777777');
insert into member values('user008','user008','신미선','봉미선씨','19991016','대전 중구 서문로 96','user008@gmail.com','01088888888');
insert into member values('user009','user009','한판동','한판 더 주세요','20030927','전북 전주시 완산구 세내로 239','user009@gmail.com','01099999999');
insert into member values('user010','user010','김해준','찡긋','20010826','전북 전주시 완산구 거마평로 125','user010@gmail.com','01010101010');
insert into member values('user011','user011','유승목','퇴근하고싶다','19890907','대구 서구 국채보상로34길 12','user011@gmail.com','01012341234');
insert into member values('user012','user012','윤채아','모먹징','19771121','대구 달서구 용산로 259','user012@gmail.com','01023452345');
insert into member values('user013','user013','천송이','오오티디','19900302','대구 달서구 성지로 35','user013@gmail.com','01034563456');
insert into member values('user014','user014','오상수','간생간살','19860523','울산 중구 종가로 245','user014@gmail.com','01045674567');
insert into member values('user015','user015','송다원','나생강','19920914','울산 남구 굴화4길 20','user015@gmail.com','01056785678');
insert into member values('user016','user016','박규영','뀨엉','19981125','부산 서구 고운들로 181','user016@gmail.com','01067896789');
insert into member values('user017','user017','우강철','큐티강철샘','19750312','부산 서구 대티로 159','user017@gmail.com','01078907890');
insert into member values('user018','user018','신명수','신맹수','19930706','제주 제주시 과원북2길 12','user018@gmail.com','01089018901');
insert into member values('user019','user019','김여은','김실버','19970409','광주 광산구 우산동 우산테마빌 103동','user019@gmail.com','01090129012');
insert into member values('user020','user020','이기훈','캔달제너','19950917','광주광역시 북구 자미로 23번길','user020@gmail.com','01043214321');
-- 회원가입 더미데이터 끝

-- 양식
 insert into member values('seller','1234','판매자','판매자','99999999','광주광역시 북구 자미로 23번길','seller@gmail.com','01000000000');
 insert into member values('1234','1234','이기훈','구매자','99999999','광주광역시 북구 자미로 23번길','abc@gmail.com','01000000000');





create table product( -- 상품테이블 
    productId varchar(100) not null primary key, -- 상품코드
    productName varchar(100) not null, -- 상품명
	productUnitPrice int not null, -- 상품가격
    productDescription varchar(500) not null, -- 상품설명(그냥 아무 단어나 작성)
	productBrand varchar(100) not null, -- 상품브랜드
	productCategory1 varchar(100) not null,   -- 상의
    productCategory2 varchar(100) not null,  -- 니트
	productInStock int not null,			-- 재고
	productImage varchar(1000) not null			-- 상품사진 이름
);
select * from product;
drop table product;


-- 양식은 다음과 같은데 본인이 가져온 데이터로 넣으면됨 이미지파일 이름 정확히 기재하는것 매우 중요
-- productId도 본인이 가져온거로 디테일 넣어서 해주길 
-- productDescription의 경우 사진으로 대체하기때문에 글자아무거나 넣으셈 items_info.jsp에 사진으로 상세설명 대체함
-- 따라서 상세설명 사진도 같이 가져오길바람. 장바구니에 넣어서 구매해야하기때문에 3개항목의 상세사진이 필요함.
-- 카테고리의경우 '상의'관련된 니트 맨투맨 셔츠 후드티셔츠  요렇게 각각 화면상 한줄씩 들어가게끔 해주면됨.

-- 상품등록 더미데이터
insert into product values("CLO123","레이어드 크루 넥 반팔 티셔츠",16900,"레이어드_크루_넥_반팔_티셔츠","무신사 스탠다드","상의","니트",13,"레이어드_크루_넥_반팔_티셔츠.jpg");
insert into product values("CLO496","워셔블 하찌 니트",39900,"워셔블_하찌_니트","수아레","상의","니트",7,"워셔블_하찌_니트.jpg");
insert into product values("CLO789","헤비웨이트 키홀 케이블 니트집업",85800,"헤비웨이트_키홀_케이블_니트집업","세컨모놀로그","상의","니트",5,"헤비웨이트_키홀_케이블_니트집업.jpg");
insert into product values("CLO301","브러쉬드 니트",58900,"브러쉬드_니트","엘엠알","상의","니트",62,"브러쉬드_니트.jpg");
insert into product values("CLO125","컬러 배색 1992 크래픽후드",39800,"컬러_배색_1992_그래픽후드","트릴리온","상의","후드 티셔츠",3,"컬러_배색_1992_그래픽후드.jpg");
insert into product values("CLO987","100 Velour Soccer Jersey Black",79800,"100_Velour_Soccer_Jersey_Black","스컬프터","상의","맨투맨",15,"100_Velour_Soccer_Jersey_Black.jpg");
insert into product values("CLO234","오버핏 옥스퍼트 셔츠",39000,"오버핏_옥스퍼트_셔츠","토피","상의","셔츠",70,"오버핏_옥스퍼트_셔츠.jpg");
insert into product values("CLO911","소프트 필링 세미오버 라운드니트",33000,"소프트_필링_세미오버_라운드니트","미니멀코드","상의","니트",8,"소프트_필링_세미오버_라운드니트.jpg");
insert into product values("CLO890","Traveler Oversized Sweater",62300,"Traveler_Oversized_Sweater","메인부스","상의","니트",12,"Traveler_Oversized_Sweater.jpg");
insert into product values("CLO432","소프트 울 오버핏 풀오버 라운드니트",39000,"소프트_울_오버핏_풀오버_라운드니트","플레이스 스튜디오","상의","니트",32,"소프트_울_오버핏_풀오버_라운드니트.jpg");
insert into product values("CLO745","Boucle half zip-up sweater Blue",269000,"Boucle_half_zip-up_sweater_Blue","런던 언더그라운드","상의","니트",5,"Boucle_half_zip-up_sweater_Blue.png");
insert into product values("CLO098","Knit Hoodie Jacket",127200,"Knit_Hoodie_Jacket","예예","상의","니트",17,"Knit_Hoodie_Jacket.jpg");
insert into product values("CLO369","RAGLAN HALF ZIP-UP KNIT",49800,"RAGLAN_HALF_ZIP-UP_KNIT","폴루션","상의","니트",17,"RAGLAN_HALF_ZIP-UP_KNIT.jpg");
insert into product values("CLO529","RUGBY SWEATER GREY",159000,"RUGBY_SWEATER_GREY","포커페이스","상의","니트",7,"RUGBY_SWEATER_GREY.jpg"),
	("CLO248","썸머 플리츠 오버 셔츠",48600,"썸머_플리츠_오버_셔츠","트립스센스","상의","셔츠",10,"썸머_플리츠_오버_셔츠.jpg"),
	("CLO122","OMBRE CHECK SHIRTS BLACK",108000,"RUGBY_SWEATER_GREY","포커페이스","상의","셔츠",10,"OMBRE_CHECK_SHIRTS_BLACK.jpg"),
	("CLO682","23AW Bold Garment Shirt",118000,"23AW_Bold_Garment_Shirt","어나더 오피스","상의","셔츠",10,"23AW_Bold_Garment_Shirt.jpg"),
	("CLO778","포시즌 옴브레 체크 셔츠 블루",39900,"포시즌_옴브레_체크_셔츠_블루","디미트리 블랙","상의","셔츠",10,"포시즌_옴브레_체크_셔츠_블루.png"),
	("CLO514","플란넬 플레이드 체크 셔츠 핑크",55200,"플란넬_플레이드_체크_셔츠_핑크","베이스모먼트","상의","셔츠",10,"플란넬_플레이드_체크_셔츠_핑크.jpg"),
	("CLO145","오버핏 체크 패턴 셔츠 그레이",49000,"오버핏_체크_패턴_셔츠_그레이","보늬","상의","셔츠",10,"오버핏_체크_패턴_셔츠_그레이.jpg"),
	("CLO553","[NF]웨스턴_아일렛_셔츠_F23ZB258",48300,"[NF]웨스턴_아일렛_셔츠_F23ZB258","네스티팬시클럽","상의","셔츠",19,"웨스턴_아일렛_셔츠_F23ZB258.jpg"),
	("CLO593","클럽 레플리카 스웻셔츠 [오프 화이트]",36900,"클럽_레플리카_스웻셔츠 ","SUPERSUB","상의","맨투맨",10,"클럽_레플리카_스웻셔츠.jpg"),
	("CLO218","스탠다드 스웨츠 셔츠",17900,"스탠다드_스웨츠_셔츠","REBRENNER","상의","맨투맨",7,"스탠다드_스웨츠_셔츠.jpg"),
	("CLO876","챌린지 특양면 맨투맨_B1",25600,"챌린지_특양면_맨투맨_B1","VENHIT","상의","맨투맨",9,"챌린지_특양면_맨투맨_B1.jpg"),
	("CLO418","부클 플라워 맨투맨 네이비",55200,"부클_플라워_맨투맨_네이비","팔렛","상의","맨투맨",10,"부클_플라워_맨투맨_네이비.jpg"),
	("CLO371","L’AMOUR Boucle Sweatshirt T82",68000,"L’AMOUR_Boucle_Sweatshirt_T82","다이아몬드 레이라","상의","맨투맨",10,"L’AMOUR_Boucle_Sweatshirt_T82.jpg"),
	("CLO725","버니 베어 하프 집업",63200,"버니_베어_하프_집업","아코스튜디오스페이스","상의","맨투맨",10,"버니_베어_하프_집업.jpg"),
	("CLO632","슈가맨투맨티셔츠 그린",17800,"슈가맨투맨티셔츠_그린","로토토베베","상의","맨투맨",10,"슈가맨투맨티셔츠_그린.jpg"),
	("CLO625","센서티브 오버 기모 맨투맨",27500,"센서티브_오버_기모_맨투맨","어반에이지","상의","맨투맨",10,"센서티브_오버_기모_맨투맨.jpg"),
	("CLO415","짱구 오또카지 후드티셔츠",59900,"짱구_오또카지_후드티셔츠","댄꼼마","상의","후드티셔츠",10,"짱구_오또카지_후드티셔츠.jpg"),
	("CLO113","SIGNATURE HOODIE (12colors)",55300,"SIGNATURE_HOODIE","오아이오아이","상의","후드티셔츠",10,"SIGNATURE_HOODIE.jpg"),
	("CLO767","엔젤 그레이 와펜 후드 그레이",48300,"엔젤_그레이_와펜_후드_그레이","와릿이즌","상의","후드티셔츠",10,"엔젤_그레이_와펜_후드_그레이.jpg"),
	("CLO119","매직카펫 후드티",38900,"매직카펫_후드티","벤힛","상의","후드티셔츠",10,"매직카펫_후드티.jpg"),
	("CLO210","스튜디오 아치 로고 후드_라이트그레이",47400,"스튜디오_아치_로고_후드_라이트그레이","1993스튜디오","상의","후드티셔츠",10,"스튜디오_아치_로고_후드_라이트그레이.jpg"),
	("CLO999","컨템포 크롭 후디 – 블랙",99000,"컨템포_크롭_후디","아디다스","상의","후드티셔츠",10,"컨템포_크롭_후디.jpg"),
	("CLO888","체인 트위치 로고 후드 티셔츠 오트밀",80100,"체인_트위치_로고_후드_티셔츠_오트밀","리","상의","후드티셔츠",10,"체인_트위치_로고_후드_티셔츠_오트밀.jpg"),
	("CLO777","냥냥냥 후디[와인]",47400,"냥냥냥_후디","비디오자키","상의","후드티셔츠",10,"냥냥냥_후디.jpg"),
	("CLO666","캣독 기모 후드티",38900,"캣독_기모_후드티","벤힛","상의","후드티셔츠",10,"캣독_기모_후드티.jpg"),
	("CLO555","그라피티 오버핏 와이드 숄더 후디_화이트",69000,"그라피티_오버핏_와이드_숄더_후디","아스트랄","상의","후드티셔츠",10,"그라피티_오버핏_와이드_숄더_후디.jpg");
-- 상품등록 더미데이터 끝
delete from product where productId='CLO371';
insert into product values("CLO371","L’AMOUR Boucle Sweatshirt T82",68000,"L’AMOUR_Boucle_Sweatshirt_T82","다이아몬드 레이라","상의","맨투맨",10,"L’AMOUR_Boucle_Sweatshirt_T82.jpg");
-- insert into product values("1","에르메스니트",100,"1","에르메스","상의","니트",3,"Knit02.jpg");
-- insert into product values("2","샤넬니트",100,"1","샤넬","상의","니트",3,"Knit02.jpg");
-- insert into product values("3","로로피아나니트",100,"1","로로피아나","상의","니트",3,"Knit02.jpg");
-- insert into product values("4","구찌니트",100,"1","구찌","상의","니트",3,"Knit02.jpg");


-- 요건 의미없음 연습할라고 만든거
-- select productInStock from product where productId="1";
-- UPDATE product
-- SET productInStock = CASE
--     WHEN productInStock > 0 THEN productInStock - 2
--     ELSE productInStock
-- END
-- WHERE productId = '1';
-- update product set productInStock = productInStock + 1 where productId='3';
-- select * from product where productCategory1='0' or productCategory2='니트';


create table cart( -- 장바구니 테이블
	id varchar(50) not null,  -- 고객 아이디
    productId varchar(100) not null,  -- 상품코드
    productName varchar(100) not null,  -- 상품명
    productUnitPrice int not null,    -- 상품가격
    productNumber int not null,    -- 구매수량
    productInStock int not null,   -- 재고
    productImage varchar(1000) not null   -- 상품이미지
);
select * from cart;
drop table cart;






create table productorder( -- 상품 주문 테이블
	ordernumber INT PRIMARY KEY AUTO_INCREMENT,
	id varchar(50) not null,
    name varchar(50) not null,
    address varchar(50) not null,
    phone varchar(50) not null,
    postmessage varchar(50) not null,
    productId varchar(100) not null,
    productName varchar(100) not null,
    productUnitPrice int not null,
    productNumber int not null,
    productImage varchar(1000) not null
);
drop table productorder;
select * from productorder;


create table productreview( -- 상품 후기 테이블
	reviewnumber INT PRIMARY KEY AUTO_INCREMENT,
	id varchar(50) not null,
    nickname varchar(50) not null,
    productid varchar(100) not null,
    reviewcontent varchar(500) not null,
    reviewimage varchar(500),
    reviewcreated DATETIME DEFAULT CURRENT_TIMESTAMP
);
drop table productreview;
select * from productreview;

-- 상품후기 더미데이터
-- CLO496
insert into productreview(id, nickname, productid, reviewcontent, reviewimage) values('user020','캔달제너','CLO496','가성비는 갑이긴 합니다. 이런 하찌 니트 다른 도메스틱 브랜드나 자라같은 SPA 제품도 가지고 있는데<br>기본 6만원대이상인데 절반도 안되는 금액에 적당하게 두께감 있는 (물빨래까지 가능한) 하찌 니트라니…<br>10-20대 주머니 사정은 넉넉하지 않지만 이번 22SS 트렌드인 팝한 컬러감을 많이 활용하고 싶은 학생들에게 아주 좋은 대안이 될 것 같아요.','후기1.png');

-- CLO789
insert into productreview(id, nickname, productid, reviewcontent, reviewimage) values('user016','뀨엉','CLO789','오버사이즈에 긴 기장보다는 딱 맞는 핏으로 입고 싶어서 xs 사이즈로 선택 했어요. 158기준에게 반크롭에 살짝 낙낙한 정핏 느낌이 들어서 만족만족!<br> 탄탄한 짜임과 생각보다 두껍지는 않지만 얇지 않아서 겨울에도 입을 수 있을 정도예요.<br>지퍼도 부드럽게 움직이고 좋은 부품을 사용했다는 것이 티가 나요. 확실히 가격값 하는 것 같아요!','후기2.png');
insert into productreview(id, nickname, productid, reviewcontent, reviewimage) values('user009','한판 더 주세요','CLO789','조금 크게나왔는데 오버핏으로 입기 좋네요<br>질도 꽤 좋습니다 가성비 좋아요','후기3.png');
-- 상품후기 더미데이터 끝


create table payment( -- 결제 테이블
	paymentnumber INT PRIMARY KEY AUTO_INCREMENT,
	id varchar(50) not null,
    name varchar(50) not null,
    address varchar(50) not null,
    phone varchar(50) not null,
    postmessage varchar(50) not null,
    productId varchar(100) not null,
    productName varchar(100) not null,
    productUnitPrice int not null,
    productNumber int not null,
    card varchar(50) ,
	orderSetNumber INT not null,
    productImage varchar(500),
    status varchar(50)
);
update payment set status="배송준비중" where paymentnumber;
select * from payment;
drop table payment;


-- 게시판
create table board(
	num int not null auto_increment, 
    id varchar(20),						-- 아이디
    nickname varchar(30),				-- 닉네임
    title varchar(100) not null,		-- 제목
    content text not null,				-- 내용
    photo varchar(100),					-- 첨부파일
    hit int,							-- 조회수
    recommend int,						-- 추천수
    created datetime not null,			-- 작성시간
    primary key(num),
    foreign key(id) references member(id) on delete cascade
);
-- insert into board(id, nickname, title, content, photo, hit, recommend, created) values("user001","서one","샤넬백 아직도 구하기 어렵나요?","큰맘먹고 선물해줄라고 하는데 지금도 오픈런 해야하고 구하기 힘든거 맞죠? 괜히 헛걸음 할까 물어봅니다..","bag.jpg",10,1, now());
-- 양식에 맞추어 실제 패션 커뮤니티의 느낌이나는 글과 사진 작성
-- insert into board values(null,"java","김자반","자반이에요","반가워요 자반입니다.","aaa.png",0,0,"2023-11-21 17:05");

-- 이거 먼저 여러번 하고
insert into board(id, nickname, title, content, hit, recommend, created) values("user001","서one","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user002","갱얼쥐","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user003","밥버거","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user004","율곡이이","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user005","유나겅듀","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user006","송아지","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user007","짱구s2철수","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user008","봉미선씨","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user009","한판 더 주세요","게시글 제목","게시글 내용",5,5,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user010","찡긋","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user011","퇴근하고싶다","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user012","모먹징","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user013","오오티디","게시글 제목","게시글 내용",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user014","간생간살","게시글 제목","게시글 내용",5,5,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user015","나생강","게시글 제목","게시글 내용",5,5,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user016","뀨엉","게시글 제목","게시글 내용",5,5,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user017","큐티강철샘","게시글 제목","게시글 내용",5,5,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user019","김실버","게시글 제목","게시글 내용",5,5,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user020","캔달제너","게시글 제목","게시글 내용",5,5,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user018","신맹수","게시글 제목","게시글 내용",5,5,now());

-- 마지막에 3번정도 하면 됨
insert into board(id, nickname, title, content, hit, recommend, created) values("user001","서one","신발 고민중입니다","원하는 대장급 신발을 하나 사서 신는게 좋을까요 아니면 그 가격으로 여러 개 사서 돌려 신는 게 좋을까요?? 조언 부탁드립니다!!",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user002","갱얼쥐","회원님들 안입는 옷 제외 겨울 아우터 몇 벌 있으신가요?","봄가을아우터, 안입는 옷 제외하고 몇벌정도 갖고 계신가요?<br><br><br>저는 코트 6벌(싱글 2, 발마칸2, 더플1, 피코트1)<br><br>패딩 5벌<br><br>야상 1, 무스탕1 있는데 코트 더 사려다가 그만사라해서... 여쭤봅니다",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user003","밥버거","네이비 단색 바지 코디 어케하죠","띠어리꺼 왔는데 코디하기가 애매한듯?.? 어케입으면 좋을까요",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user004","율곡이이","나이키 전제품 30프로 할인이면 뭐를 사는게 좋을까요?","오픈기념 30프로 하는데 어떤거 사는게 제일 좋을까요?ㅎㅎ",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user006","송아지","핏 넉넉한 바지만 요즘 찾게되네요","와이드만 입다보니 세미와이드나 스탠다드도 이젠 너무 슬림하고 어색해보여서 ㅋㅋㅋㅋ<br><br>무조건 넓찍넓찍한거만 손이 갑니다<br><br>특히 패딩이랑 입다보니 더 그런거같아요 위아래 밸런스때문에..<br><br>유행 오래 가는 이유가 있네요",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user009","한판 더 주세요","코트 수선 할만한가요","코트가 한치수큰데 돈을들여서 한번 해볼까싶어서요<br><br><br>어깨 품 정도만 해도 될거같은데<br><br>어깨품이 대공사겠죠?? 해보신분 추천하시나요??",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user011","퇴근하고싶다","대구 이시아롯데아울렛 나이키 할인하네요","아울렛 가격 + 추가 25프로 할인해요 ㅎㅎ 오늘 갔다가 몇 점 구매했네요 ㅎㅎ",7,5,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user012","모먹징","부모님 선물 패딩 뭐가 좋을까요?","50만원 내외 가격대에서 패딩 하나씩 선물드리려 생각중인데요<br><br>노스페이스는 너무 어린 느낌이라 건너 뛰었고<br><br>부모님 세대의 근본 코오롱으로 가는게 맞을까요?<br><br>추천 브랜드 있으시면 부탁드립니다!",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user013","오오티디","유니클로처럼 자체 수선가능한 매장이 또 있나요?","동네 수선집도 이제 너무 비싸네요..<br><br>유니클로처럼 무료 또는 저렴하게 자체 수선해주는 spa브랜드가 또 있을까요?",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user014","간생간살","여러분이 생각하는 트렌드 지난 룩이나 아이템은?","저는 미니백은 완전히 지났고<br><br>Y2k는 슬슬 지나는 느낌이에용<br><br>나이키는 고점은 끝났고 이제는 그냥저냥",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user018","신맹수","안경 사이즈 잘 아시는분 계실까요?!","안경 사이즈 한번 봐주실분 계신가요!! 사진 올리긴 부끄러워서... ㅎㅎ",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user020","캔달제너","여자가 들고 다닐만한 브랜드 우산 있을까요?","여자친구가 질스튜어트에서 산 땡떙이 우산 들고다니다가 어디서 잃어버려서 새 우산을 구하고 있는데<br><br>비슷한 땡땡이 우산 추천해주니깐 별로라고 하더군요...<br><br>단색을 원하는 것 같은데 괜찮은 브랜드 우산 있으면 소개시켜주시길 부탁드립니다...",0,0,now());
insert into board(id, nickname, title, content, hit, recommend, created) values("user017","큐티강철샘","출근할때 신발 질문!","정장에서 비즈니스 캐쥬얼로 복장이 바뀐 회사라는데<br><br>운동화는 좀 아닌 것 같고 맨날 구두 신기는 좀 그렇고 적당히 단정한 신발 있을까요??굽 좀 있고",0,0,now());
insert into board(id, nickname, title, content, photo, hit, recommend, created) values("user012","모먹징","스톤 패딩 둘중에 어느걸 살까요 ㅠㅠ","후드있는 모포색.....<br><br><br><br>후드없는 네이비색....<br><br><br><br>고견 부탁드립니다ㅠㅠ","게시글_1.jpg",0,0,now());
delete from board;
select * from board ORDER BY num desc;
drop table board;


-- 커뮤니티 댓글 
create table reply(
   r_num int primary key auto_increment,  	-- 댓글 넘버
   c_num int not null,						-- 게시글 넘버
   id varchar(30),							-- 회원 아이디
   nickname varchar(30), 					-- 닉네임
   content varchar(1000),					-- 내용
   recommend int,							-- 추천
   created datetime DEFAULT CURRENT_TIMESTAMP,		-- 작성날짜
   foreign key(c_num) references board(num) on delete cascade
);
drop table reply;
delete  from reply;
select * from reply;
-- 게시글넘버 확인 후 수정
-- 게시글 내용과 번호 확인 후 해야 함

-- user017","큐티강철샘","출근할때 신발 질문!","정장에서 비즈니스 캐쥬얼로 복장이 바뀐 회사라는데<br><br>운동화는 좀 아닌 것 같고 맨날 구두 신기는 좀 그렇고 적당히 단정한 신발 있을까요??굽 좀 있고",0,0,now()
insert into reply(c_num,id,nickname,content,created) values(301,'user007','짱구s2철수','독일군 개꾸르',now());
insert into reply(c_num,id,nickname,content,created) values(301,'user011','퇴근하고싶다','더비나 로퍼 신어야쥬ㅋㅋ',now());
insert into reply(c_num,id,nickname,content,created) values(301,'user019','김실버','쿠에른 가보면 많아요',now());
insert into reply(c_num,id,nickname,content,created) values(301,'user020','캔달제너','쿠에른 가보면 많아요',now());
insert into reply(c_num,id,nickname,content,created) values(301,'user013','오오티디','더비편한거?',now());

-- user012","모먹징","스톤 패딩 둘중에 어느걸 살까요 ㅠㅠ","후드있는 모포색.....<br><br><br><br>후드없는 네이비색....<br><br><br><br>고견 부탁드립니다ㅠㅠ","게시글_1.jpg",0,0,now()
insert into reply(c_num,id,nickname,content,created) values(302,'user005','유나겅듀','취향인데 저는 후드있는거요 ㅎㅎ',now());
insert into reply(c_num,id,nickname,content,created) values(302,'user016','뀨엉','네이비 한표 던지고 갑니다...ㅎ',now());
insert into reply(c_num,id,nickname,content,created) values(302,'user014','간생간살','저는 요새 후드업는것만 입음니다',now());
insert into reply(c_num,id,nickname,content,created) values(302,'user008','봉미선씨','저는 네이비쪽이 더 취향이네요',now());
insert into reply(c_num,id,nickname,content,created) values(302,'user001','서one','전 올리브..갠적으로 스톤 네이비는 정말 안 이쁘더라구요',now());
insert into reply(c_num,id,nickname,content,created) values(302,'user018','신맹수','네이비한표!',now());
insert into reply(c_num,id,nickname,content,created) values(302,'user004','율곡이이','저라면 더 싼거 ㅋㅋㅋ !',now());


-- 답글
create table comment(
	co_num int primary key auto_increment,  		-- 답글 넘버
    re_num int not null, 							-- 댓글 넘버
    id varchar(30),									-- 회원 아이디
    nickname varchar(30),							-- 닉네임
    content varchar(1000),							-- 내용
    recommend int,									-- 추천
    created datetime DEFAULT CURRENT_TIMESTAMP,		-- 작성날짜
   foreign key(re_num) references reply(r_num) on delete cascade
);
drop table comment;
delete from comment;
select * from comment;
-- 답글 더미데이터
-- 2번째 글 (게시글넘버,'user014','간생간살','저는 요새 후드업는것만 입음니다',now());
insert into comment(re_num, id, nickname, content, created) values(3, 'user012', '모먹징', '추천해 줄 곳 있나요?!', now());
insert into comment(re_num, id, nickname, content, created) values(3, 'user014', '간생간살', '노스페이스 입음니다', now());

-- 게시글넘버,'user001','서one','전 올리브..갠적으로 스톤 네이비는 정말 안 이쁘더라구요',now()
insert into comment(re_num, id, nickname, content, created) values(5, 'user012', '모먹징', '추천과 함께 고견 감사드립니다(꾸벅)', now());
-- 답글 더미데이터 끝

-- insert into comment(re_num, id, nickname, content, created) values(댓글넘버, '아이디', '닉네임', '내용', now());



-- 추천인 관련 정보
create table liked(
	c_id varchar(50),  	-- 추천 누른 사람의 아이디
    num int,   			-- 추천 누른 게시물 번호
    primary key (c_id, num),
    foreign key(num) references board(num) on delete cascade
);
drop table liked;
select * from liked;

delete from liked;




-- 고객센터

-- 고객용 cs
create table guest_cs(
	csnum int primary key auto_increment,  -- 민원번호
	id varchar(50), 		-- 고객 sessionId
    title varchar(100), 	-- 질문 제목
    content varchar(1000), 	-- 문의 내용
    productId varchar(50),  -- 상품id
    created datetime DEFAULT CURRENT_TIMESTAMP		-- 질문일시
);
delete from guest_cs;
select * from guest_cs;
drop table guest_cs;

-- 상품문의 더미데이터
-- 상품번호 : CLO496
insert into guest_cs(id, title, content, productId, created) values('user011', '배송문의합니다~ ', '방금 주문했는데<br><br>늦어도 금요일까지 배송부탁드립니다ㅜㅠ 여행 계획이있어서요 ㅠㅠ', 'CLO456', now());
insert into guest_cs(id, title, content, productId, created) values('user017', '환불요청', '환불을 요청했는데 택배기사님이 송장이 안나왔데오<br>확인부탁드립니다!', 'CLO456', now());
insert into guest_cs(id, title, content, productId, created) values('user016', '사이즈 문의', '167 53 인데 크겠죠....? ㅠㅠ', 'CLO456', now());

-- 상품번호 : CLO369
insert into guest_cs(id, title, content, productId, created) values('user020', '아빠 생일선물 사이즈 추천좀', '키177에 70키로 초반 남자인데 사이즈 L도 적당할까요?<br>어깨는 평균 조금 이상정도입니다', 'CLO369', now());
insert into guest_cs(id, title, content, productId, created) values('user014', '사이즈 문의', '183 78 상의105는 라지 엑스라지뭐해야하나여', 'CLO369', now());
insert into guest_cs(id, title, content, productId, created) values('user018', '183 100', '평소에 110 115입는데 투엑스가 크진않겟됴?', 'CLO369', now());

-- insert into guest_cs(id, title, content, productId, created) values('아이디', '제목', '내용', '상품아이디', now());
-- 상품문의 더미데이터 끝

-- 판매자용 cs
create table seller_cs(
	sel_csnum int primary key auto_increment,  -- 민원답변번호
    guest_csnum int,			-- 고객민원번호
    sel_id varchar(50), 		-- 판매자 아이디
    sel_title varchar(100),		-- 답변 제목
	content varchar(1000), 		-- 문의 답변 내용
    sel_created datetime DEFAULT CURRENT_TIMESTAMP, 	-- 답변날짜
    foreign key(guest_csnum) references guest_cs(csnum) on delete cascade
);
-- 문의답글 더미데이터
-- 방금 주문했는데<br><br>늦어도 금요일까지 배송부탁드립니다ㅜㅠ 여행 계획이있어서요 ㅠㅠ
insert into seller_cs(guest_csnum, sel_id, sel_title, content, sel_created) 
	values(1, 'seller', '안녕하세요, 퍼즐 스토어입니다.', '회원님께서 문의하신 상품 현재 출고 완료되어 이동 중에 있습니다.<br><br>배송 완료까지 조금만 기다려주세요!<br>송장 조회를 통해 이동 내역 확인이 가능한 점 참고 부탁드립니다.<br><br>회원님의 편안한 쇼핑을 위해 최선을 다하겠습니다. 감사합니다.', now());

-- 환불을 요청했는데 택배기사님이 송장이 안나왔데오<br>확인부탁드립니다!
insert into seller_cs(guest_csnum, sel_id, sel_title, content, sel_created) 
	values(2, 'seller', '안녕하세요, 퍼즐 스토어입니다.', '먼저, 해당 부분으로 불편을 드려 죄송합니다.<br><br>문의해 주신 상품 자사 측에서 직접 회수 접수 진행을 도와드리겠습니다.<br>회수는 영업일 기준 1~2일이 소요될 수 있는 점 참고를 부탁 드립니다.<br><br>최대한 빠른 처리가 될 수 있도록 노력하겠습니다. 감사합니다.)', now());

-- 167 53 인데 크겠죠....? ㅠㅠ
insert into seller_cs(guest_csnum, sel_id, sel_title, content, sel_created) 
	values(3, 'seller', '안녕하세요, 퍼즐 스토어입니다.', '전달 주신 정보로만 말씀드리기 어려우나 넉넉한 사이즈를 즐겨 입으실 경우 소매를 접어 착용하셔도 좋으실 것으로 예상됩니다.<ㅠbr>다만 개개인마다 차이가 있으실 수 있으니 자세한 사항은 실측표를 확인 부탁드리겠습니다.<br><br>추가 문의 사항이 있으실 경우 언제든지 문의 부탁드립니다. 감사합니다.', now());

-- 키177에 70키로 초반 남자인데 사이즈 L도 적당할까요?<br>어깨는 평균 조금 이상정도입니다
insert into seller_cs(guest_csnum, sel_id, sel_title, content, sel_created) 
	values(4, 'seller', '안녕하세요, 퍼즐 스토어입니다.', '문의하신 제품의 L사이즈가 현재 품절 상태로 주문이 어렵습니다.<br><br> 추가 문의 사항이 있으실 경우 언제든지 문의 부탁드립니다. 감사합니다.', now());
    
-- 183 78 상의105는 라지 엑스라지뭐해야하나여    
insert into seller_cs(guest_csnum, sel_id, sel_title, content, sel_created) 
	values(5, 'seller', '안녕하세요, 퍼즐 스토어입니다.', '전달 주신 정보로만 말씀드리기 어려우나 넉넉한 사이즈를 즐겨 입으실 경우 소매를 접어 착용하셔도 좋으실 것으로 예상됩니다.<ㅠbr>다만 개개인마다 차이가 있으실 수 있으니 자세한 사항은 실측표를 확인 부탁드리겠습니다.<br><br>추가 문의 사항이 있으실 경우 언제든지 문의 부탁드립니다. 감사합니다.', now());

-- 평소에 110 115입는데 투엑스가 크진않겟됴?
insert into seller_cs(guest_csnum, sel_id, sel_title, content, sel_created) values(6, 'seller', '안녕하세요, 퍼즐 스토어입니다.', '전달 주신 정보로만 말씀드리기 어려우나 자주 입으시는 옷과 비교하면 더욱 좋을 것 같습니다.<br>자세한 사항은 실측표를 확인 부탁드리겠습니다. 감사합니다.', now());

-- insert into seller_cs(guest_csnum, sel_id, sel_title, content, sel_created) values(민원번호, 'seller', '제목', '내용', now());
-- 문의답글 더미데이터 끝


select * from seller_cs;
drop table seller_cs;
