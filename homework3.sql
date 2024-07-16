------------------ Homework 3-------------
CREATE TABLE teachers(
id int,
firstname varchar(50),
lastname varchar(50),
age int,    
city varchar(20),
course_name varchar(20),
salary real    
);
INSERT INTO teachers VALUES(111,'Ahmet' ,'Han'   ,35,'Istanbul','SpringMVC' ,5000   );
INSERT INTO teachers VALUES(112,'Mehmet','Ran'   ,33,'Van'     ,'HTML'      ,4000   );
INSERT INTO teachers VALUES(113,'Bilal' ,'Fan'   ,34,'Bursa'   ,'SQL'       ,3000   );
INSERT INTO teachers VALUES(114,'Celal' ,'San'   ,30,'Bursa'   ,'Java'      ,3000   );
INSERT INTO teachers VALUES(115,'Deniz' ,'Can'   ,30,'Istanbul','SQL'       ,3500   );
INSERT INTO teachers VALUES(116,'Ekrem' ,'Demir' ,36,'Istanbul','Java'      ,4000.5 );
INSERT INTO teachers VALUES(117,'Fatma' ,'Celik' ,38,'Van'     ,'SpringBOOT',5550   );
INSERT INTO teachers VALUES(118,'Hakan' ,'Cetin' ,44,'Izmir'   ,'Java'      ,3999.5 );
INSERT INTO teachers VALUES(119,'Mert'  ,'Cetin' ,32,'Izmir'   ,'HTML'      ,2999.5 );
INSERT INTO teachers VALUES(120,'Nilay' ,'Cetin' ,32,'Izmir'   ,'CSS'       ,2999.5 );
INSERT INTO teachers VALUES(121,'Selma' ,'Celik' ,40,'Ankara'  ,'SpringBOOT',5550   );
INSERT INTO teachers VALUES(122,'Fatih' ,'Can'   ,32,'Ankara'  ,'HTML'      ,2550.22);
INSERT INTO teachers VALUES(123,'Nihat' ,'Keskin',32,'Izmir'   ,'CSS'       ,3000.5 );
INSERT INTO teachers VALUES(124,'Hasan' ,'Temel' ,37,'Istanbul','S.Security',3000.5 );



CREATE TABLE courses(
course_id int,
course_name varchar(20) UNIQUE,
credit int,
course_fee numeric(5,2),
start_date date,
finish_date date    
);

INSERT INTO courses VALUES(3001,'SpringMVC' ,10,100.05 , '2023-01-10','2023-02-10');
INSERT INTO courses VALUES(3002,'SpringBOOT',8,120.25  , '2023-02-11','2023-02-28');
INSERT INTO courses VALUES(3003,'S.Security',6,200.15  , '2023-03-03','2023-03-12');
INSERT INTO courses VALUES(3004,'Java'      ,26,159.99 , '2022-11-03','2023-01-12');
INSERT INTO courses VALUES(3005,'SQL'       ,6,175.55  , '2023-01-03','2023-03-12');
INSERT INTO courses VALUES(3006,'React'     ,12,255.85 , '2023-06-03','2023-07-12');
INSERT INTO courses VALUES(3007,'HTML'      ,6,125.99  , '2023-03-03','2023-03-22');
INSERT INTO courses VALUES(3008,'CSS'       ,5,125.99  , '2023-04-03','2023-04-22');
INSERT INTO courses VALUES(3009,'JavaScript',10,199.99 , '2023-05-03','2023-05-31');

--1--35 yaşından küçük öğretmenlerin verdikleri derslerin isimlerini ve kredi sayılarını listeleyiniz.
select t.course_name, credit 
from courses as c inner join teachers as t
on c.course_name=t.course_name
where t.age<35

SELECT course_name,credit
FROM courses
WHERE course_name IN (SELECT course_name FROM teachers WHERE age<35);

--2--Her bir şehirde verilen derslerin isimlerini ve kredisini listeleyiniz. 
select city, c.course_name,c.credit
from teachers as t inner join courses as c
on t.course_name=c.course_name


SELECT city,course_name, (SELECT credit FROM courses c WHERE c.course_name=t.course_name )
FROM teachers t;

--3--İstanbulda yaşayan öğretmenlerin verdiği derslerin isimlerini ve başlangıç tarihini listeleyiniz.
select city, c.course_name, start_date
from teachers as t inner join courses as c
on t.course_name=c.course_name
where city='Istanbul'

SELECT course_name,start_date
FROM courses
WHERE course_name IN (SELECT course_name FROM teachers WHERE city='Istanbul')


--4--İstanbulda yaşayan öğretmenlerin isimlerini(firstname), verdiği derslerin isimlerini ve bitiş tarihini listeleyiniz. 
select firstname, c.course_name, finish_date
from teachers as t inner join courses as c
on t.course_name=c.course_name
where city='Istanbul'

SELECT firstname, course_name,(SELECT finish_date FROM courses c WHERE c.course_name=t.course_name)
FROM teachers t
WHERE city='Istanbul'


--5--'03-03-2023' tarihinden önce başlayan dersleri veren öğretmenlerin maaşlarının ortalamasını bulunuz.
select  avg(salary) 
from teachers as t left join courses as c
on t.course_name=c.course_name
where start_date<'03-03-2023'  


--6--2023 Şubat ve Mayıs ayları arasında başlayan dersleri veren öğretmenlerin toplam maaşını hesaplayınız.
select  sum(salary) 
from teachers as t left join courses as c
on t.course_name=c.course_name
where  start_date between '01-02-2023' and '01-03-2023';



--7--Kurs ücreti 125 ten fazla olan derslerin isimlerini, kredilerini ve bu dersleri veren öğretmenlerin max ve min maaşlarını listeleyiniz
select t.course_name, credit,  min(salary), max(salary)
from teachers as t full join courses as c
on t.course_name= c.course_name
where course_fee >125 ------------=============>>>


--8-- Ahmet Han'ın maaşı ortalama maaştan büyük ise tüm bilgilerini listeleyiniz.
select * 
from teachers
where salary> (select avg(salary) 
			   from teachers)
			   and firstname='Ahmet' and lastname= 'Han'



--9--Yaşı 37 den büyük olan öğretmenlerin yaşını Java dersi alanların yaşlarının minimumu ile güncelleyiniz.
update teachers
set age =(select min(age) from teachers where course_name='Java')
where age>37

--10--Yaşı 35 den büyük olan öğretmen varsa, bu öğretmenlerin verdiği derslerin isimlerini ve başlangıç tarihlerini listeleyiniz.

--11--Hiçbir öğretmen tarafından verilmeyen dersleri isim, başlangıç ve bitiş tarihlerini listeleyiniz.

--12--En az bir öğretmen tarafından verilen derslerin ücretlerini 10 artırınız

--13--Ücreti 170 den fazla olan ders varsa bu dersi veren öğretmenlerin tüm bilgilerini listeleyiniz.(IN kullanmayınız.)

--14--Başlangıç tarihi '03-11-2022' olan kursun ismini ' Core' ekleyiniz.

--15--Maaşı ortalama maaştan yüksek olan öğretmenin şehrini Antalya olarak değiştiriniz.

--16--Yaşı en küçük olan dersin öğretmeninin maaşını 2 katına çıkarınız.

--17--En erken başlayan kursun kredisini 2 artırınız.

