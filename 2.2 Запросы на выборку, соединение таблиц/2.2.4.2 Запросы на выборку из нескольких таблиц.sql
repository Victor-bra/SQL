 /*
Задание
 Вывести информацию о книгах (жанр, книга, автор), относящихся к жанру, включающему слово «роман» в отсортированном по названиям книг виде.
*/

select name_genre, title, name_author
from
    author
        inner join book on author.author_id = book.author_id
        inner join genre on book.genre_id = genre.genre_id
where genre.name_genre = 'Роман'
order by title