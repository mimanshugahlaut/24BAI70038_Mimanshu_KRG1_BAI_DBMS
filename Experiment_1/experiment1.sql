CREATE TABLE books(
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	author_name VARCHAR(50) NOT NULL
)

CREATE TABLE library_visitors(
	user_id INT PRIMARY KEY,
	user_name VARCHAR(20) NOT NULL,
	age INT CHECK(age>=18) NOT NULL,
	email VARCHAR(40) UNIQUE NOT NULL
)

CREATE TABLE book_issue(
	book_issue_id INT PRIMARY KEY,
	book_id INT NOT NULL,
	user_id INT NOT NULL,
	FOREIGN KEY (book_id) REFERENCES books(id),
	FOREIGN KEY (user_id) REFERENCES library_visitors(user_id),
	book_issue_date DATE NOT NULL
)

INSERT INTO books VALUES(1, 'Harry Potter', 'R. Snape')

ALTER TABLE books ADD count INT CHECK(count>=1)

SELECT * FROM books

UPDATE books SET count=1 WHERE id=1



-- SELECT * FROM library_visitors

INSERT INTO library_visitors VALUES(101, 'Robert', 20, 'Robert@gmail.com')

SELECT * FROM library_visitors

ALTER TABLE library_visitors DROP COLUMN email

SELECT * FROM library_visitors

ALTER TABLE library_visitors ADD COLUMN email VARCHAR(40) UNIQUE

SELECT * FROM library_visitors

UPDATE library_visitors SET email='Robert@gmail.com'

SELECT * FROM library_visitors



INSERT INTO book_issue VALUES(1234,1,101,'2026-01-07')

SELECT * FROM book_issue

CREATE ROLE librarian WITH LOGIN PASSWORD 'PASSWORD'

GRANT SELECT, INSERT, DELETE, UPDATE ON books TO librarian
GRANT SELECT, INSERT, DELETE, UPDATE ON library_visitors TO librarian
GRANT SELECT, INSERT, DELETE, UPDATE ON book_issue TO librarian

REVOKE SELECT, INSERT, DELETE, UPDATE ON books FROM librarian
