CREATE DATABASE sqlpractice_db;

CREATE TABLE musteri(
	musteri_no SERIAL PRIMARY KEY,
      isim CHAR (50),
      yas INTEGER CHECK (yas>18),
      cinsiyet CHAR(1),         
      gelir REAL,
      meslek CHAR (20),
      sehir CHAR (20)
	);
	
	INSERT INTO musteri (isim,yas,cinsiyet,gelir,meslek,sehir)VALUES 
('Ali',		35,	'E', 2500, 'Mühendis' ,   'Istanbul'),
('BURAK',   25, 'E', 3500, 'MİMAR'    ,   'İZMİR'   ),
('CEYHUN',  45, 'E', 2000, 'MÜHENDİS' ,   'ANKARA'  ),
( 'DEMET',  30,	'K', 3000, 'ÖĞRETMEN' ,   'ANKARA'  ),
('FERHAT',  40, 'E', 2500, 'MİMAR'    ,   'İZMİR'   ),
('GALİP',   55, 'E', 4000, 'ÖĞRETMEN' ,   'İSTANBUL'),
('KÖKSAL',  25, 'E', 2000, 'AVUKAT'   ,   'İZMİR'   ),
('LEYLA',   60, 'K', 2500, 'MİMAR'    ,   'İSTANBUL'),
('MELEK',   30, 'K', 2500, 'ÖĞRETMEN' ,   'İSTANBUL'),
('JALE',    40, 'K', 6000, 'İŞLETMECİ',   'ANKARA'  ),
('TEKİN',   45, 'E', 2000, 'AVUKAT'   ,   'ANKARA'  ),
('SAMET',   20, 'E', 3000, 'MİMAR'    ,   'İSTANBUL'),
('ŞULE',    20, 'K', 4500, 'ÖĞRETMEN' ,   'İSTANBUL'),
('VELİ',    40, 'E', 2500, 'ÖĞRETMEN' ,   'İZMİR'   ),
('ZEYNEP',  50, 'K', 3500, 'TESİSATÇI',   'İZMİR'   ),
('ARDA',    55, 'E', 2000, 'KUAFÖR'   ,   'İZMİR'   ),
('MELİS',   30, 'K', 3000, 'KUAFÖR'   ,   'ANKARA'  );


SELECT * FROM musteri;

SELECT isim,meslek FROM musteri;

CREATE TABLE sehirler(
	alan_kodu INTEGER PRIMARY KEY,
	isim CHAR(25)NOT NULL ,
	nufus INTEGER
);

--2.yol
CREATE TABLE sehirler(
alan_kodu INT,
isim VARCHAR(50) NOT NULL,
nufus INT,
CONSTRAINT alan_kodu_pk PRIMARY KEY(alan_kodu)	
);




CREATE TABLE tedarikciler3(
tedarikci_id CHAR PRIMARY KEY,	
tedarikci_ismi	VARCHAR(50),
iletisim_isim	VARCHAR(50) UNIQUE
);

CREATE TABLE urunler(
tedarikci_id char,
	urun_id varchar(50),
constraint tedarikci_fk foreign key (tedarikci_id ) references tedarikciler3 (tedarikci_id)
);




