DROP DATABASE IF EXISTS HW_2;
CREATE DATABASE HW_2;
USE HW_2;

/*Задание № 1*/
-- создание таблицы 'sales'
DROP TABLE IF exists sales;
CREATE TABLE sales(
id SERIAL PRIMARY KEY,
order_date DATE NOT NULL,
count_product INT
);

-- наполнение данными 
INSERT INTO `sales`(order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

/*2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ*/
-- добавление столбца в таблицу
ALTER TABLE sales 
ADD COLUMN type_order CHAR (45);

-- присвоение категории заказу в зависимости от количества
UPDATE sales SET type_order="Маленький заказ" WHERE count_product < 100;
UPDATE sales SET type_order="Средний заказ" WHERE count_product > 100 and count_product < 300;
UPDATE sales SET type_order="Большой заказ" WHERE count_product > 300;

/* 3.Создайте таблицу “orders”, заполните ее значениями
 * Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
 */
-- создание таблицы 'orders'
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
id SERIAL PRIMARY KEY,
employee_id VARCHAR(10),
amount DECIMAL(5,2),
order_status ENUM ('OPEN', 'CLOSED', 'CANCELLED')
);

-- Наполняем сущность 'orders' данными:
INSERT INTO orders (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');



SELECT
id,
employee_id,
amount,
CASE order_status
	WHEN 'OPEN' THEN 'Order is in open state'
	WHEN 'CLOSED' THEN 'Order is closed'
	WHEN 'CANCELLED' THEN 'Order is cancelled'
	ELSE 'Не указана'
END AS full_order_status
FROM orders;

	/*
	 4.  Чем 0 отличается от NULL?
	 разница в том, что 0 может быть результатом арифметической операции, в то время как NULL говорит о том, что значение просто не было указано.
	 "0", пустая строка, это то же значение. NULL же обозначает отсутствие значения.

/*
