/*
Задание:
Создать новый заказ для Попова Ильи. Его комментарий для заказа:
«Связаться со мной по вопросу доставки».

Важно! В решении нельзя использоваться VALUES и делать отбор по client_id.
*/

insert into buy(buy_description, client_id)
select 'Связаться со мной по вопросу доставки', client_id
from client
where name_client = 'Попов Илья';

select * from buy
