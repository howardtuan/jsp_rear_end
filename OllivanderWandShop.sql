DROP DATABASE IF EXISTS OLLIVANDERS_WAND_SHOP;
CREATE DATABASE OLLIVANDERS_WAND_SHOP CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE OLLIVANDERS_WAND_SHOP;
#供應商資料表
DROP TABLE IF EXISTS MANUFACTURER;
CREATE TABLE MANUFACTURER(
	SupplierID VARCHAR(10) NOT NULL UNIQUE,
    SupplierName VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    PRIMARY KEY (SupplierID)
);

INSERT INTO MANUFACTURER VALUE("MF001","奧利凡德家族","英國");
INSERT INTO MANUFACTURER VALUE("MF002","葛果羅威","東歐");

#客戶基本資料表
DROP TABLE IF EXISTS CLIENTS;
CREATE TABLE CLIENTS(
	ClientID int(11) NOT NULL AUTO_INCREMENT,
    ClientName VARCHAR(10) NOT NULL,
    ClientAccount VARCHAR(20) NOT NULL,
    ClientPassword VARCHAR(20) NOT NULL,
    BirthDay VARCHAR(20) ,
    PhoneNumber VARCHAR(10) ,
    Mail VARCHAR(40),
    #Address VARCHAR(20) NOT NULL,
	#Remark VARCHAR(100)
    PRIMARY KEY (ClientID)
);
select * from CLIENTS;
INSERT INTO CLIENTS VALUE(1,"哈利", "Harry", "Harry","2000/06/01","987878878","");
INSERT INTO CLIENTS VALUE(2,"妙麗", "Hermione", "Hermione","2000/03/01", "113113113","");
INSERT INTO CLIENTS VALUE(3,"鄧不利多", "Dumbledore", "Dumbledore", "2000/05/01","41666888","");
INSERT INTO CLIENTS VALUE(4,"管理員", "admin", "1234", "2000/09/01","0912345678","");

#產品類別資料表
DROP TABLE IF EXISTS WAND_CLASS;
CREATE TABLE WAND_CLASS(
	ClassID VARCHAR(10) NOT NULL UNIQUE,
	ClassName VARCHAR(10) NOT NULL,
    ClassIntroduce VARCHAR(500) NOT NULL,
    PRIMARY KEY (ClassID)
);

INSERT INTO WAND_CLASS VALUE("Class001", "龍", "一般說來，龍的心臟神經能製作出最為強大的魔杖，並且能施展出最華麗的魔法。這種魔杖通常學習得比其他種類的魔杖要快。 如果從原來的主人手中贏得它們，它們就會改變效忠對象，並且總V與現任主人聯繫最為緊密。龍的心臟神經製成的魔杖往往最容易轉變為黑魔法魔杖，儘管它並不會自己向這個方向傾斜。它也V三種杖芯中最容易發生事故的，顯得喜怒無常。");
INSERT INTO WAND_CLASS VALUE("Class002", "獨角獸", "獨角獸尾毛通常能產生最為穩定的魔法，很少受到波動或者阻塞。以獨角獸尾毛製成的魔杖難以使用黑魔法，而且能夠製成最為忠誠的魔杖：不論它的第一任主人VXV個傑出的巫師，它都會與這個人保持強烈的聯繫。獨角獸尾毛的小缺點V無法製成最強大的魔杖（儘管魔杖木材可能補償這一點不足），同時在處理不當的情況下，獨角獸尾毛還很容易變得憂鬱。這意味著這根尾毛已經「死去」，需要進行替換。");
INSERT INTO WAND_CLASS VALUE("Class003", "鳳凰", "這V最稀有的杖芯種類。鳳凰羽毛魔杖能夠施展最多的魔法種類，儘管它可能會花上比獨角獸毛和龍的心臟神經魔杖更長的時間才能表現出這一點。它們顯得最為主動，有時候會以自己的意願行事，而這也V許多巫師所不喜歡的。鳳凰羽毛魔杖在挑選主人時總V最挑剔的，因為鳳凰本身就V世界上最獨立、最超然的生物之一。這些魔杖最難最難馴服並私人化，並且很難獲得來自它們的忠誠。");

