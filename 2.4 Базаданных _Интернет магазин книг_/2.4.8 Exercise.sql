/*
Задание:
Выбрать всех клиентов, которые заказывали книги Достоевского,
информацию вывести в отсортированном по алфавиту виде.
В решении используйте фамилию автора, а не его id.

Результат:
+---------------+
| name_client   |
+---------------+
| Абрамова Катя |
| Баранов Павел |
+---------------+
*/

select client.name_client
from client
         join buy using (client_id)
         join buy_book using (buy_id)
         join book using (book_id)
         join author using (author_id)
where author.name_author='Достоевский Ф.М.'
group by client.name_client
order by client.name_client