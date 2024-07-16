/*
===>SQL (Structured Query Language), ilişkisel veritabanı yönetim sistemlerinde (RDBMS) veri manipülasyonu, 
sorgulama, tanımlama ve yönetim için kullanılan bir programlama dilidir. 

===> Temel olarak, SQL veritabanında veri eklemek, güncellemek, silmek ve sorgulamak için kullanılır. 

===>Örneğin, veritabanında bir tabloya yeni bir kayıt eklemek, belirli bir kriteri sağlayan kayıtları sorgulamak veya 
veritabanı yapısını tanımlamak için SQL kullanılabilir.

===>Bu sayede veri yönetimi ve analizi gibi işlemler kolaylıkla gerçekleştirilebilir.*/

--->database olusturmak icin; database--> sag tik--> create butonu

--->tablo olusturmak icin; 

create table ogrenciler (
	id int primary key,
	isim varchar(30),
	adres varchar(100),
	sinav_notu integer
);

--->tabloya veri ekleme;
insert into ogrenciler values(1, 'Betul Kuyucu','Istanbul', 80 ); --- tekli ekleme

---> virgülle birden cok ekleyebiliyoruz;
---> burdaki fark tablo isminden sonra (ogrenciler) girecegimiz fieldlari parantez icinde yaziyoruz, sonra asagidaki gibi ekliyoruz
insert into ogrenciler (id,isim,adres, sinav_notu) values
		(2,'Zeki Bey'   ,'Izmir'  , 90),
		(3,'Cemal Dogan','Trabzon', 65),
		(4,'Mirac Gece' , 'Bursa' , 45),
		(5,'Yavuz Bal'  ,'Antalya', 55);
		
insert into ogrenciler (id, isim, sinav_notu) values
		(6,'Bilal Degirmen', 96),
		(7, 'Fahri Ersoz'  , 92);  -->bu sekilde de not null ya da primary key olmayan fieldlari eksik birakabiliriz
		
insert into ogrenciler values(8,'Ahmet Furkan','Ankara',45);

Select* from ogrenciler; -->tablodaki bilgileri görüntülemek icin 

-- SORU1: ogrenciler tablosundaki id ve isim bilgileri ile tum recordlari getirelim :
select id, isim from ogrenciler;


----===>>WHERE KOSUL ISTER, FILTRELER
--> tablolardan veri secerken belirli bir kosulu karsilayan satirlari secmek icin "WHERE" kosulu kullanilir
--WHERE koşulu, SQL sorgularında çeşitli kullanım alanlarına sahiptir. İşte bazı örnekler:

-->1. *Veri Filtreleme:* Belirli bir koşulu sağlayan satırları seçmek için WHERE koşulu kullanılır. 
--Örneğin, belirli bir kriteri karşılayan müşterileri, siparişleri veya ürünleri seçmek için kullanılabilir.

-->2. *Veri Sıralama:* WHERE koşulu, sorgulanan verileri belirli bir sıraya göre filtrelemek için kullanılabilir.
--Örneğin, bir tablodan en yüksek değeri olan satırları veya belirli bir tarihten sonraki kayıtları seçmek için kullanılabilir.

-->3. *Birden Fazla Koşul:* WHERE koşulu, birden fazla koşulu birleştirmek için kullanılabilir. 
--AND, OR ve NOT gibi mantıksal operatörlerle birlikte kullanılarak karmaşık koşullar oluşturulabilir.

-->4. *Aritmetik İşlemler:* WHERE koşulu, aritmetik işlemler kullanılarak sorgulanabilir. 
--Örneğin, bir tablodaki sayısal değerlerin belirli bir aralıkta olup olmadığını kontrol etmek 
--için aritmetik işlemlerle WHERE koşulu oluşturulabilir.

-->5. *NULL Değerlerin Filtrelenmesi:* WHERE koşulu, NULL değerlere sahip veya
--olmayan satırları seçmek için kullanılabilir. 
--Örneğin, bir tablodan NULL olmayan telefon numaralarını seçmek için WHERE koşulu kullanılabilir.

-->Bu örnekler, WHERE koşulunun farklı kullanım alanlarını göstermektedir. 
--SQL sorgularında WHERE koşulunu kullanarak verileri istenen şekilde filtrelemek ve işlemek mümkündür.




-- SORU2: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listele  
select * from ogrenciler where sinav_notu>80;

-- SORU3: Adresi Ankara olan ogrencilerin tum bilgilerini listele
select * from ogrenciler where adres='Ankara';

----====>AND OPERATÖRÜ
--->AND OPERATÖRÜ birden fazla kosulu birlestirmek icin kullanilan mantiksal bir operatördür
---> WHERE kosulu ile kullanildiginda, AND OPERATÖRÜ her iki kosulun da dogru olmasi durumunda bir satiri secer
--===>AND operatörü, SQL sorgularında birden fazla koşulu birleştirmek için kullanılır ve 
--geniş bir kullanım alanına sahiptir. İşte bazı yaygın kullanım alanları:

