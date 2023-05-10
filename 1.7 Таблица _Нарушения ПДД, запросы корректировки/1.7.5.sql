/*В таблице fine увеличить в два раза сумму неоплаченных штрафов для отобранных на предыдущем шаге записей. */
update fine, (select name, number_plate, violation
              from fine
              group by name, number_plate, violation
              having count(*)>=2) as temp
set fine.sum_fine = fine.sum_fine*2
where fine.date_payment is null and fine.name = temp.name and fine.violation = temp.violation;