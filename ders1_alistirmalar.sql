
-----------------------  DAY'1 NT -----------------------
--1-database oluşturma--DDL
CREATE DATABASE deneme;
--SQL komutlarında büyük/küçük harf duyarsızdır.
--datalarda ve değişken isimlerinde büyük/küçük harf duyarlılığı vardır.
create database deneme2

--2-database silme--DDL
DROP DATABASE deneme;
DROP DATABASE deneme2;-- !bağlantı kapalı olmalı
DROP DATABASE tped_nt;-- !bu db de çalışmıyor olmalısınız 

--3-tablo oluşturma--DDL
CREATE TABLE students(
id CHAR(4),
name VARCHAR(25),
grade REAL,
register_date DATE
);













