/*
Задание
Посчитать количество экземпляров  книг каждого автора из таблицы author.
Вывести тех авторов,  количество книг которых меньше 10, в отсортированном
по возрастанию количества виде. Последний столбец назвать Количество.
*/

select name_author, sum(amount) as 'Количество'
from author left join book b on author.author_id = b.author_id
group by name_author
having Количество<10 or Количество is null
order by 2
