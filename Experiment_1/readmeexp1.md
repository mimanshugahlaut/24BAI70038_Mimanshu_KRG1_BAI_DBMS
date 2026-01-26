Experiment: Library Management System Implementation

1. Aim of the Session:
The primary goal of this experiment was to model a relational database for a Library Management System.
This included designing normalized tables, applying integrity constraints, linking related entities, and implementing access control using role-based permissions.

2. Software Requirements:

   • Database: PostgreSQL Database (PgAdmin)
   
3. Objective of the Session:

By the end of this practical task, the following objectives were successfully met:

•	Designed table schemas using Primary Keys, Foreign Keys, NOT NULL, UNIQUE, and CHECK constraints.

•	Utilized DML commands such as INSERT, UPDATE, DELETE, and SELECT to manipulate relational data.

•	Applied DCL operations (GRANT & REVOKE) to configure role-based privileges and restrict access.

•	Ensured referential integrity among interconnected tables (books, library_visitors, and book_issue).

4. Practical / Experiment Steps:

The implementation process consisted of the following major tasks:

•	Schema Creation: Created base tables with validation rules to ensure correct data input (e.g., age ≥ 18).

•	Relationship Definition: Added the book_issue table as a transactional table referencing books and visitors.

•	Sample Data Insertion: Inserted initial values to verify schema behavior and constraint enforcement.

•	Operational Transactions: Performed modifications and deletions to observe how constraints affect updates.

•	Role & Security Setup: Created a database role for library staff and granted required privileges using DCL commands.

5. Procedure Followed

The experiment followed these execution steps:

•	Database Login: Connected to PostgreSQL environment.

•	Database Setup: Created a dedicated DB instance for the system.

•	Table Execution: Executed CREATE TABLE statements in logical order (master → dependent).

•	Data Entry: Inserted book records and visitor records using INSERT.

•	Query Execution: Retrieved stored values using SELECT queries to check for correctness.

•	Data Modification: Updated user information and attempted deletion of book records.

•	Role Assignment: Created librarian role and granted relevant operations via GRANT.

•	Permission Testing: Revoked privileges to verify access control and policy effectiveness.

•	Documentation: Saved SQL script and captured screenshots of outputs.

6. I/O Analysis (Input / Output Analysis)

Input SQL Commands

--Table Creation

CREATE TABLE books(

    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    author_name VARCHAR(50) NOT NULL,
    count INT CHECK(count>0)
);

CREATE TABLE library_visitors(

    user_id INT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    age INT CHECK(age>=18) NOT NULL,
    email VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE book_issue(

    book_issue_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (user_id) REFERENCES library_visitors(user_id),
    book_issue_date DATE NOT NULL
);

--Data Commands

INSERT INTO books VALUES(1, 'Harry Potter', 'R. Snape', 1);

INSERT INTO books VALUES(2, 'Avengers', 'Stan Lee', 3);

INSERT INTO library_visitors VALUES(101, 'Robert', 20, 'abc@gmail.com');

UPDATE library_visitors SET email='Robert@gmail.com' WHERE user_id = 101;

--Role Management

CREATE ROLE librarian WITH LOGIN PASSWORD 'PASSWORD';

GRANT SELECT, INSERT, DELETE, UPDATE ON books TO librarian;

* Schema Creation
  
•	All three tables (books, library_visitors, and book_issue) were successfully created.

•	The PRIMARY KEY constraints ensured unique identification of books and visitors.

•	The CHECK(age>=18) constraint prevented entries of visitors below 18 years of age.

•	The CHECK(count>0) constraint disallowed non-positive values for book count.

•	FOREIGN KEY constraints ensured that book issue entries could only reference existing books and visitors.

✔ Result: Schema creation completed without errors.

*  DML Outputs
The following SQL commands executed successfully:
<img width="975" height="142" alt="image" src="https://github.com/user-attachments/assets/0f17b09b-2e91-462e-a8c4-ce90d81e59dd" />
<img width="963" height="175" alt="image" src="https://github.com/user-attachments/assets/fcc70b31-8972-4e3c-8cf1-10119f5632b6" />

Next, visitor insertion and update:
<img width="975" height="101" alt="image" src="https://github.com/user-attachments/assets/e03cfc54-ca73-4b19-b4ad-1f092ad48d00" />
<img width="960" height="135" alt="image" src="https://github.com/user-attachments/assets/4ab23196-43b9-42cc-9438-1573943ed877" />

Finally, book issue entry:  
<img width="975" height="95" alt="image" src="https://github.com/user-attachments/assets/ecf9122f-dd9b-4450-ac24-cf9a9962d68f" />
<img width="905" height="131" alt="image" src="https://github.com/user-attachments/assets/2e25f282-d779-4d9a-90d5-7db5df97d426" />

* DELETE Operation Result
<img width="616" height="103" alt="image" src="https://github.com/user-attachments/assets/05ede19b-b394-4896-9022-1fe2a6bf45fb" />
<img width="942" height="128" alt="image" src="https://github.com/user-attachments/assets/6d2596b2-e65b-462c-bb4b-053395cc8581" />
                                          
* DCL (Security / Role-Based Access Control) Output
<img width="975" height="140" alt="image" src="https://github.com/user-attachments/assets/35ab77b4-b78c-426c-9e3c-6866e0f80feb" />
<img width="766" height="169" alt="image" src="https://github.com/user-attachments/assets/d3191978-a899-4eaa-8a14-ba5185b61177" />

Next, revoking privileges:
<img width="975" height="48" alt="image" src="https://github.com/user-attachments/assets/9eddc839-1ea6-44b9-ac3e-f47152d10e49" />
<img width="713" height="144" alt="image" src="https://github.com/user-attachments/assets/f6a185d1-4341-4850-9d8c-d5cc56ed6f9b" />

✔ Effect:
After revocation, librarian could no longer perform operations on the books table, verifying that permission control worked correctly.

•	Validation:  Testing confirmed that after the REVOKE command, the librarian could no longer perform operations on the books table, ensuring the security policy is functional.
<img width="764" height="223" alt="image" src="https://github.com/user-attachments/assets/7b03a607-26b7-441c-b570-dd5c84871432" />

•	We also confirmed the permissions of the role “librarian” by checking the table privileges.  
<img width="797" height="992" alt="image" src="https://github.com/user-attachments/assets/b664e0b0-fb56-46aa-bc38-c08149f4e577" />

7. Learning Outcome
From this practical, the following knowledge and skills were gained:

•	Schema Design Insight: Learned how relational constraints like CHECK, UNIQUE, and FOREIGN KEY contribute to logical data consistency.

•	Database Security Skills: Understood the advantage of assigning roles instead of individual user permissions for scalable security.

•	Real-world Contextualization: Saw how SQL is applied in real applications (such as library systems) where multiple entities interact systematically.


