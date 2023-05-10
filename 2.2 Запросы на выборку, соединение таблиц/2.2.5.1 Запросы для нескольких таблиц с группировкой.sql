/*
Пример:
Вывести количество различных книг каждого автора. Информацию отсортировать в алфавитном порядке по фамилиям  авторов.
*/

SELECT name_author, count(title) AS Количество
FROM
    author INNER JOIN book
                      on author.author_id = book.author_id
GROUP BY name_author
ORDER BY name_author;

/*
При использовании соединения INNER JOIN мы не можем узнать,
что книг Лермонтова на складе нет, но предполагается,
что они могут быть.  Чтобы автор Лермонтов был включен в
результат, нужно изменить соединение таблиц.

Запрос:
*/
SELECT name_author, count(title) AS Количество
FROM
    author LEFT JOIN book
                     on author.author_id = book.author_id
GROUP BY name_author
ORDER BY name_author;