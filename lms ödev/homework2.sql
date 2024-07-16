--------------- homework 2----------------------
--1-musteri tablosundaki tüm kayıtları listeleyiniz.
select * from musteri;

--2-Mesleği AVUKAT olanların sadece şehirlerini listeleyiniz.
select sehir 
from musteri  
where meslek ='AVUKAT';

--3-Kadın müşterilerin tüm bilgilerini listeleyiniz.
select * from musteri where cinsiyet='K';

--4-Kadın müşterilerin sadece şehir bilgilerini listeleyiniz.
select sehir from musteri where cinsiyet='K';

--5-Yaşı 40-50 arasında olan müşterileri listeleyiniz.
select * from musteri where yas>40 and yas<50;

--6-Erkek müşterilerin mesleklerini listeleyiniz.
select meslek from musteri where cinsiyet='E';

--7-Yaşı 40-50 arasında OLMAYAN müşterileri listeleyiniz.
select * from musteri  where not yas >40 and yas <50;

--8-Yaşı 30-40 arasında olan KADIN müşterilerden ÖĞRETMENLERİ listeleyiniz.
select *
from musteri 
where yas between 30 and 40 
						and cinsiyet='K' 
						and meslek='ÖĞRETMEN';
						

--9-Yaşı 30-40 arasında OLMAYAN ERKEK müşterilerden AVUKAT OLMAYANLARI listeleyiniz.
select * 
from musteri
where yas not between 30 and 40
		  and cinsiyet='E'
		  and meslek <> 'AVUKAT';

--10-Geliri 3000-5000 arasında olan müşterileri listeleyiniz.
select * from musteri where gelir>3000 and gelir<5000;
--2. yol:
SELECT *
FROM musteri
WHERE gelir BETWEEN 3000 AND 5000;



--11-ismi ALİ olan kayıtları siliniz.
delete from musteri where isim='Ali';

--12-yaşı 60 olan kayıtları siliniz.
delete from musteri where yas='60';

--13-mesleği 'KUAFÖR' ve cinsiyeti 'K' olan kullanıcıyı siliniz.
delete from musteri where cinsiyet='K' and meslek='KUAFÖR';

--14-geliri 6000 olan veya mesleği 'TESİSATÇI' olan kayıtları siliniz.
delete from musteri where meslek='TESİSATÇI' and gelir=6000;

--15-musteri tablosundaki tüm kayıtları siliniz.
delete from musteri;


--16-tedarikciler3 tablosunu SCHEMADAN kaldırınız.
drop table if exists tedarikciler3;   ---===> if exists varsa demek
DROP TABLE IF EXISTS tedarikciler3;

--17-urunler tablosunu SCHEMADAN kaldırınız. 
DROP TABLE IF EXISTS urunler;
 
										