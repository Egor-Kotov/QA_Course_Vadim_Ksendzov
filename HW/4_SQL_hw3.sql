--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
SELECT e.employee_name AS employee, s.monthly_salary AS salary
FROM employees AS e 
FULL OUTER JOIN  employee_salary AS es 
ON e.id = es.employee_id 
INNER JOIN salary AS s 
ON es.salary_id = s.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
SELECT e.employee_name AS employee, s.monthly_salary AS salary
FROM employees AS e 
FULL OUTER JOIN employee_salary AS es 
ON e.id = es.employee_id 
INNER JOIN salary AS s 
ON s.id = es.salary_id 
WHERE s.monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT es.employee_id, e.employee_name AS employee, s.monthly_salary AS salary
FROM salary AS s 
LEFT JOIN employee_salary AS es 
ON s.id = es.salary_id
LEFT JOIN employees AS e 
ON es.employee_id = e.id 
WHERE e.employee_name is null;

-- 4. Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT es.employee_id, e.employee_name AS employee, s.monthly_salary AS salary
FROM salary AS s 
LEFT JOIN employee_salary AS es 
ON s.id = es.salary_id
LEFT JOIN employees AS e 
ON es.employee_id = e.id 
WHERE e.employee_name is null AND s.monthly_salary < 2000; 

-- 5. Найти всех работников кому не начислена ЗП.
SELECT e.employee_name AS employee, s.monthly_salary AS salary
FROM employees AS e 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s ON es.salary_id = s.id 
WHERE s.monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.
SELECT e.employee_name AS employee, r.role_name
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id;

-- 7. Вывести имена и должность только Java разработчиков.
SELECT e.employee_name AS employee, r.role_name
FROM employees AS e 
INNER JOIN roles_employee AS re 
ON e.id = re.employee_id 
INNER JOIN roles AS r 
ON re.role_id = r.id 
WHERE r.role_name LIKE '%Java dev%';

-- 8. Вывести имена и должность только Python разработчиков.
SELECT e.employee_name AS employee, r.role_name
FROM employees AS e 
INNER JOIN roles_employee AS re 
ON e.id = re.employee_id 
INNER JOIN roles AS r 
ON re.role_id = r.id 
WHERE r.role_name LIKE '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
SELECT e.employee_name AS employee, r.role_name
FROM employees AS e 
INNER JOIN roles_employee AS re 
ON e.id = re.employee_id 
INNER JOIN roles AS r 
ON re.role_id = r.id
WHERE r.role_name LIKE '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.
SELECT e.employee_name AS employee, r.role_name
FROM employees AS e 
INNER JOIN roles_employee AS re 
ON e.id = re.employee_id 
INNER JOIN roles AS r 
ON re.role_id = r.id 
WHERE r.role_name LIKE '%Manual%';

-- 11. Вывести имена и должность автоматизаторов QA
SELECT e.employee_name AS employee, r.role_name
FROM employees AS e 
INNER JOIN roles_employee AS re 
ON e.id = re.employee_id 
INNER JOIN roles AS r 
ON re.role_id = r.id 
WHERE r.role_name LIKE '%Automation%';

-- 12. Вывести имена и зарплаты Junior специалистов
SELECT e.employee_name AS employee, s.monthly_salary
FROM employees AS e 
INNER JOIN roles_employee AS re 
ON e.id = re.employee_id 
INNER JOIN roles AS r 
ON re.role_id = r.id
INNER JOIN employee_salary AS es 
ON e.id = es.employee_id 
INNER JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
SELECT e.employee_name AS employee, s.monthly_salary
FROM employees AS e 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
LEFT JOIN roles_employee AS re 
ON re.employee_id = e.id 
LEFT JOIN roles AS r 
ON r.id = re.role_id 
WHERE r.role_name LIKE '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
SELECT e.employee_name AS employee, s.monthly_salary
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
SELECT s.monthly_salary
FROM roles AS r 
LEFT JOIN roles_employee AS re 
ON r.id = re.role_id 
LEFT JOIN employees AS e  
ON re.employee_id = e.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%Java dev%';

-- 16. Вывести зарплаты Python разработчиков
SELECT s.monthly_salary
FROM roles AS r 
LEFT JOIN roles_employee AS re 
ON r.id = re.role_id 
LEFT JOIN employees AS e  
ON re.employee_id = e.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
SELECT e.employee_name, s.monthly_salary
FROM roles AS r 
LEFT JOIN roles_employee AS re 
ON r.id = re.role_id 
LEFT JOIN employees AS e  
ON re.employee_id = e.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
SELECT e.employee_name, s.monthly_salary
FROM roles AS r 
LEFT JOIN roles_employee AS re 
ON r.id = re.role_id 
LEFT JOIN employees AS e  
ON re.employee_id = e.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%Middle JavaS%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
SELECT e.employee_name, s.monthly_salary
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id  = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%Senior Java%';

-- 20. Вывести зарплаты Junior QA инженеров
SELECT s.monthly_salary 
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
LEFT JOIN employee_salary AS es 
ON e.id  = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id
WHERE r.role_name LIKE '%Junior%' AND r.role_name LIKE '%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
SELECT AVG(s.monthly_salary) AS avg_salary_Junior
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
SELECT SUM(s.monthly_salary) AS sum_salary_JS_dev
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id
WHERE r.role_name LIKE '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров
SELECT min(s.monthly_salary) AS min_salary_QA
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
LEFT JOIN  employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
SELECT max(s.monthly_salary) AS max_salary_QA
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
LEFT JOIN employee_salary AS es 
ON  e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%QA%';

-- 25. Вывести количество QA инженеров
SELECT count(e.employee_name) AS quantity_of_QA
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id  = r.id 
WHERE r.role_name LIKE '%QA%';

-- 26. Вывести количество Middle специалистов.
SELECT count(e.employee_name) AS quantity_of_Middle
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
WHERE r.role_name LIKE '%Middle%';

-- 27. Вывести количество разработчиков
SELECT count(e.employee_name) AS quantity_of_developer
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
WHERE r.role_name LIKE '%dev%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT sum(s.monthly_salary)
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
LEFT JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE r.role_name LIKE '%dev%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
SELECT e.employee_name, r.role_name, s.monthly_salary 
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id
FULL OUTER JOIN employee_salary AS es 
ON e.id = es.employee_id
LEFT JOIN salary AS s 
ON es.salary_id = s.id
ORDER BY s.monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
FULL OUTER JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE s.monthly_salary between 1700 AND 2300
ORDER BY s.monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
FULL OUTER JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE s.monthly_salary < 2300
ORDER BY s.monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees AS e 
LEFT JOIN roles_employee AS re 
ON e.id = re.employee_id 
LEFT JOIN roles AS r 
ON re.role_id = r.id 
FULL OUTER JOIN employee_salary AS es 
ON e.id = es.employee_id 
LEFT JOIN salary AS s 
ON es.salary_id = s.id 
WHERE s.monthly_salary IN (1100, 1500, 2000)
ORDER BY s.monthly_salary;