--==>1. *Çoklu Koşulların Birleştirilmesi:* Birden fazla koşulu aynı sorguda kullanarak verileri daha spesifik olarak filtrelemek için kullanılır. 
--Örneğin, bir müşteri tablosundan hem belirli bir şehirde hem de belirli bir durumda olan müşterileri seçmek için kullanılabilir.

--==>2. *Alt Küme Seçimi:* Bir tablodan birden fazla kriteri sağlayan veri alt kümelerini seçmek için kullanılabilir. 
--Örneğin, belirli bir tarihte yapılan ve belirli bir ürünü satın alan müşterileri seçmek için kullanılabilir.

--==>3. *İlişkisel Veri Tabanlarında Kullanımı:* İlişkisel veri tabanlarında, 
--ilişkili tablolardan veri çekmek ve ilişkili koşulları birleştirmek için kullanılabilir. 
--Örneğin, bir müşteri tablosundan belirli bir bölgede yaşayan ve belirli bir ürünü satın alan müşterileri seçmek için kullanılabilir.

-- SORU4: Sinav notu 80 ve adresi Istanbul olan ogrenci ismini listele
select isim from ogrenciler where adres='Istanbul' and sinav_notu=80

----===>Tabloları sorgularken, SQL'de "OR" operatörü, birden fazla koşulun yerine getirilmesi gerektiğinde kullanılır. 
--"OR" operatörü, bir sorgu ifadesinde birden fazla koşulu belirtmek için kullanılan bir bağlaçtır.
--Özetle, "OR" operatörü, sorgulanan verilerin bir koşuldan veya diğer koşuldan herhangi birini karşılaması durumunda 
--sonucun doğru olacağını belirtmek için kullanılır. Örneğin:
sql
SELECT * FROM customers
WHERE country = 'USA' OR country = 'Canada';
--Bu sorgu, "customers" tablosundan, ya 'USA' ya da 'Canada' ülkesine sahip müşterileri seçer.
---==>Tabloları sorgularken "OR" operatörü çeşitli durumlarda kullanılabilir:

--1. Birden fazla koşulun karşılanması gerektiğinde: Bir sorgu ifadesinde birden fazla koşulu belirtmek ve
--bu koşullardan herhangi birinin doğru olması durumunda sonucun döndürülmesi gerektiğinde "OR" operatörü kullanılır.

--2. Alternatif koşulların kontrol edilmesi: Belirli bir kritere uyan kayıtları döndürmek 
--için alternatif koşulların kontrol edilmesi gerektiğinde "OR" operatörü kullanılır.

--3. Farklı sorgu sonuçlarını birleştirme: İki veya daha fazla sorgunun sonuçlarını birleştirmek ve 
--tek bir sonuç kümesi olarak döndürmek için "OR" operatörü kullanılabilir.

--4. Kapsamlı filtreleme: Veritabanındaki verileri kapsamlı bir şekilde filtrelemek ve 
--belirli kriterlere uygun olan kayıtları seçmek için "OR" operatörü kullanılabilir. 
--Bu, çoklu filtreleme senaryolarında yaygın olarak kullanılır.

--Bu durumlar, "OR" operatörünün sıklıkla kullanıldığı bazı yaygın senaryolardır, 
--ancak kullanımı sorgulamanın gereksinimlerine bağlı olarak değişebilir.



-- SORU5: Sinav notu 55 veya 100 olan ogrencilerin tum bilgilerini listele
select * from ogrenciler where sinav_notu=55 or sinav_notu=100;
select * from ogrenciler where sinav_notu in(55,100,90,45);


---===>Evet, "IN" operatörü SQL'de kullanılan bir koşul operatörüdür.
--Bu operatör, bir sorguda belirli bir değer kümesi içinde bir eşleşme yapmak için kullanılır.
--"IN" operatörü, bir alanın bir dizi değerle eşleşip eşleşmediğini kontrol etmek için kullanılır. Örneğin:
sql
SELECT * FROM products
WHERE category_id IN (1, 3, 5);


--Bu sorgu, "products" tablosundan, "category_id" alanı 1, 3 veya 5 olan ürünleri seçer.
--Bu şekilde, birden fazla değeri içeren bir liste üzerinde filtreleme yapmak mümkün olur.
--Tabloları sorgularken "IN" operatörü çeşitli kullanım alanlarına sahiptir:

--1. *Birden fazla değerle filtreleme yapma*: Bir alanın birden fazla değerle eşleşip eşleşmediğini --
--kontrol etmek için "IN" operatörü kullanılır. Örneğin, belirli bir kategoriye veya departmana sahip olan ürünleri seçmek için kullanılabilir.

sql
SELECT * FROM products
WHERE category_id IN (1, 3, 5);