#產品資料表
DROP TABLE IF EXISTS PRODUCT;
CREATE TABLE PRODUCT(
	ProductID int(11) NOT NULL UNIQUE,
    ProductName VARCHAR(20) NOT NULL,
    Cost VARCHAR(10) NOT NULL,
    Price VARCHAR(10) NOT NULL,
    ClassID VARCHAR(10) NOT NULL,
    Wood VARCHAR(10) NOT NULL,
    Core VARCHAR(10) NOT NULL,
    Lengths VARCHAR(10) NOT NULL,
    Flexibility VARCHAR(10) NOT NULL,
    Introduce VARCHAR(500) NOT NULL,
    Launched VARCHAR(1) NOT NULL,
    ImgUrl VARCHAR(100),
    PRIMARY KEY (ProductID)
);
#select * from PRODUCT where ProductName like "%龍%";
INSERT INTO PRODUCT VALUE(1, "魔杖龍-櫸木", "500", "1800", "Class001", "山毛櫸木", "龍的心臟神經", '9\"', "易於彎曲", "該魔杖十分適合變形咒。鼎鼎大名的霍格華茲校長麥米捏娃教授V他的愛用者之一，真正適合於山毛櫸木魔杖的人，如果他還年輕，那麼他在同齡人中更為聰慧；如果他已經長大，那麼他會有豐富的認識和體會。山毛櫸木魔杖面對心胸狹窄、不懂寬容的人，將會表現得非常無力。", "V", "assets/img/w2.jpg");
INSERT INTO PRODUCT VALUE(2, "龍騎士", "500", "2000", "Class001", "紫杉木", "龍的心臟神經", '9\"', "可略彎曲", "紫樹的樹有驚人的壽命（因為英國的紫樹有兩代的壽命和死亡與死亡）它的汁液也能生出千百倍的毒性。紫杉木魔杖V更加罕見的品種，而它們理想的主人同樣不同尋常，偶爾甚至會臭名昭著。紫杉木魔杖會賦予持有者掌控生死的力量。", "V", "assets/img/w3.jpg");
INSERT INTO PRODUCT VALUE(3, "魔杖龍-楓木", "500", "1500", "Class001", "楓木", "龍的心臟神經", '10\"', "彈性較好", "該魔杖十分適合施放魔咒。造型由頭到整個柄呈螺旋狀，富有海邊氣息。經常發現楓木魔杖選擇的人大都V天生的旅者或者探險家。這並不V一種居家魔杖，它喜歡有抱負的巫師，不然它們的魔法就會變得沉重而平淡無奇。", "V", "assets/img/w4.jpg");
INSERT INTO PRODUCT VALUE(4, "決鬥大師", "500", "1500", "Class002", "楓木", "龍的心臟神經", '12¾\"', "不易彎曲", "這個魔杖比平時的大小要粗，由格里戈維奇製作。技術不精的魔杖製造師把胡桃木稱作V一種難以處理的木材，但這樣的舉動正顯露出了他們的無能。事實上，與雲杉木相配合需要特別的心靈手巧，而用它製作的魔杖並不適合讓那些過於謹慎、容易緊張的人使用，它們在那些猶豫的人的手中會變得非常危險。", "V", "assets/img/w7.jpg");
INSERT INTO PRODUCT VALUE(5, "靈魂使者", "500", "1500", "Class002", "烏木", "獨角獸尾毛", '8½\"', "有彈性的", "烏木V中最古老的樹木。在儀式中烏木都被廣泛潔淨。在全歐嫩枝都用於除靈。在鄉村頒獎典禮上也用於驅除遠古的亡魂。美麗的氣質。", "V", "assets/img/w10.jpg");
INSERT INTO PRODUCT VALUE(6, "魔杖角", "500", "1200", "Class002", "山楂木", "獨角獸尾毛", '10\"', "毫無彈性", "堅韌不拔的山木雖然粗暴的力量，代表著強大、持久、持久、堅韌的力量，卻能堅韌不過堅韌而堅韌。不那麼常見的木魔杖通常尋找擁有敏銳和耳聽力的人。", "V", "assets/img/w13.jpg");
INSERT INTO PRODUCT VALUE(7, "吟夢詩人", "500", "1200", "Class003", "白蠟樹", "獨角獸尾毛", '12¼\"', "彈性十足", "白木魔杖會永遠守住自己真正的主人，不適合留給其他人堅守的人，因為這就V它的力量。一根細長的一根獨角獸角的特殊長度，在一根獨角獸的角上拔出它的下一根根線，在一根根角上的細長的細線上，從一根根角點到他的高處。", "V", "assets/img/w14.jpg");
INSERT INTO PRODUCT VALUE(8, "雷雨回環", "500", "1700", "Class003", "榛木", "獨角獸尾毛", '9½\"', "彈性十足", "榛木V知識、純淨和真理之木，有時也被稱為“獨角獸樹”。榛木有時也據傳有驅趕毒蛇和治愈蛇咬傷的作用。獨角獸V純潔，清白的象徵。", "V", "assets/img/w16.jpg");
INSERT INTO PRODUCT VALUE(9, "魔杖鳳-冬青木", "500", "1200", "Class003", "冬青木", "鳳凰羽毛", '11\"', "易於彎曲", "冬青木有其特定的內涵，一種罕見的魔杖木材，通常被認為具有防禦的屬性，喜歡那些需要克服自己的怒氣和急躁情緒的主人。歐洲的傳統中認為，冬青樹（名字從“神聖”一詞而來）能夠驅除邪惡。", "V", "assets/img/w17.jpg");

