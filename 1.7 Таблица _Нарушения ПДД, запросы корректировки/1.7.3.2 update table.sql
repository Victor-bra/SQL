/*Занести в таблицу fine суммы штрафов, которые должен оплатить водитель, в соответствии с данными из
  таблицы traffic_violation. При этом суммы заносить только в пустые поля столбца  sum_fine.
Таблица traffic_violation создана и заполнена.

Важно! Сравнение значения столбца с пустым значением осуществляется с помощью оператора IS NULL.*/

update fine f, traffic_violation tv
set f.sum_fine = tv.sum_fine
where f.violation = tv.violation and f.sum_fine is null;
select *
from fine;