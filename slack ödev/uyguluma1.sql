CREATE TABLE tablo(
	id serial,
	isim varchar(50),
	yas int,
	maas int,
	email varchar(50)
)


INSERT INTO tablo VALUES (1, 'Ali', 39, 12500,'ali@gmail.com' ),

(2, 'Derya', 28  , 15000  ,'derya@yahoo.com' ),
(3, 'Sevim', 24  , 25000  ,'sevim@yahoo.com' ),
(4, 'Yusuf', 32  , 18000  ,'yusuf@yahoo.com' ),
(5, 'Halil', 48  , 22000  ,'halil@yahoo.com' ),
(6, 'Ece'  , 54  , 21000  ,'ece@yahoo.com'   ),
(7, 'Can'  , 38  , 19000  ,'can@yahoo.com'   ),
(8, 'Elif' , 27  , 14000  ,'elif@yahoo.com'  ),
(9, 'Ezgi' , 35  , 21000  ,'ezgi@yahoo.com'  );

-- 1) Tablo bilgilerini listeleyiniz.
SELECT * FROM tablo;


-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
SELECT isim,yas,maas FROM tablo;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
SELECT * FROM tablo WHERE id=8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
SELECT isim,yas,email FROM tablo WHERE id=5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE yas>30;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
SELECT * FROM tablo  WHERE  maas<>21000;

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE isim LIKE 'A%';

-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE isim LIKE '%n';

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE isim LIKE 'gmail%';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE isim NOT LIKE 'gmail%';

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE id IN (3,5,7,9);

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE yas NOT IN (39,48,54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE yas BETWEEN 30 AND 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE yas NOT BETWEEN 30 AND 40;

-- 15) emaili olmayan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE email IS NULL OR email='';

-- 16) emaili olan personel bilgilerini listeleyiniz.
SELECT * FROM tablo WHERE email  IS NOT NULL OR email<>'';

-- 17) personel bilgilerini yaşa göre sıralayınız.
SELECT * FROM tablo ORDER BY yas;

-- 18) personel bilgilerini maaşa göre sıralayınız.
SELECT * FROM tablo ORDER BY maas;

-- 19) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
SELECT * FROM tablo ORDER BY yas DESC;

-- 20) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
SELECT * FROM tablo ORDER BY maas DESC;

-- 21) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
SELECT * FROM tablo ORDER BY maas DESC LIMIT 3;