#部門資料表
DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT(
	DepartmentID VARCHAR(10) NOT NULL UNIQUE,
    DepartmentName VARCHAR(10) NOT NULL,
    ManagerName VARCHAR(10) NOT NULL,
    PRIMARY KEY (DepartmentID)
);

INSERT INTO DEPARTMENT VALUE("D001","行銷部","段浩恩");
INSERT INTO DEPARTMENT VALUE("D002","採購部","郭睿桓");
INSERT INTO DEPARTMENT VALUE("D003","行政部","段浩恩");
INSERT INTO DEPARTMENT VALUE("D004","資訊部","郭睿桓");

#員工資料表
DROP TABLE IF EXISTS STAFF;
CREATE TABLE STAFF(
	StaffID VARCHAR(10) NOT NULL UNIQUE,
    StaffName VARCHAR(10) NOT NULL,
    DepartmentID VARCHAR(10) NOT NULL,
    JobTitle VARCHAR(10) NOT NULL,
    PRIMARY KEY (StaffID)
);

INSERT INTO STAFF VALUE ("S001", "段浩恩","D001","店長");
INSERT INTO STAFF VALUE("S002","郭睿桓","D002","店員");

#銷貨資料表
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS(
	OrderID int(11) NOT NULL AUTO_INCREMENT ,
    OrderDate VARCHAR(20),
    ClientID int(11) NOT NULL,
    Paid VARCHAR(1) NOT NULL DEFAULT "X",
    Ship VARCHAR(1) NOT NULL DEFAULT "X",
    PRIMARY KEY (OrderID)
);

INSERT INTO ORDERS VALUE(1,"2022-04-21 07:22:08",1,"V","V");
INSERT INTO ORDERS VALUE(2,"2022-05-22 14:50:41",2,"V","V");
INSERT INTO ORDERS VALUE(3,"2022-05-24 16:31:55",3,"V","V");
INSERT INTO ORDERS VALUE(4,"2022-05-28 09:10:22",2,"V","V");
INSERT INTO ORDERS VALUE(5,"2022-05-30 10:05:08",3,"X","V");
INSERT INTO ORDERS VALUE(6,"2022-06-01 20:25:44",1,"X","V");
INSERT INTO ORDERS VALUE(7,"2022-06-02 11:13:51",2,"X","V");
INSERT INTO ORDERS VALUE(8,"2022-06-04 18:22:16",3,"V","X");
INSERT INTO ORDERS VALUE(9,"2022-06-08 19:41:37",2,"X","X");
INSERT INTO ORDERS VALUE(10,"2022-06-10 14:30:58",3,"X","X");



