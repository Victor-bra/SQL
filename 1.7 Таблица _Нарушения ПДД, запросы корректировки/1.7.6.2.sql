/*Необходимо:
1. в таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment;
2.уменьшить начисленный штраф в таблице fine в два раза  (только для тех штрафов,
  информация о которых занесена в таблицу payment) , если оплата произведена не
  позднее 20 дней со дня нарушения.*/

update fine, payment
set fine.date_payment = payment.date_payment,
    fine.sum_fine = if(DATEDIFF(payment.date_payment, fine.date_violation) <=20, fine.sum_fine/2, fine.sum_fine)
where fine.date_payment is null and
      fine.name = payment.name and
      fine.number_plate = payment.number_plate and
      fine.violation = payment.violation;