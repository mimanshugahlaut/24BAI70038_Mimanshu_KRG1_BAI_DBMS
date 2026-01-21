SELECT * FROM books

INSERT INTO books VALUES(2,'AVENGERS','STAN LEE',4)
SELECT * FROM books

SELECT table_name,privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'librarian'