DROP TABLE IF EXISTS ORDERS_DETAILS;
CREATE TABLE ORDERS_DETAILS(
	OrderDetailID int(11) NOT NULL AUTO_INCREMENT,
    OrderID int(11) NOT NULL,
	ProductID int(11) NOT NULL ,
    Quantity VARCHAR(10) NOT NULL,
    PRIMARY KEY (OrderDetailID)
);

#購物車資料表
DROP TABLE IF EXISTS CART;
CREATE TABLE CART(
	ClientID int(11) NOT NULL ,
    ProductID int(11) NOT NULL ,
    Quantity VARCHAR(10) NOT NULL
);
INSERT INTO CART VALUE(1,1,"2");
INSERT INTO CART VALUE(1,2,"1");
INSERT INTO CART VALUE(1,3,"2");
INSERT INTO CART VALUE(2,4,"3");



INSERT INTO ORDERS_DETAILS VALUE(1,1,3,5);
INSERT INTO ORDERS_DETAILS VALUE(2,1,8,7);
INSERT INTO ORDERS_DETAILS VALUE(3,1,2,3);
INSERT INTO ORDERS_DETAILS VALUE(4,2,4,17);
INSERT INTO ORDERS_DETAILS VALUE(5,2,1,4);
INSERT INTO ORDERS_DETAILS VALUE(6,3,8,12);
INSERT INTO ORDERS_DETAILS VALUE(7,4,6,5);
INSERT INTO ORDERS_DETAILS VALUE(8,4,5,14);
INSERT INTO ORDERS_DETAILS VALUE(9,5,9,2);
INSERT INTO ORDERS_DETAILS VALUE(10,5,4,7);
INSERT INTO ORDERS_DETAILS VALUE(11,5,2,20);
INSERT INTO ORDERS_DETAILS VALUE(12,6,3,2);
INSERT INTO ORDERS_DETAILS VALUE(13,6,2,5);
INSERT INTO ORDERS_DETAILS VALUE(14,7,7,9);
INSERT INTO ORDERS_DETAILS VALUE(15,7,3,2);
INSERT INTO ORDERS_DETAILS VALUE(16,7,4,6);
INSERT INTO ORDERS_DETAILS VALUE(17,8,5,4);
INSERT INTO ORDERS_DETAILS VALUE(18,8,9,3);
INSERT INTO ORDERS_DETAILS VALUE(19,9,2,9);
INSERT INTO ORDERS_DETAILS VALUE(20,9,6,5);
INSERT INTO ORDERS_DETAILS VALUE(21,10,8,3);
INSERT INTO ORDERS_DETAILS VALUE(22,10,2,10);
INSERT INTO ORDERS_DETAILS VALUE(23,10,1,9);

#進貨資料表
DROP TABLE IF EXISTS PURCHASE;
CREATE TABLE PURCHASE(
	PurchaseID VARCHAR(10) NOT NULL UNIQUE,
    PurchaseDate DATE NOT NULL,
    SupplierID VARCHAR(10) NOT NULL,
    StaffID VARCHAR(10) NOT NULL,
    PRIMARY KEY (PurchaseID)
);

INSERT INTO PURCHASE VALUE("P001","2022/04/15","MF002","S002");
INSERT INTO PURCHASE VALUE("P002","2022/04/17","MF001","S001");
INSERT INTO PURCHASE VALUE("P003","2022/04/20","MF001","S003");
INSERT INTO PURCHASE VALUE("P004","2022/04/22","MF002","S004");

DROP TABLE IF EXISTS PURCHASE_DETAILS;
CREATE TABLE PURCHASE_DETAILS(
	PurchaseDetailID VARCHAR(10) NOT NULL UNIQUE,
    PurchaseID VARCHAR(10) NOT NULL,
	ProductID int(11) NOT NULL ,
    Quantity VARCHAR(10) NOT NULL,
    Paid VARCHAR(1) NOT NULL DEFAULT "X",
    PRIMARY KEY (PurchaseDetailID)
);

