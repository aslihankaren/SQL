--------------DAY'7 NT---------------------
--JOINS--BİRLEŞTİRME
--JOIN:ilişkili tablolarda ortak bir sütun baz alınarak(tipik olarak PK ve FK)
--bir veya daha fazla tablodaki sütunların birleştirilmesini sağlar.

---====> join sütun birlestirir, union sorgu birlestirir
/* 4 adet join var
1- inner join
	a- self join
2- left join
3- right join
4- full join

inner join ile sadece sütunlarin ortak kismini aliriz
left join ile sorgunun sol tarfinda olan tablonun bilgilere göre siralma yapiyor
right join ile sorgunun sag tarafindaki tablonun bilgilerine göre siralama yapiyor
full join ile de bütün tabloyu birlestiriyor, ortak fieldlari birlestirme yapmiyor
ayri olarak birlestriyor string ile int gibi

*/

CREATE TABLE companies  (
company_id int,  
company_name varchar(20)
);

INSERT INTO companies VALUES(100, 'IBM');
INSERT INTO companies VALUES(101, 'GOOGLE');
INSERT INTO companies VALUES(102, 'MICROSOFT');
INSERT INTO companies VALUES(103, 'APPLE');
select * from companies

CREATE TABLE orders (
order_id int,
company_id int,
order_date date
);
INSERT INTO orders VALUES(11, 101, '2023-02-17');  
INSERT INTO orders VALUES(22, 102, ' 2023-02-18');  
INSERT INTO orders VALUES(33, 103, ' 2023-01-19');  
INSERT INTO orders VALUES(44, 104, ' 2023-01-20');  
INSERT INTO orders VALUES(55, 105, ' 2022-12-21');
select * from orders

--33-INNER JOIN:baz aldığımız sütundaki sadece ortak olan kayıtları getirir

--iki tablodaki company_id'si aynı olanların company_id,company_name,
--order_date,order_id sini  listeleyiniz.
--(sipariş veren şirketlerin id,name,sipariş tarihi,sipariş idlerini görüntüleyiniz.)

select c.company_id, company_name,order_id,order_date
from companies as c inner join orders as o 
on c.company_id=o.company_id


-----------------------------------------------------------------------------
--34-LEFT JOIN:baz aldığımız sütundaki, SOL(ilk) tablodaki tüm kayıtları getirir.
   --RIGHT JOIN:baz aldığımız sütundaki, SAĞ(ikinci) tablodaki tüm kayıtları getirir.
   
  --companies tablosundaki tüm kayıtların company_id,company_name,
--order_date,order_idsini  listeleyiniz. 
-- tüm sirketlerin bilgilerini ve siparislerini listeleyiniz
   
select c.company_id, company_name,order_id,order_date
from companies  c left join orders o
on c.company_id=o.company_id
   
   
   
 --orders tablosundaki tüm kayıtların company_id,company_name,
--order_date,order_idsini  listeleyiniz. 
  -- burda order a göre alidigim icin daha cok satir geldi, cümkü ordaki satirlarin tum bilgileri geldi
 select c.company_id, company_name,order_id,order_date
from companies  c right join orders o
on c.company_id=o.company_id  
 
 
select o.company_id, company_name,order_id,order_date
from orders o   left join companies c
on c.company_id=o.company_id 

SELECT c.company_id,company_name,order_id,order_date,o.company_id
FROM orders AS o  INNER JOIN companies AS c
ON c.company_id=o.company_id

-- cogunlukla left kullaniliyormus yukaridaki iki sorgunun sonucu ayni
-- right ve left yer degistirerek bir birlerine alternatif olabilirler
-- inner joinde ortak degerler oldugu icin tablo sirasi fark etmez 
---------------------------------------------------------------------------------
--35-FULL JOIN:baz aldığımız sütundaki, her iki tablodaki tüm kayıtları getirir.

SELECT c.company_id,company_name,order_id,order_date,o.company_id
FROM orders AS o  full JOIN companies AS c
ON c.company_id=o.company_id
---- all ile ayni durum oluyor
select *
FROM orders AS o  full JOIN companies AS c
ON c.company_id=o.company_id



-----------------------------------------------------------------------------------------------
--36-SELF JOIN : tablonun kendi içindeki bir sütunu baz alarak INNER JOIN yapılmasını sağlar. 

CREATE TABLE personeller  (
id int,
isim varchar(20),  
title varchar(60), 
yonetici_id int
);
INSERT INTO personeller VALUES(1, 'Ali Can', 'SDET',     2);
INSERT INTO personeller VALUES(2, 'Veli Cem', 'QA',      3);
INSERT INTO personeller VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personeller VALUES(4, 'Fatma Can', 'CEO',    null);

