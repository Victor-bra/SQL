/*
Задание
Если в таблицах supply  и book есть одинаковые книги,
которые имеют равную цену,  вывести их название и автора,
а также посчитать общее количество экземпляров книг в
таблицах supply и book,  столбцы назвать Название, Автор  и Количество.
*/

select title 'Название', name_author 'Автор', book.amount + supply.amount 'Количество'
from book inner join author using (author_id)
            inner join supply using (title)
where supply.price = book.price