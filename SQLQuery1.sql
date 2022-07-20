use [Second_Task];

--creat restaurent table
CREATE TABLE Restaurent
(

RestaurentID int,
RestaurentName varchar(255),
Primary Key(RestaurentID)

);
Select* From Restaurent;
INSERT INTO Restaurent values
(1,'Afteem'),
(2,'Singer'),
(3,'Viendo');

--creat category table
CREATE TABLE Category 
(

CategoryID int,
CategoryName varchar(255),
Primary Key(CategoryID)

);
Select* From Category ;
INSERT INTO Category  values
(1,'Hot Drinks'),
(2,'Cold Drinks'),
(3,'Salads'),
(4,'Main Meal'),
(5,'Sweets'),
(6,'Arabic Meals');


--creat restaurentCategory table
 CREATE TABLE restaurentCategory
(

RestaurentID1 int,
CategoryID1 int,

Primary Key(restaurentID1,CategoryID1),
Foreign Key(RestaurentID1) references Restaurent(RestaurentID),
Foreign Key(CategoryID1) references Category(CategoryID)
);
Select* From restaurentCategory;
INSERT INTO restaurentCategory  values
(1,1),
(2,1),
(3,3),
(3,5),
(3,4),
(1,3),
(2,2),
(1,4),
(1,2),
(1,5),
(1,6),
(2,6);

--creat Items table
CREATE TABLE Items
(

ItemsID int IDENTITY,
ItemsName varchar(255),
price int,
CategoryID2 int,
Primary Key(ItemsID),
Foreign Key(CategoryID2) references Category(CategoryID)
);


Select* From Items;
INSERT INTO Items values


('coffee',15,1), ('tea',5,1), ('hotChocolate',25,1),('milk',10,1),
('iceCoffee',15,2), ('orange juice',10,2),('lemon juice',15,2),('apple juice',15,2),
('fatoosh',30,3), ('tradetional salad',40,3), ('caesar salad',45,3),('tabbooleh',60,3),
('pizza',65,4), ('burger',44,4), ('tajen',70,4),('pasta',55,4), 
('maqluba',80,5), ('mansaf',120,5), ('musakhan',100,5),('maftool',111,5), 
('cake',19,6), ('chocolate cookies',30,6), ('mini cupcacke',25,6),('katayef',35,6);

						


--1) Creat view for the restaurent and items 
CREATE VIEW [viewRestaurentItem] AS
SELECT RestaurentName, ItemsName
FROM Restaurent
INNER JOIN restaurentCategory ON Restaurent.RestaurentID=restaurentCategory.RestaurentID1
INNER JOIN Items ON restaurentCategory.CategoryID1=Items.CategoryID2;
select * from viewRestaurentItem;



--2) Number of items per restaurent
SELECT count( Items.ItemsID)as nums, Restaurent.RestaurentName
FROM Restaurent
INNER JOIN restaurentCategory ON Restaurent.RestaurentID=restaurentCategory.RestaurentID1
INNER JOIN Items ON restaurentCategory.CategoryID1=Items.CategoryID2 group by RestaurentID, RestaurentName;

--3) Average of items per category
SELECT  avg(counts) as avg_Items
 from (select count (Items.ItemsID) as counts,Category.CategoryName
from  Category INNER JOIN Items 
ON Category.CategoryID=Items.CategoryID2
group by Category.CategoryID,Category.CategoryName) as counts;


 --4) Lowest and highest average price item per restaurent

 SELECT  max (avg_price) AS Highest_avg_price ,min (avg_price) AS Lowest_avg_price
from(
SELECT avg (price ) as avg_price, Restaurent.RestaurentName
from Restaurent inner join restaurentCategory
  on  Restaurent.RestaurentID= restaurentCategory.RestaurentID1
 inner join Items
 on restaurentCategory.CategoryID1=Items.CategoryID2 group by Restaurent.RestaurentID,Restaurent.RestaurentName) as avg1  ;

 --5) The third higest price item per Resturant

 select Restaurent.RestaurentName ,(select Items.price  from  restaurentCategory
 inner join Items
 on restaurentCategory.CategoryID1=Items.CategoryID2
 where  Restaurent.RestaurentID =restaurentCategory.RestaurentID1
 ORDER BY price DESC  OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY ) 
 as  result from Restaurent   ;
 
  --6)Resturant has more than 5 categories

   SELECT count ( restaurentCategory.CategoryID1) as numberOfCategories, Restaurent.RestaurentName 
 from Restaurent inner join restaurentCategory
 on  Restaurent.RestaurentID= restaurentCategory.RestaurentID1 group by Restaurent.RestaurentID,Restaurent.RestaurentName having count ( restaurentCategory.CategoryID1) >5;


 ---7)index price 
 CREATE INDEX indexPrice
 ON items (price);


