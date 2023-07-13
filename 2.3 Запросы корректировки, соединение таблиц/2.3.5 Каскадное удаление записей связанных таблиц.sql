/*
Каскадное удаление записей связанных таблиц

При создании таблицы для внешних ключей с помощью ON DELETE устанавливаются опции, которые определяют действия,
выполняемые при удалении связанной строки из главной таблицы.

В частности, ON DELETE CASCADE автоматически удаляет строки из зависимой таблицы
при удалении  связанных строк в главной таблице.

В таблице book эта опция установлена для поля author_id.

Пример:
Удалим из таблицы author всех авторов, фамилия которых начинается на «Д»,
а из таблицы book  - все книги этих авторов.

Запрос:
DELETE FROM author
WHERE name_author LIKE "Д%";
SELECT * FROM author;
SELECT * FROM book;

Результат:
Affected rows: 1

Query result:
+-----------+----------------+
| author_id | name_author    |
+-----------+----------------+
| 1         | Булгаков М.А.  |
| 3         | Есенин С.А.    |
| 4         | Пастернак Б.Л. |
| 5         | Лермонтов М.Ю. |
| 6         | Стивенсон Р.Л. |
+-----------+----------------+
Affected rows: 5

Query result:
+---------+-----------------------+-----------+----------+--------+--------+
| book_id | title                 | author_id | genre_id | price  | amount |
+---------+-----------------------+-----------+----------+--------+--------+
| 1       | Мастер и Маргарита    | 1         | 1        | 670.99 | 3      |
| 2       | Белая гвардия         | 1         | 1        | 540.50 | 12     |
| 6       | Стихотворения и поэмы | 3         | 2        | 650.00 | 15     |
| 7       | Черный человек        | 3         | 2        | 570.20 | 12     |
| 8       | Лирика                | 4         | 2        | 518.99 | 2      |
| 9       | Доктор Живаго         | 4         | 1        | 380.80 | 4      |
| 10      | Стихотворения и поэмы | 5         | 2        | 255.90 | 4      |
| 11      | Остров сокровищ       | 6         | 3        | 599.99 | 5      |
+---------+-----------------------+-----------+----------+--------+--------+

Одним запросом удаляются связанные записи из главной и зависимой таблицы.
В нашем случае удалился автор Достоевский и все его книги.
*/

# --------------------------------------------------------------------------

/*
Задание:
Удалить всех авторов и все их книги, общее количество книг которых меньше 20.
*/

delete from author
where author.author_id in (
        select book.author_id
        from book
        group by book.author_id
        having sum(amount)<20);

select * from book;

select * from author;