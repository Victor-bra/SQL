/*
Задание
Вывести информацию о книгах (название книги, фамилию и инициалы автора, название жанра,
цену и количество экземпляров книги), написанных в самых популярных жанрах, в отсортированном
в алфавитном порядке по названию книг виде. Самым популярным считать жанр, общее количество
экземпляров книг которого на складе максимально.
*/

SELECT title, name_author, name_genre, price, amount
FROM
    author
        INNER JOIN book ON author.author_id = book.author_id
        INNER JOIN genre ON  book.genre_id = genre.genre_id
WHERE genre.genre_id in
      (select genre_id
       from book
       group by genre_id
       having  sum(amount) = (
           select sum(amount) as sum_amount
           from book
           group by genre_id
           having sum_amount
           limit 1))
ORDER BY title