use sql_lessons;
create table fine
(
    fine_id int primary key auto_increment,
    name    varchar(30),
    number_plate varchar(6),
    violation varchar(50),
    sum_fine float(8,2),
    data_violation date,
    date_payment date
);
/*Создать таблицу fine следующей структуры:

Поле	Описание
fine_id	ключевой столбец целого типа с автоматическим увеличением значения ключа на 1
name	строка длиной 30
number_plate	строка длиной 6
violation	строка длиной 50
sum_fine	вещественное число, максимальная длина 8, количество знаков после запятой 2
date_violation	дата
date_payment	дата*/