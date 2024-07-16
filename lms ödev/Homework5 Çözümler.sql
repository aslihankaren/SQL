dvd_rental veritabanında;
1-Tüm filmleri film adı ve dili ile birlikte  listeleyiniz.
hint:film ve language tablolarını kullanınız.

SELECT film.title, language.name
FROM film
INNER JOIN language ON film.language_id = language.language_id


2-Ödeme miktarı ve müşteri adıyla birlikte en yüksek ödeme yapan müşteriyi bulunuz.
hint:payment ve customer tablolarını kullanınız.

SELECT payment.amount, customer.first_name, customer.last_name
FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
ORDER BY payment.amount DESC
LIMIT 1;

3-Tüm kategorilerin isimlerini ve kategoriye ait film sayısını birlikte  listeleyiniz.
hint:category,film_category tablolarını kullanınız.

SELECT name kategori, COUNT(film_id) film_sayisi 
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY name;

4-customer_id'ye göre en çok film kiralayan müşterilerin ad-soyad ve kiraladığı film sayısını birlikte listeleyiniz.
hint:customer,rental tablolarını kullanınız.


SELECT first_name,last_name,COUNT(rental_id) rental_num
FROM customer c LEFT JOIN rental r ON c.customer_id=r.customer_id
GROUP BY c.customer_id
ORDER BY rental_num DESC 
LIMIT 10;

5-Tüm dilleri dil adı ve dildeki film sayısıyla birlikte listeleyiniz.
hint:film ve language tablolarını kullanınız.


SELECT name,COUNT(f.film_id)
FROM language l
LEFT JOIN film f ON l.language_id = f.language_id
GROUP BY name

6- Tüm personelleri personel adı-soyadı ve personelin yönettiği müşteri sayısıyla birlikte listeleyiniz.
hint:staff ve customer tablolarını kullanınız.

SELECT s.first_name,s.last_name COUNT(customer_id) 
FROM staff s LEFT JOIN customer c ON s.store_id=c.store_id
GROUP BY s.staff_id 

7- En fazla actor oynayan 10 tane filmin ismini ve filmde oynayan actor sayısını bulunuz.
hint:film ve film_actor tablolarını kullanınız.

SELECT title,count(actor_id) actor_num
FROM film f LEFT JOIN film_actor fa ON f.film_id=fa.film_id
GROUP BY title
ORDER BY actor_num DESC
LIMIT 10;

8-Tüm actorlerin ad-soyadını ve oynadığı filmlerin adını birlikte  listeleyiniz.
hint:actor, film_actor, film tablolarını kullanınız.


SELECT actor.first_name, actor.last_name, film.title
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id;

9-emaili 'j' ile başlayan ve soyadı 'er' ile biten müşterileri listeleyiniz. 

SELECT *
FROM customer
WHERE email LIKE 'j%' AND last_name LIKE '%er';

10-İsmi(title) d harfinden sonra e veya a sonrasında ise m veya n içeren ve y harfi ile biten filmlerin isimlerini listeleyiniz.(cevap:Victory Academy,Annie Identity)

SELECT *
FROM film
WHERE title ~* 'd[ea][mn](.*)y$';

11-İsmi c ile başlayan kategorideki filmlerin idlerinden en küçük 5 tanesini listeleyiniz.
hint:category, film_category tablolarını kullanınız.


SELECT film_id FROM film_category
WHERE category_id IN (SELECT category_id FROM category WHERE name ~* '^c')
ORDER BY film_id LIMIT 5;

12-İsmi a ile başlayıp a ile bitmeyen şehir(city) ve bu şehirlerin bulunduğu ismi a ile başlayan
 ülkeleri birlikte listeleyiniz.(örn: Escobar-Argentina)
hint:city, country tablolarını kullanınız.


SELECT city , country FROM city 
LEFT JOIN country ON city.country_id=country.country_id 
WHERE city !~* '^a(.*)a$' AND country !~* 'a$'
