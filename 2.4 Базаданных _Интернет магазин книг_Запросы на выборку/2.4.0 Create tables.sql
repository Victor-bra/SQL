create schema 2_4;

use 2_4;

create table author(
    author_id int primary key auto_increment,
    name_author varchar(50)
);

insert into author(name_author)
values ('Булгаков М.А.'),
       ('Достоевский Ф.М.'),
       ('Есенин С.А.'),
       ('Пастернак Б.Л.'),
       ('Лермонтов М.Ю.');

create table genre(
    genre_id int primary key auto_increment,
    name_genre varchar(30)
);

insert into genre(name_genre)
values ('Роман'),
       ('Поэзия'),
       ('Приключения');

create table book(
    book_id int primary key auto_increment,
    title varchar(50),
    author_id int not null,
    genre_id int,
    price decimal(8,2),
    amount int,
    foreign key (author_id) references author(author_id) on delete cascade,
    foreign key (genre_id) references  genre(genre_id) on delete cascade
);

insert into book(title, author_id, genre_id, price, amount)
values  ('Мастер и Маргарита', 1, 1, 670.99, 3),
        ('Белая гвардия ', 1, 1, 540.50, 5),
        ('Идиот', 2, 1, 460.00, 10),
        ('Братья Карамазовы', 2, 1, 799.01, 2),
        ('Игрок', 2, 1, 480.50, 10),
        ('Стихотворения и поэмы', 3, 2, 650.00, 15),
        ('Черный человек', 3, 2, 570.20, 6),
        ('Лирика', 4, 2, 518.99, 2);

create table city(
    city_id int primary key auto_increment,
    name_city varchar(30),
    days_delivery int
);

insert into city(name_city, days_delivery)
values ('Москва', 5),
       ('Санкт-Петербург', 3),
       ('Владивосток', 12);

create table client(
    client_id int primary key auto_increment,
    name_client varchar(50),
    city_id int,
    email varchar(30),
    foreign key (city_id) references city(city_id)
);

insert into client(name_client, city_id, email)
values ('Баранов Павел', 3, 'baranov@test'),
       ('Абрамова Катя', 1, 'abramova@test'),
       ('Семенонов Иван', 2, 'semenov@test'),
       ('Яковлева Галина', 1, 'yakovleva@test');

create table buy(
    buy_id int primary key auto_increment,
    buy_description varchar(100),
    client_id int,
    foreign key (client_id) references client(client_id)
);

insert into buy(buy_description, client_id)
values ('Доставка только вечером', 1),
       (NULL, 3),
       ('Упаковать каждую книгу по отдельности', 2),
       (NULL, 1);

create table buy_book(
    buy_book_id int primary key auto_increment,
    buy_id int,
    book_id int,
    amount int,
    foreign key (buy_id) references buy(buy_id),
    foreign key (book_id) references book(book_id)
);

insert into buy_book(buy_id, book_id, amount)
values (1, 1, 1),
       (1, 7, 2),
       (1, 3, 1),
       (2, 8, 2),
       (3, 3, 2),
       (3, 2, 1),
       (3, 1, 1),
       (4, 5, 1);

create table step(
    step_id int primary key auto_increment,
    name_step varchar(30)
);

insert into step(name_step)
values ('Оплата'),
       ('Упаковка'),
       ('Транспортировка'),
       ('Доставка');

create table buy_step(
    buy_step_id int primary key auto_increment,
    buy_id int,
    step_id int,
    date_step_beg date,
    date_step_end date,
    foreign key (buy_id) references buy(buy_id),
    foreign key (step_id) references step(step_id)
);

insert into buy_step(buy_id, step_id, date_step_beg, date_step_end)
values (1, 1, '2020-02-20', '2020-02-20'),
       (1, 2, '2020-02-20', '2020-02-21'),
       (1, 3, '2020-02-22', '2020-03-07'),
       (1, 4, '2020-03-08', '2020-03-08'),
       (2, 1, '2020-02-28', '2020-02-28'),
       (2, 2, '2020-02-29', '2020-03-01'),
       (2, 3, '2020-03-02', NULL),
       (2, 4, NULL, NULL),
       (3, 1, '2020-03-05', '2020-03-05'),
       (3, 2, '2020-03-05', '2020-03-06'),
       (3, 3, '2020-03-06', '2020-03-10'),
       (3, 4, '2020-03-11', NULL),
       (4, 1, '2020-03-20', NULL),
       (4, 2, NULL, NULL),
       (4, 3, NULL, NULL),
       (4, 4, NULL, NULL);