-- и '#' Однострочные комментарий После "--" обязателен пробел.
# ТОже однострочнфй комментарий
/*
Многострочный 
комментарийalter
*/
-- 1. Создание БД, с которой  будет взаимодействовать
-- snake-case - все с маленькой буквы и с нижним подчеркиванием - для имен столбцов, БД, таблицa
CREATE DATABASE lesson_1; -- Создание БД с именем lesson_1
CREATE DATABASE IF NOT EXISTS lesson_1; -- Создание БД с именем lesson_1 с проверкой и если есть в наличии то выводить предупреждение

-- 2. Подключение к БД
USE lesson_1; -- Подключение к БД с именем lesson_1
 
 -- 3. Создание таблицы - студент - избегаем множественного числа
DROP TABLE IF EXISTS student; -- Удаляю таблицу со студентами, елси она существует
CREATE TABLE student
(
-- Формула стоблца: имя_столбца, тип_данных, свойства
-- PRIMARY KEY = UNIQUE NOT NULL
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(45), -- строчка на 45 символов
email VARCHAR(45) NOT NULL, -- строчка на 45 символов
phone VARCHAR(45)
);

-- 4. Таблица заполняется магическими данными
INSERT student (firstname, email, phone)
VALUES
('Андрей', "dfshkjfhdk@gmail.com", NULL),
('Антон', "df23tdk@gmail.com", 385696),
('Артем', "d_fgil.com", 314123416),
('Алексей', "g34jfhdk@gmail.com", 123416),
('Александр', "vwadhkjfhdk@gmail.com", 324116),
('Александра', "d4513hdk@gmail.com", 13245416),
('Виктор', "d4513hdk@gmail.com", 13245416);
-- Все студенты
SELECT * FROM student
-- Получить информацию о студентах: имена и почты
SELECT firstname, email
FROM student;

-- Получить информацию о Антоне, его почту и телефон

SELECT firstname, email, phone -- firstname - здесь, чтобы проверить Антон или нет
FROM student
WHERE firstname = 'Антон'; -- можно писать в любом регистре АНТОН = антон = АнТон

-- Получаем данные обо всех студентах кроме Антона
SELECT firstname, email, phone
FROM student
WHERE firstname != 'Антон';  -- "<>" и "!=" - одно и тоже

-- Найти информацию о студентах, имена которых начинаются с буквы "А"
SELECT firstname, email, phone
FROM student
WHERE firstname LIKE "А%";  -- LIKE "phone%" (подстрочка любой длины)=> phone 14, phone XR и т.п. любые значения после phone. LIKE "phone _4" (_ - только один символ) => phone 14, phone R4 и т.п.
SELECT firstname, email, phone
FROM student
WHERE firstname LIKE "А%е%";