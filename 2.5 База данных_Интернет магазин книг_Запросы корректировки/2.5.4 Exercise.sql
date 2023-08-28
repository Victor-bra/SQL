/*
Задание:
Количество тех книг на складе, которые были включены в заказ с номером 5,
уменьшить на то количество, которое в заказе с номером 5  указано.

Пояснение:
Для изменения количества книг используйте запрос UPDATE.

Результат:
Affected rows: 2

Query result (выборка из таблицы book):
+---------+-----------------------+-----------+----------+--------+--------+
| book_id | title                 | author_id | genre_id | price  | amount |
+---------+-----------------------+-----------+----------+--------+--------+
| 1       | Мастер и Маргарита    | 1         | 1        | 670.99 | 3      |
| 2       | Белая гвардия         | 1         | 1        | 540.50 | 4      |
| 3       | Идиот                 | 2         | 1        | 460.00 | 10     |
| 4       | Братья Карамазовы     | 2         | 1        | 799.01 | 3      |
| 5       | Игрок                 | 2         | 1        | 480.50 | 10     |
| 6       | Стихотворения и поэмы | 3         | 2        | 650.00 | 15     |
| 7       | Черный человек        | 3         | 2        | 570.20 | 6      |
| 8       | Лирика                | 4         | 2        | 518.99 | 0      |
+---------+-----------------------+-----------+----------+--------+--------+
*/

update book, buy_book
set book.amount = book.amount - buy_book.amount
where buy_book.buy_id = 5
  and buy_book.book_id = book.book_id;

select * from book;