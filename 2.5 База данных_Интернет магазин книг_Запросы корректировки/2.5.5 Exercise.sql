/*
Задание:
Создать счет (таблицу buy_pay) на оплату заказа с номером 5, в который включить
название книг, их автора, цену, количество заказанных книг и  стоимость.
Последний столбец назвать Стоимость. Информацию в таблицу занести в отсортированном
по названиям книг виде.

Результат:

Affected rows: 2

Query result (выборка из таблицы buy_pay):
+---------------+----------------+--------+--------+-----------+
| title         | name_author    | price  | amount | Стоимость |
+---------------+----------------+--------+--------+-----------+
| Белая гвардия | Булгаков М.А.  | 540.50 | 1      | 540.50    |
| Лирика        | Пастернак Б.Л. | 518.99 | 2      | 1037.98   |
+---------------+----------------+--------+--------+-----------+
*/

create table buy_pay
select book.title,
       author.name_author,
       book.price,
       buy_book.amount,
       book.price * buy_book.amount as 'Стоимость'
from buy_book
         inner join book using (book_id)
         inner join author using (author_id)
where buy_book.buy_id = 5
order by title;

select * from buy_pay;