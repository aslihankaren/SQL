----------------------- DAY 5-------------------
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum 
--ve min maaşını listeleyen bir Sorgu yaziniz.
SELECT marka_isim, calisan_sayisi, (SELECT MAX(maas)FROM calisanlar3 WHERE isyeri=marka_isim) max_maas,
								   (SELECT MIN(maas) FROM calisanlar3 WHERE isyeri=marka_isim) min_maas
FROM markalar


--25-EXISTS Cond.
-- =,!=(<>),<,>,...,AND,OR,BETWEEN..AND..,IN...
--Bir SQL sorgusunda alt sorgunun sonucunun boş olup olmadığını kontrol etmek için kullanılır.
--Eğer alt sorgu sonucu boş değilse, koşul sağlanmış sayılır ve sorgunun geri kalanı işletilir.
--Alt sorgu en az bir satır döndürürse sonucu EXISTS doğrudur.
--Alt sorgunun satır döndürmemesi durumunda, sonuç EXISTS yanlıştır.

CREATE TABLE mart(
urun_id INT,
	musteri_isim VARCHAR(50),
	urun_isim VARCHAR(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE nisan (     
urun_id INT ,
musteri_isim VARCHAR(50),
urun_isim VARCHAR(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

--Mart ayında 'Toyota' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.
SELECT *
FROM nisan
WHERE EXISTS (SELECT * FROM mart WHERE urun_isim='Toyota');

--Mart ayında 'Volvo' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.

SELECT * 
FROM nisan
WHERE EXISTS (SELECT * FROM mart WHERE urun_isim='Volvo' );

--Mart ayında 'fORD' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.

SELECT *
FROM nisan 
WHERE EXISTS (SELECT * FROM mart WHERE urun_isim='Ford');

--Mart ayında satılan ürünün urun_id ve musteri_isim'lerini, 
--eğer Nisan ayında da satılmışsa, listeleyen bir sorgu yazınız. 

SELECT urun_id,musteri_isim
FROM mart AS m
WHERE EXISTS (SELECT * FROM nisan AS n WHERE n.urun_isim = m.urun_isim );

SELECT urun_id,musteri_isim
FROM mart 
WHERE EXISTS (SELECT * FROM nisan WHERE nisan.urun_isim = mart.urun_isim );



---Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız

SELECT urun_isim, musteri_isim 
FROM  nisan 
WHERE EXISTS(SELECT * FROM mart WHERE mart.urun_isim=nisan.urun_isim);

--ÖDEV: Martta satılıp Nisanda satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--MART ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
SELECT urun_isim, musteri_isim FROM mart WHERE NOT EXISTS (SELECT * FROM nisan  WHERE nisan.urun_isim=mart.urun_isim);



--CREATE:INSERT
--READ:SELECT
--UPDATE:UPDATE .. SET==> atamak degistirmek demek
--DELETE:DELETE,TRUNCATE


--26-UPDATE tablo_adı SET sütunadı=yeni değer 
   --WHERE koşul -- koşulu sağlayan kayıtlar güncellenir


CREATE TABLE calisanlar4 (
id INT UNIQUE, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas INT, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar4 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar4 VALUES(345678901, null, 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar4 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar4 VALUES(678901234, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(789012345, 'Fatma Yasa', null, 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(890123456, null, 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(901234567, 'Ali Han', null, 2500, 'Vakko');


--idsi 123456789 olan çalışanın isyeri ismini 'Trendyol' olarak güncelleyeniz.


UPDATE calisanlar4
SET isyeri='Trendyol'
WHERE id=123456789;

-- id’si 567890123 olan çalışanın ismini 'Veli Yıldırım' ve 
--sehirini 'Bursa' olarak güncelleyiniz.

UPDATE calisanlar4
SET isim='Veli Yildirim', sehir='Bursa'
WHERE id=567890123

--- virgüllerle birden fazla bilgi güncellenebilir

--  markalar tablosundaki marka_id değeri 102 ye eşit veya
--büyük olanların marka_id’sini 2 ile çarparak değiştiriniz.

UPDATE markalar
SET marka_id=marka_id*2
WHERE  marka_id>=102

-- markalar tablosundaki tüm markaların calisan_sayisi değerlerini marka_id ile toplayarak güncelleyiniz.
UPDATE markalar
SET calisan_sayisi=calisan_sayisi+marka_id

--calisanlar4 tablosundan Ali Seker’in isyerini,
--567890123 idli çalışanın isyeri ismi ile güncelleyiniz.

UPDATE calisanlar4
SET isyeri=(SELECT isyeri FROM calisanlar4 WHERE id=567890123)
WHERE isim='Ali Seker';


--calisanlar4 tablosunda maasi 1500 olanların isyerini, markalar tablosunda
--marka_id=101 olan markanın ismi ile değiştiriniz.
UPDATE calisanlar4
SET isyeri = (SELECT marka_isim FROM markalar WHERE marka_id=101 )
WHERE maas=1500;

--calisanlar4 tablosundaki isyeri 'Vakko' olanların sehir bilgisinin sonuna ' Şubesi' ekleyini

UPDATE calisanlar4
SET sehir=sehir || ' Subesi'
WHERE isyeri='Vakko';

-- alternatif

UPDATE calisanlar4
SET sehir=sehir CONCAT (sehir, ' Subesi')
WHERE isyeri='Vakko';

-- null da da kullaniliyor concat

select * from markalar;
SELECT * FROM calisanlar4;


--27-IS NULL condition  
--calisanlar4 tablosunda isim sütunu null olanları listeleyiniz.

SELECT * 
FROM calisanlar4
WHERE isim IS NULL;

--calisanlar4 tablosunda isim sütunu null olmayanları listeleyiniz.

SELECT * 
FROM calisanlar4
WHERE isim IS NOT NULL;


--calisanlar4 tablosunda isim sütunu null olanların isim değerini 
--'MISSING...' olarak güncelleyiniz..

UPDATE calisanlar4
SET isim='MISSING...'
WHERE isim IS NULL

--28-ORDER BY:kayıtları belirli bir fielda göre azalan/artan şekilde sıralamamızı sağlar.
--VARSAYILAN olarak ASC(natural-artan-doğal) olarak sıralar
DROP TABLE person;

CREATE TABLE person
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);

INSERT INTO person VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO person VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO person VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO person VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO person VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO person VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
INSERT INTO person VALUES(256789018, 'Samet','Bulut', 'Izmir'); 
INSERT INTO person VALUES(256789013, 'Veli','Cem', 'Bursa'); 
INSERT INTO person VALUES(256789010, 'Samet','Bulut', 'Ankara'); 

SELECT * FROM person;

--person tablosundaki tüm kayıtları adrese göre (artan) sıralayarak listeleyiniz.
SELECT * 
FROM person
ORDER BY adres;
--default:ASC,artan,A-Z-- AYNI ISIMLERDE EKLEME SIRASINA GÖRE ALIYOR

--alternatif
SELECT * 
FROM person
ORDER BY adres ASC; -- ascending

--person tablosundaki tüm kayıtları soyisim göre (azalan)
--sıralayarak listeleyiniz.
SELECT * 
FROM person
ORDER BY soyisim DESC; --descending:Z_A


--person tablosundaki soyismi Bulut olanları isime göre (artan) sıralayarak listeleyiniz.
SELECT * 
FROM person
WHERE soyisim='Bulut'
ORDER BY isim ASC

--alternatif
SELECT * 
FROM person
WHERE soyisim='Bulut'
ORDER BY 2 ASC--not recommended:tavsiye edilmez, index degisebilir

--person tablosundaki tüm kayıtları isme göre (azalan),soyisme göre artan sıralayarak listeleyiniz.

SELECT * 
FROM person
ORDER BY isim DESC, soyisim ASC

--İsim ve soyisim değerlerini, soyisim kelime uzunluklarına göre sıralayarak listeleyiniz.

SELECT isim,soyisim, LENGTH(soyisim) AS karakter_sayisi
FROM person
ORDER BY LENGTH(soyisim) ASC
-- selectten sonra görmek istediklerimizi yaziyoruz


--Tüm isim ve soyisim değerlerini aralarında bir boşluk ile aynı sutunda çağırarak her bir isim ve 
--soyisim değerinin toplam uzunluğuna göre sıralayınız.


SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim
FROM person
ORDER BY LENGTH(isim)+LENGTH(soyisim)
--
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim
FROM person
ORDER BY LENGTH(CONCAT(isim,' ',soyisim)) 
-- length alias i kabul etmiyor
-- order by alias i kabul ediyor


--calisanlar4 tablosunda maaşı ortalama maaştan yüksek olan çalışanların
--isim,şehir ve maaşlarını maaşa göre artan sıralayarak listeleyiniz.

SELECT isim,sehir,maas
FROM calisanlar4
WHERE maas > (SELECT AVG(maas) FROM calisanlar4)
ORDER BY maas ASC;








