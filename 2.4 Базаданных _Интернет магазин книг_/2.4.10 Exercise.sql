DROP TABLE IF EXISTS buy_archive;

CREATE TABLE buy_archive
(
    buy_archive_id INT PRIMARY KEY AUTO_INCREMENT,
    buy_id         INT,
    client_id      INT,
    book_id        INT,
    date_payment   DATE,
    price          DECIMAL(8, 2),
    amount         INT
);

INSERT INTO buy_archive (buy_id, client_id, book_id, date_payment, amount, price)
VALUES (2, 1, 1, '2019-02-21', 2, 670.60),
       (2, 1, 3, '2019-02-21', 1, 450.90),
       (1, 2, 2, '2019-02-10', 2, 520.30),
       (1, 2, 4, '2019-02-10', 3, 780.90),
       (1, 2, 3, '2019-02-10', 1, 450.90),
       (3, 4, 4, '2019-03-05', 4, 780.90),
       (3, 4, 5, '2019-03-05', 2, 480.90),
       (4, 1, 6, '2019-03-12', 1, 650.00),
       (5, 2, 1, '2019-03-18', 2, 670.60),
       (5, 2, 4, '2019-03-18', 1, 780.90);


/*
Пример:
Вывести всех клиентов, которые делали заказы или в этом, или в предыдущем году.

На этом примере рассмотрим разницу между UNION и UNION ALL.

С UNION клиенты будут выведены без повторений:
SELECT name_client
FROM
    buy_archive
    INNER JOIN client USING(client_id)
UNION
SELECT name_client
FROM
    buy
    INNER JOIN client USING(client_id)
+-----------------+
| name_client     |
+-----------------+
| Баранов Павел   |
| Абрамова Катя   |
| Яковлева Галина |
| Семенонов Иван  |
+-----------------+
Affected rows: 4

C UNION ALL будут выведены клиенты с повторением (для тех, кто заказывал книги в обоих годах,
а также несколько раз в одном году)
SELECT name_client
FROM
    buy_archive
    INNER JOIN client USING(client_id)
UNION ALL
SELECT name_client
FROM
    buy
    INNER JOIN client USING(client_id)
+-----------------+
| name_client     |
+-----------------+
| Баранов Павел   |
| Баранов Павел   |
| Абрамова Катя   |
| Абрамова Катя   |
| Абрамова Катя   |
| Яковлева Галина |
| Яковлева Галина |
| Баранов Павел   |
| Абрамова Катя   |
| Абрамова Катя   |
| Баранов Павел   |
| Баранов Павел   |
| Абрамова Катя   |
| Семенонов Иван  |
+-----------------+
Affected rows: 14

Пример:
Вывести информацию об оплаченных заказах за предыдущий и текущий год, информацию отсортировать по  client_id.

Запрос:
SELECT buy_id, client_id, book_id, date_payment, amount, price
FROM
    buy_archive
UNION ALL
SELECT buy.buy_id, client_id, book_id, date_step_end, buy_book.amount, price
FROM
    book
    INNER JOIN buy_book USING(book_id)
    INNER JOIN buy USING(buy_id)
    INNER JOIN buy_step USING(buy_id)
    INNER JOIN step USING(step_id)
WHERE  date_step_end IS NOT Null and name_step = "Оплата"

Результат:
+--------+-----------+---------+--------------+--------+--------+
| buy_id | client_id | book_id | date_payment | amount | price  |
+--------+-----------+---------+--------------+--------+--------+
| 2      | 1         | 1       | 2019-02-21   | 2      | 670.60 |
| 2      | 1         | 3       | 2019-02-21   | 1      | 450.90 |
| 1      | 2         | 2       | 2019-02-10   | 2      | 520.30 |
| 1      | 2         | 4       | 2019-02-10   | 3      | 780.90 |
| 1      | 2         | 3       | 2019-02-10   | 1      | 450.90 |
| 3      | 4         | 4       | 2019-03-05   | 4      | 780.90 |
| 3      | 4         | 5       | 2019-03-05   | 2      | 480.90 |
| 4      | 1         | 6       | 2019-03-12   | 1      | 650.00 |
| 5      | 2         | 1       | 2019-03-18   | 2      | 670.60 |
| 5      | 2         | 4       | 2019-03-18   | 1      | 780.90 |
| 1      | 1         | 3       | 2020-02-20   | 1      | 460.00 |
| 1      | 1         | 7       | 2020-02-20   | 2      | 570.20 |
| 1      | 1         | 1       | 2020-02-20   | 1      | 670.99 |
| 2      | 3         | 8       | 2020-02-28   | 2      | 518.99 |
| 3      | 2         | 1       | 2020-03-05   | 1      | 670.99 |
| 3      | 2         | 2       | 2020-03-05   | 1      | 540.50 |
| 3      | 2         | 3       | 2020-03-05   | 2      | 460.00 |
+--------+-----------+---------+--------------+--------+--------+

В результат включены сначала записи архивной таблицы, а затем информация об оплаченных заказах  текущего года.
Для того, чтобы изменить порядок следования записей в объединенном запросе, можно использовать сортировку
по всем объединенным записям. В этом случае ключевые слова ORDER BY указываются после последнего запроса:

SELECT buy_id, client_id, book_id, date_payment, amount, price
FROM
    buy_archive
UNION ALL
SELECT buy.buy_id, client_id, book_id, date_step_end, buy_book.amount, price
FROM
    book
    INNER JOIN buy_book USING(book_id)
    INNER JOIN buy USING(buy_id)
    INNER JOIN buy_step USING(buy_id)
    INNER JOIN step USING(step_id)
WHERE  date_step_end IS NOT Null and name_step = "Оплата"
ORDER BY client_id

Результат:
+--------+-----------+---------+--------------+--------+--------+
| buy_id | client_id | book_id | date_payment | amount | price  |
+--------+-----------+---------+--------------+--------+--------+
| 2      | 1         | 3       | 2019-02-21   | 1      | 450.90 |
| 2      | 1         | 1       | 2019-02-21   | 2      | 670.60 |
| 1      | 1         | 3       | 2020-02-20   | 1      | 460.00 |
| 1      | 1         | 7       | 2020-02-20   | 2      | 570.20 |
| 4      | 1         | 6       | 2019-03-12   | 1      | 650.00 |
| 1      | 1         | 1       | 2020-02-20   | 1      | 670.99 |
| 3      | 2         | 1       | 2020-03-05   | 1      | 670.99 |
| 3      | 2         | 2       | 2020-03-05   | 1      | 540.50 |
| 3      | 2         | 3       | 2020-03-05   | 2      | 460.00 |
| 5      | 2         | 4       | 2019-03-18   | 1      | 780.90 |
| 5      | 2         | 1       | 2019-03-18   | 2      | 670.60 |
| 1      | 2         | 3       | 2019-02-10   | 1      | 450.90 |
| 1      | 2         | 4       | 2019-02-10   | 3      | 780.90 |
| 1      | 2         | 2       | 2019-02-10   | 2      | 520.30 |
| 2      | 3         | 8       | 2020-02-28   | 2      | 518.99 |
| 3      | 4         | 5       | 2019-03-05   | 2      | 480.90 |
| 3      | 4         | 4       | 2019-03-05   | 4      | 780.90 |
+--------+-----------+---------+--------------+--------+--------+
*/

