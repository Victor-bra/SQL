use sql_lessons;
create table payment
(
    payment_id int primary key auto_increment,
    name    varchar(30),
    number_plate varchar(6),
    violation varchar(50),
    data_violation date,
    date_payment date
);
/*В таблицу fine первые 5 строк уже занесены. Добавить в таблицу записи с ключевыми значениями 6, 7, 8.*/
insert into payment(name, number_plate, violation, data_violation, date_payment)
values ('Яковлев Г.Р.', 'М701АА', 'Превышение скорости(от 40 до 60)', '2020-01-12', '2020-01-22'),
       ('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', '2020-02-14', '2020-03-06'),
       ('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', '2020-03-03', '2020-03-23');