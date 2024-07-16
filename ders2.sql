----------------day'2 NT ------------------------
---4 tabloya tüm fieldlariyla data ekleme
INSERT INTO students VALUES('1001', 'Sherlock Holmes', 99.9, '2024-03-08');
INSERT INTO students VALUES('1002', 'Harry Potter',98,now());

---5 data okuma/ cekme 
---a- tablodan tüm satirlari tüm sütunlarla birlikte okuma
SELECT * FROM students;

---b- tablodan tüm satirlari bazi sütunlarla birlikte okuma
SELECT name, grade FROM students;

--6- tabloya belirli fieldlara data ekleme
INSERT INTO students(name, grade) VALUES('Jack Sparrow', 95.5);

--7- mevcut tabloyu kullanarak yeni bir tablo olusturabilirz
CREATE TABLE grades AS SELECT name, grade FROM students;
SELECT *FROM grades;

--8- tabloyu silme
DROP TABLE grades;

--9 bir tabloya UNIQUE constrainti ekleme;
CREATE TABLE programmers(
id SERIAL, -- unique olmasini garanti etmez
name VARCHAR(20),
email VARCHAR(50) UNIQUE,
prog_lang VARCHAR(20)
);

INSERT INTO programmers(name,email,prog_lang) VALUES('Abdullah ','mail@mail.com','php');
--INSERT INTO programmers(name,email,prog_lang) VALUES('Asli','mail@mail.com','java'); --- mail hatali
INSERT INTO programmers(name,email,prog_lang) VALUES('Asli','devmail@mail.com','java');
INSERT INTO programmers(name,prog_lang) VALUES('Ali Bey','python');
SELECT * FROM programmers;

-- 10 -- tabloda bir sütuna NOT NULL ekleme;
CREATE TABLE doctors(
id SERIAL,
name VARCHAR8(20)
salary REAL NOT NULL,
email VARCHAR(50)UNIQUE
);

INSERT INTO doctors (name, salary, email)VALUES ('Gregory House', 5000, 'dr@gmail.com')

INSERT INTO doctors (name, salary, email)VALUES ('Dr. Strange','doctor@gmail.com')




--11-tabloya PK ekleme
CREATE TABLE students2(
id INTEGER PRIMARY KEY,--not null,unique,başka bir tablo ile ilişkindirmek için kullanılacak
name VARCHAR(20),
grade REAL,
register_date DATE	
);

SELECT * FROM students2;

--11-tabloya PK ekleme:2. yöntem
CREATE TABLE students3(
id INTEGER,
name VARCHAR(20),
grade REAL,
register_date DATE,
CONSTRAINT std_pk PRIMARY KEY(id)
--CONSTRAINT ile kısıtlamaya özel isim verilebilir, zorunlu değil	
);

SELECT * FROM students3;

--composite key ekleme
CREATE TABLE students4(
id INTEGER,
name VARCHAR(20),
grade REAL,
register_date DATE,
CONSTRAINT std4_pk PRIMARY KEY(id,name)
);

SELECT * FROM students4;

--12-tabloya FK  ekleme
CREATE TABLE courses(
course_id INTEGER,
course_name VARCHAR(20),
credit INTEGER,	
student_id INTEGER,--bu sütuna FK eklenmeli:buradaki değerler PK sütunundab ref alınacak 
CONSTRAINT course_fk FOREIGN KEY(student_id) REFERENCES students2(id)	
);

