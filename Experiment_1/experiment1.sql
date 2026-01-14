CREATE TABLE books(
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	author_name VARCHAR(50) NOT NULL,
	count INT CHECK(count>0)
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

INSERT INTO books VALUES(1, 'Harry Potter', 'R. Snape', 1)
INSERT INTO books VALUES(2, 'Avengers', 'Stan Lee', 3)

SELECT * FROM books

INSERT INTO library_visitors VALUES(101, 'Robert', 20, 'abc@gmail.com')

UPDATE library_visitors SET email='Robert@gmail.com' WHERE user_id = 101

SELECT * FROM library_visitors

INSERT INTO book_issue VALUES(1234,1,101,'2026-01-07')

SELECT * FROM book_issue

DELETE FROM books WHERE id = 2

SELECT * FROM books

CREATE ROLE librarian WITH LOGIN PASSWORD 'PASSWORD'

GRANT SELECT, INSERT, DELETE, UPDATE ON books TO librarian
GRANT SELECT, INSERT, DELETE, UPDATE ON library_visitors TO librarian
GRANT SELECT, INSERT, DELETE, UPDATE ON book_issue TO librarian

REVOKE SELECT, INSERT, DELETE, UPDATE ON books FROM librarian