INSERT INTO PURCHASE_DETAILS VALUE("PD001","P001",2,50,"V");
INSERT INTO PURCHASE_DETAILS VALUE("PD002","P001",5,50,"V");
INSERT INTO PURCHASE_DETAILS VALUE("PD003","P001",9,50,"V");
INSERT INTO PURCHASE_DETAILS VALUE("PD004","P002",7,50,"V");
INSERT INTO PURCHASE_DETAILS VALUE("PD005","P002",3,50,"V");
INSERT INTO PURCHASE_DETAILS VALUE("PD006","P003",4,50,"V");
INSERT INTO PURCHASE_DETAILS VALUE("PD007","P003",8,50,"V");
INSERT INTO PURCHASE_DETAILS VALUE("PD008","P003",1,50,"X");
INSERT INTO PURCHASE_DETAILS VALUE("PD009","P004",6,50,"X");


#留言板資料表
DROP TABLE IF EXISTS MESSAGEBOARD;
CREATE TABLE MESSAGEBOARD(
	MessageID int(11) NOT NULL UNIQUE,
    Rating VARCHAR(3) NOT NULL,
    ProductID int(11) NOT NULL ,
	ClientID int(11) NOT NULL,
    MessageContent VARCHAR(500) NOT NULL,
    PRIMARY KEY (MessageID)
);

INSERT INTO MESSAGEBOARD VALUE(1, "4.5", 6, 1, "Awesome!");
INSERT INTO MESSAGEBOARD VALUE(2, "4", 2, 3, "Awesome!");
INSERT INTO MESSAGEBOARD VALUE(3, "5", 4, 2, "Awesome!");

SELECT * FROM MANUFACTURER;
SELECT * FROM CLIENTS;
SELECT * FROM ORDERS;
SELECT * FROM ORDERS_DETAILS;
SELECT * FROM WAND_CLASS;
SELECT * FROM PRODUCT;

SELECT * FROM CART;
SELECT * FROM PURCHASE;
SELECT * FROM PURCHASE_DETAILS;
SELECT * FROM STAFF;
SELECT * FROM DEPARTMENT;
SELECT * FROM MESSAGEBOARD;

USE OLLIVANDERS_WAND_SHOP;
CREATE OR REPLACE VIEW PURCHASE_DETAILS_AMOUNT_VIEW AS
SELECT PURCHASE_DETAILS.`ProductID`, SUM(PURCHASE_DETAILS.`Quantity`) as Quantity
FROM OLLIVANDERS_WAND_SHOP.PURCHASE_DETAILS
GROUP BY `ProductID`;

SELECT * FROM PURCHASE_DETAILS_AMOUNT_VIEW ORDER BY Quantity DESC LIMIT 3;


#查詢某個客戶的訂單資料 產品名稱、數量、數量*價格、圖片url
USE OLLIVANDERS_WAND_SHOP;
DELIMITER //
CREATE PROCEDURE member_detail_ANY(
	IN id VARCHAR(10)
)
BEGIN
	select ORDERS_DETAILS.OrderID,PRODUCT.ImgUrl,PRODUCT.ProductName,cast( round(sum(ORDERS_DETAILS.Quantity)) as char) as Quantity, cast( round(sum(PRODUCT.Price*ORDERS_DETAILS.Quantity))as char) as total
	from PRODUCT,ORDERS_DETAILS,ORDERS 
	where ORDERS.ClientID= id
	and PRODUCT.ProductID=ORDERS_DETAILS.ProductID
	and ORDERS.OrderID=ORDERS_DETAILS.OrderID
	group by ProductName,ImgUrl,OrderID
    order by OrderID desc;
END //
DELIMITER ;
select * from orders;
delete from ORDERS where OrderID = 14;

