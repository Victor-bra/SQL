use sql_lessons;
create table city (
    city_id int primary key auto_increment,
    name_city varchar(30)
);
insert into city(name_city)
values ('Москва'),
       ('Санкт-Петербург'),
       ('Владивосток');