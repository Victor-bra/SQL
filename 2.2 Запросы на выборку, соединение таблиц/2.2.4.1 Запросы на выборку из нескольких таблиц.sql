/*
Пример:
Вывести информацию о тех книгах, их авторах и жанрах, цена которых принадлежит интервалу от 500  до 700 рублей  включительно.
*/

SELECT title, name_author, name_genre, price, amount
FROM
    author
        INNER JOIN  book ON author.author_id = book.author_id
        INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE price BETWEEN 500 AND 700;