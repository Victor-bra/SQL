/*
Задание:
В таблицу buy_book добавить заказ с номером 5. Этот заказ должен содержать книгу
Пастернака «Лирика» в количестве двух экземпляров и книгу Булгакова «Белая гвардия»
в одном экземпляре.

Пояснение:
Для вставки каждой книги используйте отдельный запрос. Не забывайте между запросами
ставить точку с запятой.

Результат:
Affected rows: 1

Affected rows: 1

Query result (выборка из таблицы buy_book):
+-------------+--------+---------+--------+
| buy_book_id | buy_id | book_id | amount |
+-------------+--------+---------+--------+
| 1           | 1      | 1       | 1      |
| 2           | 1      | 7       | 2      |
| 3           | 1      | 4       | 1      |
| 4           | 2      | 8       | 2      |
| 5           | 3      | 3       | 2      |
| 6           | 3      | 2       | 1      |
| 7           | 3      | 1       | 1      |
| 8           | 4      | 5       | 1      |
| 9           | 5      | 8       | 2      |
| 10          | 5      | 2       | 1      |
+-------------+--------+---------+--------+
*/
insert into buy_book(buy_book.buy_id, buy_book.book_id, buy_book.amount)
values (5,
        (select book.book_id
         from book
                  join author using (author_id)
         where author.name_author = 'Пастернак Б.Л.'
           and book.title = 'Лирика'),
        2),
       (5,
        (select book.book_id
         from book
                  join author using (author_id)
         where author.name_author = 'Булгаков М.А.'
           and book.title = 'Белая гвардия'),
        1);

select * from buy_book;