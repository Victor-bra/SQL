/*
Задание
Посчитать количество экземпляров  книг каждого автора из таблицы author.
Вывести тех авторов,  количество книг которых меньше 10, в отсортированном
по возрастанию количества виде. Последний столбец назвать Количество.
*/

select name_author, if(sum(amount) is null, null, sum(amount)) as 'Количество'
from author left join book on author.author_id = book.author_id
group by name_author
having Количество<10 or Количество is null
order by 2;
