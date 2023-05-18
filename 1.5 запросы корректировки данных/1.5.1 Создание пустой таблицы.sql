/*
Задание

Создать таблицу поставка (supply), которая имеет ту же структуру, что и таблиц book.
Поле 	Тип, описание
supply_id 	INT PRIMARY KEY AUTO_INCREMENT
title 	VARCHAR(50)
author 	VARCHAR(30)
price 	DECIMAL(8, 2)
amount 	INT
*/

create table supply(
    supply_id int primary key auto_increment,
    title varchar(50),
    author varchar(30),
    price decimal(8,2),
    amount int
)