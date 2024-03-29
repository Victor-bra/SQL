/*
Задание:
Создать общий счет (таблицу buy_pay) на оплату заказа с номером 5.
Куда включить номер заказа, количество книг в заказе (название столбца Количество)
и его общую стоимость (название столбца Итого). Для решения используйте ОДИН запрос.

Результат:
Affected rows: 1

Query result (выборка из таблицы buy_pay):
+--------+------------+---------+
| buy_id | Количество | Итого   |
+--------+------------+---------+
| 5      | 3          | 1578.48 |
+--------+------------+---------+
*/

create table buy_pay
select buy_id,
       sum(buy_book.amount) as 'Количество',
       sum(book.price * buy_book.amount) as  'Итого'
from buy_book
         inner join book using (book_id)
where buy_id = 5;

select * from buy_pay
