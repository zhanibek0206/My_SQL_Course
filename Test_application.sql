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
