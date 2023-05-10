/*
Задание:
Включить новых авторов в таблицу author с помощью запроса на добавление,
а затем вывести все данные из таблицы author.  Новыми считаются авторы,
которые есть в таблице supply, но нет в таблице author.
*/
insert into author(name_author)
select supply.author
from author
        right join supply on author.name_author = supply.author
where name_author is null;

select * from author;