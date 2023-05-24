-- создаём базу данных
DROP DATABASE IF EXISTS HW_1_phones;
CREATE DATABASE HW_1_phones;
USE HW_1_phones;



SELECT * FROM hw_1_phones.mobile_phones;

/* Задача 2
Выведите название, производителя и цену для товаров, количество
которых превышает 2
*/
USE mobile_phones;
SELECT product_name, manufacturer, price 
FROM mobile_phones
WHERE product_count > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
USE HW_1_phones;
SELECT * 
FROM mobile_phones
WHERE manufacturer = 'Samsung';

/* С помощью регулярных выражений найти:
4.1. Товары, в которых есть упоминание "Iphone"*/
USE HW_1_phones;
SELECT * 
FROM mobile_phones
WHERE product_name REGEXP 'Iphone';

/* С помощью регулярных выражений найти:
4.2. Товары, в которых есть упоминание "Samsung"*/
USE HW_1_phones;
SELECT * 
FROM mobile_phones 
WHERE manufacturer REGEXP 'Samsung';

/* С помощью регулярных выражений найти:
4.3. Товары, в которых есть ЦИФРЫ*/
USE HW_1_phones;
SELECT * 
FROM mobile_phones 
WHERE product_name REGEXP '[0-9]';

/* С помощью регулярных выражений найти:
4.4. Товары, в которых есть ЦИФРА "8"*/
USE HW_1_phones;
SELECT * 
FROM mobile_phones 
WHERE product_name REGEXP '8';


