------------------day 4 -------------
-- 18 ON DELETE CASCADE =kademeli silmeyi ac: kademeli silme islemini otomatik gerceklestirir

CREATE TABLE talebeler(
	id int PRIMARY KEY,
	isim varchar(50),
	veli_isim varchar(50),
	yazili_notu int
); --parent

CREATE TABLE notlar(
	talebe_id int,
	ders_adi varchar(30),
	yazili_notu int,
	CONSTRAINT notlar_fk FOREIGN KEY (talebe_id)  REFERENCES talebeler (id)
	ON DELETE CASCADE
); -- child

-- on delete cascade silme izni veriyor

INSERT INTO talebeler VALUES (122, 'Kerem Can','Fatma',75),
(123,'Ali Can','Hasan',75),
(124,'Veli Han','Ayse',85),
(125,'Kemal Tan', 'Hasan',85),
(126,'Ahmet Ran','Ayse',95),
(127,'Musatafa Bak', 'Can',99),
(128,'Mustafa Bak','Ali',99),
(129,'Mehmet Bak','Alihan',89);


INSERT INTO notlar VALUES ('123','Kimya',75),
('124','fizik',65),
('125','Tarih',90),
('126','Matematik',90),
('127','Matematik',90),
(null,'Tarih',90);

SELECT * FROM talebeler;
SELECT * FROM notlar;

--- notlar tablosundan id=123 olan kaydi silelim
DELETE FROM notlar WHERE talebe_id=123;

--- talebeler tablosundan id=126 olan kaydi silelim
DELETE FROM talebeler WHERE id=126;

--on delete cascade referans alinann kaydi parentten silmek istedigimizde
-- once child tabledan referans alan satirin kaydini siler,
-- ardindn parentta silme islemini gerceklestirir
-- !! bu özelligi kullanirken dikkat etmek gerekiyor cünkü bizim kontrolumuz disinda iki 
-- datayi siliyor, gerekli olan bir bilgiyi silmedigimizden emin olmaliyiz

DELETE FROM talebeler;
-- FK on delete cascade : önce notlar tablosundan referanslari siler, null olan satir kaldi cünku bagimsiz satir

DELETE FROM notlar;


-- 19 tabloyu SCHEMADAN SILMNE
DROP TABLE talebeler; -- fk silme islemine izin vermedi, cünkü hala tanimli
DROP TABLE talebeler CASCADE; --FK constraintini kaldirir

SELECT * FROM notlar;

DROP TABLE IF EXISTS talebeler1; -- if exists tablo varsa siler yoksa sorguyu atlar

--CREATE TABLE IF NOT EXISTS students; --burda da eger böyle bir tablo yoksa olustur varsa da atla diyoruz

-- 20- IN condition
CREATE TABLE musteriler(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

INSERT INTO musteriler VALUES(10,'Mark','Orange');
INSERT INTO musteriler VALUES(10,'Mark','Orange');
INSERT INTO musteriler VALUES(20,'John','Apple');
INSERT INTO musteriler VALUES(30,'Amy','Palm');
INSERT INTO musteriler VALUES(20,'Mark','Apple');
INSERT INTO musteriler VALUES(10,'Adem','Orange');
INSERT INTO musteriler VALUES(40,'John','Apricot');
INSERT INTO musteriler VALUES(20,'Eddie','Apple');

SELECT * FROM musteriler;

--müsteriler tablosundan ürün ismi ' orange', ' Apple', veya 'Apricot' olan verileri listeleyin
--1. yol;

SELECT *
FROM musteriler
WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot';

--2.yol;

SELECT *
FROM musteriler
WHERE urun_isim IN ('Orange','Apple','Apricot');

--müsteriler tablosundan ürün ismi ' orange', ' Apple', veya 'Apricot' olmayan verileri listeleyin

SELECT *
FROM musteriler
WHERE urun_isim NOT IN ('Orange','Apple','Apricot');


-- 21 BETWEEN .... AND ....KOMUTU
--Müşteriler tablosunda urun_id 20 ile 30(dahil) arasinda olan 
--urunlerin tum bilgilerini listeleyiniz

--1.yol
SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=30;

--2.yol
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 30;   --- between ve and sayilarin dahil oldugu durumlarda kullaniloyr


--Müşteriler tablosunda urun_id 20den küçük veya 
--30dan büyük olan urunlerin tum bilgilerini listeleyiniz

SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 30;   -- yazdigimiz 20 ve 30 dahil


--22-AGGREGATE Fonk.:toplamsal fonk

CREATE TABLE calisanlar3(
	id int,
	isim varchar(50),
	sehir varchar(50),
	maas int,
	isyeri varchar(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');


CREATE TABLE markalar(
marka_id INT UNIQUE, 
marka_isim VARCHAR(20), 
calisan_sayisi INT
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM markalar;
SELECT * FROM calisanlar3;

--calisanlar3 tablosunda max maaşı görüntüleyelim.
SELECT MAX (maas) FROM calisanlar3; 

--calisanlar3 tablosunda min maaşı görüntüleyelim.
SELECT MIN(maas) FROM calisanlar3;

--calisanlar3 tablosunda ortalama maaşı görüntüleyelim.
SELECT AVG(maas) FROM calisanlar3;

SELECT ROUND(AVG(maas),2) FROM calisanlar3;

--calisanlar3 tablosunda toplam maaşı görüntüleyelim.
SELECT SUM(maas) FROM calisanlar3;


--calisanlar3 tablosunda tüm kayıtların sayısını görüntüleyelim.
SELECT COUNT(*) FROM calisanlar3;

--calisanlar3 tablosundaki maaşı 2500 olanların sayısını görüntüleyiniz
SELECT COUNT(*) FROM calisanlar3 WHERE maas=2500;


--23-ALIASES:rumuz/etiket/takma isim:tablo veya sütunlara geçici isim verebiliriz.

CREATE TABLE workers(
calisan_id CHAR(9),
calisan_isim VARCHAR(50),
calisan_dogdugu_sehir VARCHAR(50)
);

SELECT * FROM workers;
--bu sorguda geçici olarak takma isim kullanalım
-- takma isim genelde gercek ismin ilk harfi our
SELECT calisan_id AS id FROM workers AS w;  -- sadece bu sorguda degisti
SELECT calisan_isim isim FROM workers w;  -- takma ismi AS KULLANMADAN yapimi bu sekilde


--24-SUBQUERY--NESTED QUERY
--24-a-SUBQUERY: WHERE ile kullanımı bir sorgunun sonucundan faydalanarak yazmis oldugunuz sorgulardan, 
--sonucundan faydalanmis oldugumuz sorguya alt sorgu SUBQUERY denir ic sorgu denir

--marka_id si 100 olan markada çalışanları listeleyiniz.
SELECT marka_isim FROM markalar WHERE marka_id=100;--Vakko
SELECT * FROM calisanlar3 WHERE isyeri='Vakko';


--dinamik çözüm
SELECT * 
FROM calisanlar3 
WHERE isyeri= (SELECT marka_isim 
			   FROM markalar
			   WHERE marka_id=100)


