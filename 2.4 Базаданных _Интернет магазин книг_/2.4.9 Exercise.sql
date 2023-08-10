/*
Задание:
Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг,
указать это количество. Последний столбец назвать Количество.

Пояснение:
Использовать вложенный запрос для вычисления максимального значения экземпляров книг.
Рекомендуется запрос реализовывать по шагам.

Результат:
+------------+------------+
| name_genre | Количество |
+------------+------------+
| Роман      | 7          |
+------------+------------+
*/

select name_genre, sum(buy_book.amount) as 'Количество'
from genre
         join book using (genre_id)
         join buy_book using (book_id)
group by name_genre
having sum(buy_book.amount) = (
    (SELECT MAX(sum_amount)
     FROM (SELECT SUM(buy_book.amount) AS sum_amount
           FROM book
                    JOIN buy_book
                         USING (book_id)
           GROUP BY genre_id) query_in))
