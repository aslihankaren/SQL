--------------DAY'6 NT---------------------
--29-GROUP BY clause:tablomuzdaki kayıtları belirli bir veya daha fazla sütuna göre gruplandırabiliriz.

CREATE TABLE manav
(
id int,	
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);

INSERT INTO manav VALUES( 1,'Ali',  'Elma', 5);
INSERT INTO manav VALUES( 2,'Ayse', 'Armut',3);
INSERT INTO manav VALUES( 3,'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 4,'Hasan', 'Uzum',4);  
INSERT INTO manav VALUES( 1,'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 2,'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 3,'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 1,'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 3,'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 2,'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 2,'Ayse', 'Uzum', 2);

SELECT * FROM manav;


--Manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.
SELECT isim, SUM(urun_miktar)
FROM manav
GROUP BY isim


--Manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.
--toplam ürün miktarına göre azalan olarak sıralayınız.
--- order by kullanirken siralayacagi sütunun ismini de yaz
select isim, sum(urun_miktar) toplam_urun
from manav
group by isim
order by sum(urun_miktar) desc;


--Her bir ismin aldığı her bir ürünün toplam miktarını isme göre sıralı görüntüleyiniz.
-- birden fazla grup istedigimzde ilk gruplamadan baslayarak iceriye dogru gruplari olusturur ve
-- burda toplamalari urun adina gore veriyor yani en son gruplamaya gore yapiyor
select isim, urun_adi, sum(urun_miktar)
from manav
group by isim, urun_adi
order by isim

--NOT:GROUP BY ile gruplama yapıldığında SELECTten sonra sadece gruplanan sütun 
--yada başka bir sütunun AGGREGATE fonk ile hesaplaması kullanılabilir
--!!!!!!!!!!!
SELECT isim, urun_miktar ---hata burda hesaplama yok 
FROM manav
GROUP BY isim
--!!!!!!!!!!!

--ürün ismine göre her bir ürünü alan toplam kişi sayısı gösteriniz. saymak icin count, distinct tekrarsiz
select urun_adi, count (distinct isim)
from manav
group by urun_adi 


--Isme göre alınan toplam ürün miktarı ve ürün çeşit miktarını bulunuz
select isim, sum(urun_miktar) toplam_kg , count (distinct urun_adi) cesit_sayisi
from manav
group by isim

--ÖDEV:Alinan ürün miktarina gore musteri sayisinı görüntüleyiniz.
--musteri sayisina göre artan sıralayınız.

select urun_miktar, count( distinct isim)-----????
from manav
group by urun_miktar
order by urun_miktar

---------------------------------------------------------------------------------------
--30-HAVING clause:GROUP BY komutundan sonra yapılan işlemle ilgili bir koşul ile
--sonuçları filtrelemek için AGGREGATE fonk ile birlikte kullanılır.


CREATE TABLE personel  (
id int UNIQUE,
isim varchar(50),
sehir varchar(50), 
maas int,  
sirket varchar(20),
departman varchar(20)	
);

INSERT INTO personel VALUES(123, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda','IT'); 
INSERT INTO personel VALUES(234, 'Veli Sahin', 'Istanbul', 4500, 'Toyota','IT'); 
INSERT INTO personel VALUES(345, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda','Sales');
INSERT INTO personel VALUES(456, 'Mehmet Demir', 'Izmir', 6000, 'Ford','IT'); 
INSERT INTO personel VALUES(567, 'Murat Demir', 'Ankara', 7000, 'Tofas','IT');
INSERT INTO personel VALUES(678, 'Ali Sahin', 'Ankara', 4500, 'Ford','Sales');  
INSERT INTO personel VALUES(789, 'Hatice Sahin', 'Bursa', 4500, 'Honda','Accounting');
INSERT INTO personel VALUES(890, 'Hatice Can', 'Ankara', 3000, 'Tofas','Accounting');
INSERT INTO personel VALUES(912, 'Murat Han', 'Istanbul', 5500, 'Toyota','Sales'); 
INSERT INTO personel VALUES(913, 'Betül Yavuz', 'Bursa',3500, 'Ford','Marketing'); 


SELECT * FROM personel;


--Her bir şirketin MIN maas bilgisini, bu bilgi eğer 4000 den fazla ise görüntüleyiniz.
-- having fonksiyonu group by dan sonra bir kosul ve avvregate fonksiyon ile kullanilir ve kosulu saglayan sonuclari filtreler
/*
SQL'de WHERE ve HAVING ifadeleri, sorguları filtrelemek için kullanılır ancak farklı amaçlara hizmet ederler:

WHERE: WHERE ifadesi, sorgunun sonuçlarını belirli bir koşula göre filtrelemek için kullanılır. 
Bu koşul, sorgulanan tablodaki sütunlara veya ilişkili tablolardaki sütunlara uygulanır. 
Sorgunun temel mantıksal operatörlerini (AND, OR, NOT) kullanarak birden fazla koşulu birleştirebilirsiniz.

HAVING: HAVING ifadesi, gruplanmış sonuçları filtrelemek için kullanılır. 
Bu, GROUP BY ifadesinden sonra gelir ve gruplar üzerinde koşulları uygulamak için kullanılır. 
HAVING ifadesi, toplu işlevlerle (SUM, AVG, COUNT vb.) hesaplanan değerlerin filtrelenmesi için sıklıkla kullanılır.

Özetle, WHERE koşulları veri satırlarını filtrelemek için kullanılırken, 
HAVING koşulları gruplanmış sonuçları filtrelemek için kullanılır.*/


select sirket, min(maas)
from personel
group by sirket
having min(maas)>4000;


--Maaşı 4000 den fazla olan çalışanlardan, her bir şirketin MIN maas bilgisini görüntüleyiniz.
--mevcut bir bilgiyi kullanirken where kullaniyorum
SELECT sirket, MIN(maas)
FROM personel
WHERE maas>4000
GROUP BY sirket

--NOT:GROUP BY ile gruplama yaptıktan sonra raporu filtrelemek için HAVING aggregate fonk ile kullanılır,
--gruplamadan önce tablodaki satırları belirli bir sütuna göre filtrelemek için WHERE kullanılır

--Her bir sehirde alınan toplam gelir 10000 liradan fazla ise sehir ve toplam maasi gösteren sorgu yaziniz.

select sehir, sum(maas)
from personel
group by sehir
having sum(maas)>10000

--Eğer bir departmanda çalışan personel(id) sayısı 1’den çoksa departman ve personel sayısını veren sorgu yazınız
select departman, count(id)
from personel
group by departman
having count (id)>1

--ÖDEV: Eğer bir şehirde alınan MAX maas 5000’den düşükse sehir ismini ve MAX maasi veren sorgu yazınız.
select sehir,max(maas)
from personel
group by sehir
having max(maas)<5000  ----?????


-------------------------------------------------------------------------------------------
--31-UNION:iki farklı sorgunun sonucunu birleştirerek tek bir sütunda/raporda görüntülemeyi sağlar.
--        -tekrarlı olanları göstermez
--UNION ALL: UNION gibi kullanılır, tekrarlı olanları da gösterir


CREATE TABLE developers(
id SERIAL PRIMARY KEY,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
prog_lang varchar(20),
city varchar(50),
age int	
);

INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('aslihan  karen','aslihankaren@mail.com',8000,'Java','Ankara',40);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mehmet Cenk','mehmet@mail.com',5000,'JavaScript','Istanbul',35);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayşenur Han ','aysenur@mail.com',5000,'Java','Izmir',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Kübra Han','kubra@mail.com',4000,'JavaScript','Istanbul',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Muhammed Demir','muhammed@mail.com',6000,'Java','Izmir',25);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Fevzi Kaya','fevzi@mail.com',6000,'Html','Istanbul',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Enes Can','enes@mail.com',5500,'Css','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Tansu Han','tansu@mail.com',5000,'Java','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Said Ran','said@mail.com',4500,'Html','Izmir',33);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mustafa Pak','mustafa@mail.com',4500,'Css','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Hakan Tek','hakan@mail.com',7000,'C++','Konya',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Deniz Çetin','deniz@mail.com',4000,'C#','Istanbul',30);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Betül Çetin','btl@mail.com',4000,'C#','Bursa',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayse Gul','ayse@mail.com',4000,'C#','Ankara',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ali Seker','ali@mail.com',4000,'C#','Ankara',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('İrfan Canan','irfan@mail.com',8000,'Python','Ankara',33);

