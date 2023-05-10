/*
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    author_id INT NOT NULL,
    price DECIMAL(8,2),
    amount INT,
    FOREIGN KEY (author_id)  REFERENCES author (author_id)
);

Задание
  Перепишите запрос на создание таблицы book , чтобы ее структура
  соответствовала структуре, показанной на логической схеме
  (таблица genre уже создана, порядок следования столбцов - как на
  логической схеме в таблице book, genre_id  - внешний ключ) .
  Для genre_id ограничение о недопустимости пустых значений не задавать.
  В качестве главной таблицы для описания поля  genre_id
  использовать таблицу genre следующей структуры:

Поле	Тип, описание
genre_id	INT PRIMARY KEY AUTO_INCREMENT
name_genre	VARCHAR(30)

*/

create table book(
    book_id int primary key auto_increment,
    title varchar(50),
    author_id int not null,
    genre_id int,
    price decimal(8,2),
    amount int,
    foreign key (author_id) references author(author_id),
    foreign key (genre_id) references genre(genre_id)
)