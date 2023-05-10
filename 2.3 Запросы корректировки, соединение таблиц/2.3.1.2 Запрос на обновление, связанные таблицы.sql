/*
Задание:
Для книг, которые уже есть на складе (в таблице book), но по другой цене, чем в поставке (supply),
необходимо в таблице book увеличить количество на значение, указанное в поставке,  и пересчитать
цену. А в таблице  supply обнулить количество этих книг. Формула для пересчета цены:

price = (p1*k1 + p2*k2)/(k1+k2);

где p1, p2 - цена книги в таблицах book и supply;
    k1, k2 - количество книг в таблицах book и supply.
*/

UPDATE book
    INNER JOIN author ON author.author_id = book.author_id
    INNER JOIN supply ON book.title = supply.title
        and supply.author = author.name_author
SET book.price = (book.price*book.amount + supply.price*supply.amount) / (book.amount + supply.amount),
    book.amount = book.amount + supply.amount,
    supply.amount = 0
WHERE book.price != supply.price;

SELECT * FROM book;

SELECT * FROM supply;