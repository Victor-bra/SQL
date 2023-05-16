/*К групповым функциям SQL относятся: MIN(), MAX() и AVG(), которые вычисляют минимальное,
  максимальное и среднее значение элементов столбца, относящихся к группе.

Пример:
Вывести минимальную цену книги каждого автора

Запрос:
SELECT author, MIN(price) AS min_price
FROM book
GROUP BY author;

Результат:
+------------------+-----------+
| author           | min_price |
+------------------+-----------+
| Булгаков М.А.    | 540.50    |
| Достоевский Ф.М. | 460.00    |
| Есенин С.А.      | 650.00    |
+------------------+-----------+*/

# -----------------------------------------------------------------------------

/*Задание

Вывести фамилию и инициалы автора, минимальную, максимальную и среднюю цену книг каждого автора .
  Вычисляемые столбцы назвать Минимальная_цена, Максимальная_цена и Средняя_цена соответственно.

Результат:
+------------------+------------------+-------------------+--------------+
| author           | Минимальная_цена | Максимальная_цена | Средняя_цена |
+------------------+------------------+-------------------+--------------+
| Булгаков М.А.    | 540.50           | 670.99            | 605.745000   |
| Достоевский Ф.М. | 460.00           | 799.01            | 579.836667   |
| Есенин С.А.      | 650.00           | 650.00            | 650.000000   |
+------------------+------------------+-------------------+--------------+

Структура и наполнение таблицы book:
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 3      |
| 5       | Игрок                 | Достоевский Ф.М. | 480.50 | 10     |
| 6       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+
*/

select author, min(price) as 'Минимальная_цена', max(price) as 'Максимальная_цена', avg(price) as 'Средняя_цена'
from book
group by author