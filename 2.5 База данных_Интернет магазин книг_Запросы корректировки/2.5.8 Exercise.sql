/*
Задание:
В таблицу buy_step занести дату 12.04.2020 выставления счета на оплату заказа
с номером 5.

Правильнее было бы занести не конкретную, а текущую дату.
Это можно сделать с помощью функции Now(). Но при этом в разные
дни будут вставляться разная дата, и задание нельзя будет проверить,
поэтому  вставим дату 12.04.2020.

Пояснение:
Для просмотра данных из таблицы buy_step выбраны не все  записи, а только те,
которые относятся к заказу с номером 5.

Результат:
Affected rows: 1

Query result (выборка из таблицы buy_step для заказа с номером 5):
+-------------+--------+---------+---------------+---------------+
| buy_step_id | buy_id | step_id | date_step_beg | date_step_end |
+-------------+--------+---------+---------------+---------------+
| 17          | 5      | 1       | 2020-04-12    | NULL          |
| 18          | 5      | 2       | NULL          | NULL          |
| 19          | 5      | 3       | NULL          | NULL          |
| 20          | 5      | 4       | NULL          | NULL          |
+-------------+--------+---------+---------------+---------------+
*/

update buy_step
set date_step_beg = '2020-04-12'
where buy_id = 5 and step_id = 1;

select * from buy_step