/*
Задание:
Сравнить ежемесячную выручку от продажи книг за текущий и предыдущий годы. Для этого вывести год,
месяц, сумму выручки в отсортированном сначала по возрастанию месяцев, затем по возрастанию лет виде.
Название столбцов: Год, Месяц, Сумма.

Пояснение:
Ежемесячная выручка рассчитывается как  сумма произведений цены книги на заказанное пользователем в этом месяце
количество.Цена книги для текущего года хранится в таблице book, а для предыдущего в buy_archive.

Результат:
+------+----------+---------+
| Год  | Месяц    | Сумма   |
+------+----------+---------+
| 2019 | February | 5626.30 |
| 2020 | February | 3309.37 |
| 2019 | March    | 6857.50 |
| 2020 | March    | 2131.49 |
+------+----------+---------+
*/

select YEAR(date_payment) as 'Год',
       MONTHNAME(date_payment) as 'Месяц',
       sum(price * amount) as 'Сумма'
from buy_archive
WHERE buy_archive.date_payment IS NOT NULL
group by MONTHNAME(date_payment), YEAR(date_payment)
union all
select YEAR(buy_step.date_step_end),
       MONTHNAME(buy_step.date_step_end),
       sum(book.price * buy_book.amount)
from step
         join buy_step using (step_id)
         join buy using (buy_id)
         join buy_book using (buy_id)
         join book using (book_id)
where YEAR(buy_step.date_step_end) is not null
  and step.name_step = 'Оплата'
group by MONTHNAME(buy_step.date_step_end),YEAR(buy_step.date_step_end)
order by 2,1


