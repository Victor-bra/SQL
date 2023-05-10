/*
Задание:
Вывести все жанры, которые не представлены в книгах на складе.
*/
select name_genre
from genre left join book b on genre.genre_id = b.genre_id
where title is null 