#----------------------分割線----------------------
#查詢某個客戶的購物車 名稱 數量 總價
USE OLLIVANDERS_WAND_SHOP;
DELIMITER //
CREATE PROCEDURE cart_ANY(
	IN id VARCHAR(10)
)
BEGIN
	select PRODUCT.ImgUrl,PRODUCT.ProductName,PRODUCT.ProductID,cast( round(sum(CART.Quantity)) as char) as Quantity,cast( round(sum(PRODUCT.Price*CART.Quantity))as char) as total
	from PRODUCT,CART
	where CART.ClientID=id
	and PRODUCT.ProductID =CART.ProductID
	group by ProductName,ImgUrl,ProductID;
END //
DELIMITER ;


#----------------------分割線----------------------
CREATE OR REPLACE VIEW PURCHASE_DETAILS_AMOUNT_VIEW AS
SELECT PURCHASE_DETAILS.`ProductID`, SUM(PURCHASE_DETAILS.`Quantity`) as Quantity
FROM OLLIVANDERS_WAND_SHOP.PURCHASE_DETAILS
GROUP BY `ProductID`;

SELECT * FROM PURCHASE_DETAILS_AMOUNT_VIEW ORDER BY Quantity DESC LIMIT 3;

CREATE OR REPLACE VIEW ORDERS_DETAILS_AMOUNT_VIEW AS
SELECT ORDERS_DETAILS.`ProductID`, SUM(ORDERS_DETAILS.`Quantity`) as Quantity
FROM OLLIVANDERS_WAND_SHOP.ORDERS_DETAILS
GROUP BY `ProductID`;

SELECT * FROM ORDERS_DETAILS_AMOUNT_VIEW;

#進銷存View
CREATE OR REPLACE VIEW STOCK_VIEW AS 
SELECT purchase_details_amount_view.`ProductID`, 
  PRODUCT.`ProductName`,
        purchase_details_amount_view.`Quantity` as `進貨`,
        orders_details_amount_view.`Quantity` as `銷貨`,
        (purchase_details_amount_view.`Quantity` - orders_details_amount_view.`Quantity`) as 庫存
FROM purchase_details_amount_view,
     orders_details_amount_view,
     PRODUCT
WHERE purchase_details_amount_view.`ProductID` = orders_details_amount_view.`ProductID` and
PRODUCT.`ProductID`=orders_details_amount_view.`ProductID`;

SELECT * FROM STOCK_VIEW;

CREATE OR REPLACE VIEW EARN_COST_VIEW AS 
SELECT sum(STOCK_VIEW.`進貨`*PRODUCT.`Cost` )as `total_cost`,sum(STOCK_VIEW.`銷貨`*PRODUCT.`Price`) as `total_earn`
FROM STOCK_VIEW,PRODUCT
where PRODUCT.ProductID=STOCK_VIEW.ProductID;

SELECT * FROM EARN_COST_VIEW;
#-----

DELIMITER //
CREATE PROCEDURE STOCK_ANY(
 IN id VARCHAR(10)
)
BEGIN
 SELECT * 
 FROM STOCK_VIEW
 WHERE STOCK_VIEW.`ProductID` = id;
END //
DELIMITER ;

#客戶消費排行榜View
CREATE OR REPLACE VIEW CLIENT_RANK_VIEW AS
SELECT rank() over(ORDER BY SUM(ORDERS_DETAILS.`Quantity`*PRODUCT.`Price`) desc) as `排行`,
ORDERS.`ClientID`,CLIENTS.`ClientName`,SUM(ORDERS_DETAILS.`Quantity`*PRODUCT.`Price`) as `消費總額`
FROM ORDERS_DETAILS,PRODUCT,ORDERS,CLIENTS
WHERE ORDERS_DETAILS.`ProductID`=PRODUCT.`ProductID` and ORDERS.`OrderID`=ORDERS_DETAILS.`OrderID` and CLIENTS.`ClientID`=ORDERS.`ClientID`
GROUP BY `ClientID`;
SELECT `ClientName`,`消費總額` FROM CLIENT_RANK_VIEW;

