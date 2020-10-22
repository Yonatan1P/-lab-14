<!-- Create table of authors, with id's of serial primary keys from the Characters available -->
CREATE TABLE authors (id SERIAL PRIMARY KEY, name VARCHAR(255));

<!-- Insert author names into the authors table by selecting distinct authors from the books table -->
INSERT INTO authors(name) SELECT DISTINCT author FROM books;

<!-- Alter the books table by adding a column named author_id and initialize it into the books table -->
ALTER TABLE books ADD COLUMN author_id INT;

<!-- Update the books table by setting the author_id in the books table equal to the id from the authors table-->
<!--then select everything from the authors table and update the books table with author where the book author will match the author's name -->
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

<!-- Alter the books table by dropping the column named author-->
ALTER TABLE books DROP COLUMN author;

<!-- alter the books table by adding a constraint to link the authors table by author_id which references the authors(id) in the author table -->
<!--this will link the two tables-->
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);