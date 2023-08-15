/*
Запросы с UNION можно использовать как вложенные, это позволяет
обрабатывать данные из объединенных запросов совместно.

Пример:
Вывести клиентов, которые делали покупки в прошлом году, но не делали в этом.
А также новых клиентов, которые делали заказы только в текущем году.
Информацию отсортировать по возрастанию лет.

Шаг 1. Отберем клиентов прошлого года, указав дату самого раннего заказа,
а также клиентов этого года, указав для них самую раннюю дату оплаты заказа.

Запрос:
SELECT name_client, MIN(date_payment) AS first_payment
FROM
    buy_archive
    INNER JOIN client USING(client_id)
GROUP BY  name_client
UNION
SELECT name_client, MIN(date_step_end)
FROM
    buy
    INNER JOIN client USING(client_id)
    INNER JOIN buy_step USING(buy_id)
GROUP BY name_client

Результат:
+-----------------+---------------+
| name_client     | first_payment |
+-----------------+---------------+
| Абрамова Катя   | 2019-02-10    |
| Баранов Павел   | 2019-02-21    |
| Яковлева Галина | 2019-03-05    |
| Абрамова Катя   | 2020-03-05    |
| Баранов Павел   | 2020-02-20    |
| Семенонов Иван  | 2020-02-28    |
+-----------------+---------------+

Как видно из таблицы, некоторые клиенты делали покупки как в прошлом,
так и в этом году. Они встречаются в таблице 2 раза.

Шаг 2. Оставим только тех клиентов, которые встречаются в полученной таблице
один раз, для этого используем предыдущий запрос как вложенный.

Запрос:
SELECT name_client, MIN(YEAR(first_payment)) AS Год
FROM
  (
   SELECT name_client, MIN(date_payment) AS first_payment
   FROM
       buy_archive
       INNER JOIN client USING(client_id)
   GROUP BY  name_client
   UNION
   SELECT name_client, MIN(date_step_end)
   FROM
       buy
       INNER JOIN client USING(client_id)
       INNER JOIN buy_step USING (buy_id)
   GROUP BY name_client
  ) query_in
GROUP BY name_client
HAVING COUNT(*) = 1
ORDER BY 2

Результат:
+-----------------+------+
| name_client     | Год  |
+-----------------+------+
| Яковлева Галина | 2019 |
| Семенонов Иван  | 2020 |
+-----------------+------+
*/

# -------------------------------------------------------------------------

/*
Для каждой отдельной книги необходимо вывести информацию о количестве
проданных экземпляров и их стоимости за 2020 и 2019 год .
Вычисляемые столбцы назвать Количество и Сумма. Информацию отсортировать
по убыванию стоимости.

Информация о продажах прошлого года хранится в таблице buy_archive

При вычислении Количества и Суммы для текущего года учитывать только те книги,
которые уже оплачены (указана дата оплаты для шага "Оплата" в таблице buy_step).

+-----------------------+------------+---------+
| title                 | Количество | Сумма   |
+-----------------------+------------+---------+
| Братья Карамазовы     | 8          | 6247.20 |
| Мастер и Маргарита    | 6          | 4024.38 |
| Идиот                 | 5          | 2281.80 |
| Белая гвардия         | 3          | 1581.10 |
| Черный человек        | 2          | 1140.40 |
| Лирика                | 2          | 1037.98 |
| Игрок                 | 2          | 961.80  |
| Стихотворения и поэмы | 1          | 650.00  |
+-----------------------+------------+---------+

*/
select title, sum(amount) as Количество, sum(price * amount) as Сумма
from (select title, buy_book.amount, price
      from book
               join buy_book using (book_id)
               join buy using (buy_id)
               join buy_step using (buy_id)
               join step using (step_id)
      where buy_step.date_step_end is not null
        and step.name_step = 'Оплата'
      union all
      select title, buy_archive.amount, buy_archive.price
      from buy_archive
               join book using (book_id)) tabl
group by title
order by 3 desc