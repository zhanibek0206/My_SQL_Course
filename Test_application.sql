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
