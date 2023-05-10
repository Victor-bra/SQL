/*
Пример:
Вывести название всех книг каждого автора, если книг некоторых авторов в данный момент нет на складе – вместо названия книги указать Null.
*/

SELECT name_author, title
FROM author
         LEFT JOIN book ON author.author_id = book.author_id
ORDER BY name_author;     