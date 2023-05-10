/*
Пример:
Для книг, которые уже есть на складе (в таблице book) по той же цене, что и в поставке (supply),
увеличить количество на значение, указанное в поставке, а также обнулить количество этих книг в поставке.

Этот запрос должен отобрать строки из таблиц bookи supply такие, что у них совпадают и автор,
и название книги. Но в таблице supply фамилия автора записана не числом (id), а текстом.
Следовательно, чтобы выполнить сравнение по фамилии автора нужно "подтянуть" таблицу author,
которая связана с bookпо столбцу author_id.  И в логическом выражении, описывающем соединение
таблиц, можно будет использовать столбцы из таблиц book, authorи supply.

Если таблицы логически связаны по двум и более столбцам (на рисунке связи обозначены линиями),
возможно через другие таблицы, условие соединение будет включать связи по нужным столбцам через
логический оператор AND.

Условие соединения можно записать в виде:

book INNER JOIN author ON author.author_id = book.author_id
     INNER JOIN supply ON book.title = supply.title
                          and supply.author = author.name_author
*/

UPDATE book
    INNER JOIN author ON author.author_id = book.author_id
    INNER JOIN supply ON book.title = supply.title
        and supply.author = author.name_author
SET book.amount = book.amount + supply.amount,
    supply.amount = 0
WHERE book.price = supply.price;

SELECT * FROM book;

SELECT * FROM supply;