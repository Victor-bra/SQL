/*
Для ограничения вывода записей в SQL используется оператор LIMIT , после которого указывается количество строк.
Результирующая таблица будет иметь количество строк не более указанного после LIMIT.
LIMIT размещается после раздела ORDER BY.

Как правило, этот оператор используется, чтобы отобрать заданное количество отсортированных строк результата запроса.

Пример:
Вывести информацию о первой  командировке из таблицы trip. "Первой" считать командировку с самой ранней датой начала.

Запрос:
SELECT *
FROM trip
ORDER BY  date_first
LIMIT 1;

Результат:
+---------+--------------+--------+----------+------------+------------+
| trip_id | name         | city   | per_diem | date_first | date_last  |
+---------+--------------+--------+----------+------------+------------+
| 1       | Баранов П.Е. | Москва | 700.00   | 2020-01-12 | 2020-01-17 |
+---------+--------------+--------+----------+------------+------------+

Важно. Оператор LIMIT нужно использовать очень осторожно. Например, если бы в таблице trip было несколько
командировок с одинаковой датой начала, этот запрос работал бы НЕВЕРНО. Это связано с тем, что заранее
не известно точное значение таких командировок.
*/

# ---------------------------------------------------------------------

/*
Задание:
Вывести два города, в которых чаще всего были в командировках сотрудники. Вычисляемый столбец назвать Количество.

Результат:
+-------------+------------+
| city        | Количество |
+-------------+------------+
| Москва      | 7          |
| Новосибирск | 4          |
+-------------+------------+
*/

select city, count(name) as 'Количество'
from trip
group by city
order by 2 desc
limit 2