--2. *Alt sorgularla kullanım*: Bir alt sorgu kullanarak "IN" operatörü, başka bir sorgudan elde edilen 
--sonuç kümesiyle bir alanı karşılaştırmak için kullanılabilir. 
--Örneğin, bir alt sorgu kullanarak bir alt küme oluşturabilir ve bu alt kümedeki 
--değerlerle eşleşen kayıtları seçmek için "IN" operatörünü kullanabilirsiniz.

sql
SELECT * FROM customers
WHERE country IN (SELECT country FROM suppliers WHERE region = 'North America');


--3. *Sabit değerlerle kullanım*: Belirli bir liste veya sabit değerler kümesiyle eşleşen kayıtları seçmek 
--için "IN" operatörü kullanılabilir. Örneğin, belirli bir şehirdeki müşterileri seçmek için kullanılabilir.

sql
SELECT * FROM customers
WHERE city IN ('New York', 'Los Angeles', 'Chicago');


--Bu örnekler, "IN" operatörünün farklı kullanım alanlarını göstermektedir. 
--Bu operatör, belirli değerlerin bir listesini karşılaştırmak ve sorgu sonuçlarını bu değerlerle eşleştirmek
--için kullanışlı bir araçtır.




-- SORU6: Sinav notu 65 ve 85 arasinda(between) olan ogrencilerin tum bilgilerini listele
select * from ogrenciler where sinav_notu between 65 and 85;
--===>BETWEEN 
--"Between" operatörü, SQL'de belirli bir aralık içindeki değerleri seçmek için kullanılan
--bir koşul operatörüdür. Bu operatör, bir alanın bir alt ve üst sınırlar arasında belirtilen 
--bir değer aralığında olup olmadığını kontrol etmek için kullanılır. 
--Genellikle "WHERE" ifadesi içinde kullanılır.

--Örneğin:

sql
SELECT * FROM products
WHERE price BETWEEN 10 AND 50;


--Bu sorgu, "products" tablosundan "price" alanı 10 ile 50 arasında olan ürünleri seçer.

--"Between" operatörü, belirli bir aralıktaki değerleri seçmek için sıklıkla kullanılır ve 
--okunması kolay ve anlaşılır bir koşul sağlar.


--"Between" operatörü, SQL'de çeşitli kullanım alanlarına sahiptir:

--1. *Sayısal veya tarih aralıklarını filtreleme*: En yaygın kullanım alanı,
--sayısal veya tarih alanlarında belirli bir aralıktaki değerleri filtrelemektir.
--Örneğin, bir ürünün fiyatının belirli bir aralıkta olup olmadığını kontrol etmek için kullanılabilir.

sql
SELECT * FROM products
WHERE price BETWEEN 10 AND 50;


--2. *Tarih aralıklarını belirleme*: Tarih alanlarında "Between" operatörü, 
--belirli bir zaman aralığındaki tarihleri seçmek için kullanılabilir. 
--Örneğin, bir rezervasyon tablosundan belirli bir tarih aralığındaki rezervasyonları seçmek için kullanılabilir.

sql
SELECT * FROM reservations
WHERE reservation_date BETWEEN '2024-03-01' AND '2024-03-15';


--3. *Metinsel aralıkları belirleme*: Metinsel alanlarda da "Between" operatörü kullanılabilir. 
--Örneğin, bir ürünün adının belirli bir alfabetik aralıkta olup olmadığını kontrol etmek için kullanılabilir.

sql
SELECT * FROM products
WHERE product_name BETWEEN 'A' AND 'M';

--"Between" operatörü, belirli bir aralıktaki değerleri seçmek için kullanışlı bir araçtır ve 
--SQL sorgularını daha okunaklı hale getirir.

-- SORU7: id'si 3 ve 5 arasinda olmayan ogrencilerin isim ve sinav notu listele
select id,isim, sinav_notu from ogrenciler where id not between 3 and 5;

-- SORU8: En yuksek sinav puani nedir
select max(sinav_notu) from ogrenciler;

-- SORU9: Izmir'de yaşayan ve sınav notu 50'den yuksek olan öğrencilerin listesi:
select * from ogrenciler where sinav_notu>50 and adres='Izmir'

-- SORU10: Öğrenci sayısı ve ortalama sınav notu:
select count(*), Round (avg(sinav_notu),2) from ogrenciler;
-- round: kullanimi ondalikli kismi yuvarlamak icin
-- count saymak icin

-- SORU11: sinav_notu 55 olan satiri siliniz
delete from ogrenciler where sinav_notu=55;

-- SORU12: ismi Derya Soylu veya Cemal Dogan olan satirlari siliniz
delete from ogrenciler where isim='Derya Soylu' or isim='Cemal Dogan';
-- 2. yol;
delete from ogrenciler where in('Derya Soylu', 'Cemal Dogan');

-- SORU13 : Ogrenciler tablosunun icerigini siliniz
delete from ogrenciler;  -- tek tek siliyor
truncate table ogrenciler; --tablonun tamamini bosaltiyor

-- SORU14 : Ogrenciler Tablosunu siliniz
drop table ogrenciler;