CREATE TABLE testers (
id INT UNIQUE, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas INT, 
isyeri VARCHAR(20)
);

INSERT INTO testers VALUES(12, 'Ali Seker', 'Istanbul', 2500, 'Vakko'),
(13, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki'),
(14, 'Ahmet Han', 'Ankara', 3000, 'Vakko'),
(15, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin'),
(16, 'Selim Can', 'Ankara', 7000, 'Adidas'),
(17, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin'),
(18, 'Fatma Yasa', 'Bursa', 2500, 'Vakko'),
(19, 'Betül Şen', 'Bursa', 2500, 'Vakko'),
(20, 'Ali Han', 'Antalya', 2500, 'Vakko');


CREATE TABLE contact_info(
address_id int,
street varchar(30),
number int,	
city varchar(30),
FOREIGN KEY(address_id) REFERENCES developers(id)	
);

INSERT INTO contact_info VALUES(1,'Kaya Sok.',5,'Bursa');
INSERT INTO contact_info VALUES(2,'Kaya Sok.',3,'Ankara');
INSERT INTO contact_info VALUES(3,'Can Sok.',10,'Bursa');
INSERT INTO contact_info VALUES(4,'Gül Sok.',12,'Ankara');
INSERT INTO contact_info VALUES(5,'Can Sok.',4,'Afyon');
INSERT INTO contact_info VALUES(6,'Taş Sok.',6,'Bolu');
INSERT INTO contact_info VALUES(7,'Dev Sok.',6,'Sivas');
INSERT INTO contact_info VALUES(8,'Dev Sok.',8,'Van');

SELECT * FROM developers;
SELECT * FROM contact_info;
SELECT * FROM testers;

--Ankarada yaşayan developer ve İstanbulda yaşayan
--testerların isimlerini
--birlikte tekrarsız gösteren sorguyu yaziniz

select name from developers where city= 'Istanbul'
union
select isim from testers where sehir='Ankara'

-- developer ve testerların isimlerini
--tekrarlı gösteren sorguyu yaziniz

select name from developers where city='Istanbul'
union all
select isim from testers where sehir ='Ankara'


--Yaşı 25’den büyük olan developer isimlerini ve 
--yaşı 30'dan küçük developerların kullandığı prog. dillerini 
--birlikte tekrarlı gösteren sorguyu yaziniz


select name from developers where age>25
union all
select prog_lang from developers where age<30


--NOT:UNION/UNION ALLile birleştirdiğimiz sorgular
--aynı sayıda sütunu göstermeli
--alt alta gelecek olan sütunlar aynı data tipinde olmalı

--Java kullanan developerların maaşını ve şehrini ve 
--Vakkoda çalışan testerların maaşını ve şehrini
--tekrarsız gösteren sorguyu yaziniz

select salary, city from developers where prog_lang='Java'
union
select maas, sehir from testers where isyeri='Vakko'
order by city  ---!!ilk sorgudaki field onemli, orderby yazinca sehir error verdi
---!! eger burda ilk select salary 2. select te sehir olsa hata olur
-------------------------------------------------------------------
--32-INTERSECT:iki farklı sorgunun sonuçlarından ortak olanları(kesişimi)
--tekrarsız olarak gösterir.

--developers tablosundaki şehirler ve
--tester tablosunda sehirlerin
--aynı olanlarını tekrarsız olarak listeleyiniz

select city from developers --16
intersect
select sehir from testers --9
---- kesisimi getirdi

--ÖDEV: developers tablosunda Java kullananların çalıştıkları şehirler ve
--testers tablosunda maaşı 1000 den fazla olanların sehirlerinden 
--ortak olanlarını listeleyiniz.






-----------------------------------------------------------------------------------------------
--33-EXCEPT:bir sorgunun sonuçlarından diğer bir sorgunun sonuçlarından 
--farklı olanları gösterir.

--developers tablosundaki şehirleri
--testers tablosunda sehirler hariç olarak listeleyiniz

SELECT city FROM developers
EXCEPT
SELECT sehir FROM testers

--testers tablosundaki şehirleri
--developers tablosunda sehirler hariç olarak listeleyiniz

SELECT sehir FROM testers
EXCEPT
SELECT city FROM developers

 --ÖDEV:mart ve nisan tablolarındaki tüm ürünlerin isimlerini tekrarsız listeleyiniz.  
 --ÖDEV:mart ve nisan tablolarındaki ortak ürünlerin isimlerini listeleyiniz.
 --ÖDEV:mart ayında satılıp nisan ayında satılmayan ürünlerin isimlerini listeleyiniz.


---- UNION=======>BIRLESIM
---- INTERSECT===>KESISIM
----- EXCEPT=====>FARK -------------- NOT: BURDA SIRA DEGISIRSE SONUC DEGISIR


