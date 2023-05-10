/*
Задание:
Для каждого автора из таблицы author вывести количество книг, написанных им в каждом жанре.
Вывод: ФИО автора, жанр, количество. Отсортировать по фамилии, затем - по убыванию количества написанных книг.
*/

select author.name_author, genre.name_genre,COUNT(book.title) as cnt_title
from author
         cross join genre
         left join book
                   on author.author_id = book.author_id and genre.genre_id = book.genre_id
group by author.name_author, genre.name_genre
order by author.name_author