SELECT * FROM personeller;


--yöneticisi olan personelin ismi ile birlikte yöneticisinin ismini de veren bir sorgu oluşturunuz.

SELECT p.isim personel,m.isim yonetici
FROM personeller p INNER JOIN personeller m
ON p.yonetici_id=m.id



-------------------------------------------------------------------------------
--37-LIKE Cond.:WHERE komutu ile birlikte kullanılır
--sorgularda belirli bir karakter deseni(pattern-dizisi) kullanarak filtreleme yapmayı sağlar
--ILIKE:LIKE gibi çalışır, CASE-INSENSITIVE dir.


CREATE TABLE words
( 
  word_id int UNIQUE,
  word varchar(50) NOT NULL,
  number_of_letters int
);

INSERT INTO words VALUES (1001, 'hot' , 3);
INSERT INTO words VALUES (1002, 'hat' , 3);
INSERT INTO words VALUES (1003, 'Hit' , 3);
INSERT INTO words VALUES (1004, 'hbt' , 3);
INSERT INTO words VALUES (1008, 'hct' , 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selim',6);
INSERT INTO words VALUES (1007, 'yusuf',5);
INSERT INTO words VALUES (1009, 'hAt',  3);
INSERT INTO words VALUES (1010, 'yaf',  5);
INSERT INTO words VALUES (1011, 'ahata',3);

SELECT * FROM words;

-- select * from developers where name 'Enes....'
--==>wildcard(joker-%): 0 veya daha fazla karakteri temsil eder

select * from developers where name like 'E%' ---E, Eb, Ebc
select * from developers where name like 'A%'

-- kucuk buyuk harf duyarliligi olmasin 
select * from developers where name ilike 'a%'

--Ismi T ile başlayıp n harfi ile biten dev isimlerini ve maaşlarını yazdiran QUERY yazin
select name, salary from developers where name like 'T%n'

--Ismi içinde 'an' olan dev isimlerini ve maaşlarını yazdiran QUERY yazin
select name, salary from developers where name like '%an%'

--Ismi içinde e ve a olan devlerin tüm bilgilerini yazdiran QUERY yazin
--1.yol
select * from developers where name like '%e%' and name like '%a%'
--2.yol
select * from developers where name like '%e%a%' and name like '%a%e%'

---===> underscore(_): sadece 1 karakteri temsil eder
--Isminin ikinci harfi ü olan devlerin tum bilgilerini yazdiran QUERY yazin
select * from developers where name like '_ü%'

--Kullandığı prog. dili 4 harfli ve üçüncü harfi v olan devlerin tum bilgilerini yazdiran QUERY yazin
-- 4harfli istedigim icin kesin karakter olsun diye % kullanmadik
select prog_lang from developers where prog_lang like '__v_'





--------------------------------------------------------------------------------------------
--38-REGEXP_LIKE(~):belirli bir karakter deseni(regex) içeren kayıtları filtrelemeyi sağlar
--words ile devam

--[]: icerisindeki karakterlerden sadece birini temsil eder 

--h harfinden sonra a veya i harfini sonra ise t harfini 
--içeren kelimelerin tum bilgilerini yazdiran QUERY yaziniz.

select word
from words
where word ~'h[ai]t'; --- hat hit bas orta son

select word
from words
where word ~* 'h[ai]t';  --- hat hitgelir ama hait gelmez, hatip gelir

--[-] : bu iki karakter arasındaki tüm karakterlerden sadece 1 tanesini temsil eder

 --h harfinden sonra, a ile k arasindaki harflerden birini, sonra da t harfini
-- içeren kelimelerin tum bilgilerini  yazdiran QUERY yaziniz.
SELECT *
FROM words
WHERE word ~* 'h[a-k]t';--hat,hbt,hct,hkt gelir hlt gelmez

-- Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from words
where word ~* '[mi]'

-- ^: baslangici gösterir 
-- $: bitisi gosterir, sonrasinda karakter gelmez

--a ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from words
where word ~* '^a'


--m ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from words
where word ~* 'm$'

--ÖDEV:a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin. 
select * from words
where word ~* '^a' or word ~*'^s'

select * from words
where word ~* '^[as]' 

--(.*): 0 veya daha fazla karakter 
--(.): sadece 1 tane karakter

--y ile başlayıp f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from words
where word ~*'^y(.*)f$'; --- yf yaf vb gelir

--ÖDEV:y ile başlayıp f ile biten 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin.
select * from words
where word ~*'^y(.)f$'; ---??
