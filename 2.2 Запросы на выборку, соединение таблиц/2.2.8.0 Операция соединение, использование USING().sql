create table supply(
    supply_id int primary key auto_increment,
    title varchar(50),
    author varchar(50),
    price DECIMAL(8,2),
    amount int
);
insert into supply(title, author, price, amount)
values ( 'Доктор Живаго', 'Пастернак Б.Л.', 618.99,3),
       ('Черный человек', 'Есенин С.А.', 570.20,6),
       ('Евгений Онегин', 'Пушкин А.С.', 440.80,5),
       ('Идиот', 'Достоевский Ф.М.', 360.80,3);