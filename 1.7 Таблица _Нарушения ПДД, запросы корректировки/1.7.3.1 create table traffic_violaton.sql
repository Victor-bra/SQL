use sql_lessons;
create table traffic_violation
(
    violation_id int primary key auto_increment,
    violation    varchar(50),
    sum_fine     float(8, 2)
);

insert into traffic_violation(violation, sum_fine)
values ('Превышение скорости(от 20 до 40)', 500.00),
       ('Превышение скорости(от 40 до 60)', 1000.00),
       ('Проезд на запрещающий сигнал', 1000.00);
