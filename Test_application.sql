-- Создание таблицы в SQL
CREATE TABLE student (
    student_id INT,
    name VARCHAR(20),
    major VARCHAR(20),
    PRIMARY KEY (student_id)
);

-- Удаление таблицы в SQL
DROP TABLE student;

-- Описание таблицы
DESCRIBE student;

-- Создание/удаление столбцов в таблице
ALTER TABLE student ADD gpa DECIMAL (3, 2);
ALTER TABLE student DROP gpa;

-- Добавление строк в таблицу
INSERT INTO student VALUES (1, 'Jack','Biology');
INSERT INTO student VALUES (2, 'Kate', 'Sociology');
INSERT INTO student VALUES (3, 'Claire', 'Chemistry');
INSERT INTO student VALUES (4, 'Jack', 'Biology');
INSERT INTO student VALUES (5, 'Mike', 'Computer Science');

-- Оператор выбора данных из таблицы
SELECT * FROM student;

-- Изменение данных в таблице
SET SQL_SAFE_UPDATES = 0;
UPDATE student SET major = 'Bio' WHERE major = 'Biology';
UPDATE student SET major = 'Biochemistry' WHERE major = 'Bio' OR major = 'Chemistry';
UPDATE student SET major = 'Biology' WHERE student_id = 1 OR student_id = 4;
UPDATE student SET major = 'Chemistry' WHERE name = 'Claire';


-- Удаление данных из таблицы
DELETE FROM student WHERE name = 'Jack';

-- Сортировка данных в таблице
SELECT student.student_id, student.name FROM student
ORDER BY name; 

-- Сортировкаа данных в таблие по возрастанию
SELECT student.name, student.major FROM student
ORDER BY major ASC;

-- Сортировкаа данных в таблие по убыванию
SELECT student.name, student.major FROM student
ORDER BY name DESC;

-- Исппользование оператора IN 
SELECT * FROM student
WHERE name IN ('Mike', 'Kate', 'Claire') ORDER BY name ASC;

DROP TABLE student;
-- CREATING COMPANY DATABASE

-- Cоздание таблицы "Employee"
CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

DESCRIBE employee;

-- Создание таблицы "branch"
CREATE TABLE branch (
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

-- Установка связи между столбцами "super_id" и "emp_id" в таблице employee
ALTER TABLE employee 
ADD FOREIGN KEY (super_id) REFERENCES employee(emp_id) 
ON DELETE SET NULL;

-- Установка связи между столбцом "branch_id" из таблицы employee и столбцом "branch_id" из таблицы branch
ALTER TABLE employee 
ADD FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
ON DELETE SET NULL;

-- Создание таблицы Client
CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

-- Создание таблицы Works_With
CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- Создание таблицы branch supplier
CREATE TABLE branch_supplier(
	branch_id INT,
    supplier_name VARCHAR(40),
    supplier_type VARCHAR(40),
    PRIMARY KEY (branch_id, supplier_name),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- INSERTING VALUES

INSERT INTO employee VALUES (100, 'David', 'Wallace', '1997-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES (1, 'Corporate', 100, '2006-02-09');
UPDATE employee SET branch_id = 1 WHERE emp_id = 100;

INSERT INTO employee VALUES (101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

INSERT INTO employee VALUES (102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES (2, 'Scranton', 102, '1992-04-06');
UPDATE employee SET branch_id = 2 WHERE emp_id = 102;

INSERT INTO employee VALUES (103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2); 
INSERT INTO employee VALUES (104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES (105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2); 

INSERT INTO employee VALUES (106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES (3, 'Stamford', 106, '1998-02-13');
UPDATE employee SET branch_id = 3 WHERE emp_id = 106;

INSERT INTO employee VALUES (107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES (108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- BRANCH_SUPPLIER TABLE
INSERT INTO branch_supplier VALUES (2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES (2, 'Uni-Ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES (3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES (2, 'J.T. Forms & Labels','Custom Forms');
INSERT INTO branch_supplier VALUES (3, 'Uni-Ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES (3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES (3, 'Stamford Labels', 'Custom Forms');


-- CLIENT TABLE
INSERT INTO client VALUES (400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES (401, 'Lackawana Country', 2);
INSERT INTO client VALUES (402, 'FedEx', 3);
INSERT INTO client VALUES (403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES (404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES (405, 'Times Newspaper', 3);
INSERT INTO client VALUES (406, 'FedEx', 2);



-- WORKS_WITH TABLE
INSERT INTO works_with VALUES (105, 400, 55000);
INSERT INTO works_with VALUES (102, 401, 267000);
INSERT INTO works_with VALUES (108, 402, 22500);
INSERT INTO works_with VALUES (107, 403, 5000);
INSERT INTO works_with VALUES (108, 403, 12000);
INSERT INTO works_with VALUES (105, 404, 33000);
INSERT INTO works_with VALUES (107, 405, 26000);
INSERT INTO works_with VALUES (102, 406, 15000);
INSERT INTO works_with VALUES (105, 406, 130000);

SELECT * FROM employee;

-- MORE BASIC QUERIES

-- Find all emplyees
SELECT * from employee;

-- Find all clients
SELECT * FROM client;

-- Find all employees ordered by salary
SELECT * FROM employee ORDER BY salary DESC;

-- Find all employees ordered by sex then name
SELECT * FROM employee ORDER BY SEX, first_name, last_name;

-- Find the first 5 employees in the table
SELECT * FROM employee LIMIT 5;

-- Find the first_name and last_name of all employees
SELECT first_name, last_name FROM employee;

-- Find forename and surname of all employees
SELECT first_name AS forename, last_name AS surname FROM employee;

-- Find out all the different branch_id
SELECT DISTINCT branch_id FROM employee; 


-- FUNCTIONS

SELECT * FROM employee;

-- Find number of all employees
SELECT COUNT(emp_id) FROM employee;

-- Find the number of female employees born after 1970
SELECT COUNT(emp_id) FROM employee
WHERE sex = 'F' AND  birth_date > '1971-01-01';

-- Find the average salary of all employee's where sex is male
SELECT AVG(salary) FROM employee
WHERE sex = 'M';

-- Find the sum of all employee's salaries
SELECT SUM(salary) FROM employee;

-- Find out how many males and females there are
SELECT COUNT(sex) FROM employee;

-- If you want to count how many males and females exactly, then use GROUP BY
SELECT COUNT(sex), sex FROM employee
GROUP BY sex;

SELECT * FROM works_with;
-- Find the total sales from each salesman
SELECT SUM(total_sales), emp_id FROM works_with 
GROUP BY emp_id;