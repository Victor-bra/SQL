/*
Задание
Вывести название, жанр и цену тех книг, количество которых больше 8, в отсортированном по убыванию цены виде.
*/
select title, name_genre, price
from genre inner join book on genre.genre_id = book.genre_id
where book.amount>8
order by price desc