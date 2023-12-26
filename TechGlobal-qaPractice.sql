--1
SELECT first_name, last_name 
FROM employees 
WHERE salary > (SELECT AVG(salary)from employees);

--2
SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.first_name = 'Payam';

--3
SELECT e.department_id, e.first_name, e.last_name, e.job_id, d.department_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.department_name = 'Finance';

--4
SELECT * FROM employees
WHERE  salary < 2500 AND salary > (SELECT min(salary) from employees);

--5
SELECT e.first_name, e.last_name, d.department_id, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id;

--6
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.department_id = 80 OR d.department_id = 40;

--7
SELECT first_name, last_name, hire_date from employees
WHERE first_name != 'Clara' AND department_id = 
(SELECT department_id FROM employees WHERE first_name = 'Clara' );

--8
SELECT employee_id, first_name, last_name, salary from employees
WHERE salary > (SELECT avg(salary) from employees) AND department_id IN (SELECT department_id FROM employees WHERE first_name LIKE '%J%');

--9
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%z%';

--10
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id;

--11
SELECT e.employee_id, e.first_name, e.last_name, e.job_id, j.job_title 
from employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary < (SELECT max(e.salary) from employees e WHERE job_id = 'PU_MAN');

--12
SELECT e.employee_id, e.first_name, e.last_name, e.job_id, j.job_title 
from employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.job_id != 'PU_MAN' AND e.salary > (SELECT max(e.salary) from employees e WHERE job_id = 'PU_MAN');

--13
SELECT employee_id, first_name, last_name, job_id from employees
WHERE salary > ANY (SELECT avg(salary) from employees
group by department_id);

--14
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 0;

--15
SELECT salary, last_name, first_name 
FROM employees
WHERE
salary < (SELECT salary from employees WHERE employee_id = 182 );

--16
SELECT e.first_name AS employee_name, m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id

--17
SELECT d.department_name, l.city, l.state_province, d.department_id
FROM departments d
JOIN locations l ON d.location_id  = l.location_id

--18
SELECT first_name, last_name FROM employees
WHERE salary > (select avg(salary) from employees) AND job_id like '%IT%'

--19
SELECT e.first_name, e.last_name, e.department_id, d.department_name 
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id

--20
SELECT e.first_name AS employee_name, m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
WHERE m.manager_id IS NULL OR m.manager_id NOT IN (SELECT employee_id FROM employees)

--21

SELECT first_name, last_name FROM employees
where salary > (select salary from employees where employee_id = 163);

--22

SELECT first_name, last_name, salary, department_id, job_id FROM employees
where department_id in (select department_id FROM employees where employee_id = 169 );
   
--23

SELECT first_name, last_name, department_id FROM employees
where department_id in (select department_id FROM employees where last_name = 'Taylor');

--24

SELECT m.department_id, m.first_name , m.last_name 
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;


--25
 select j.employee_id, j.start_date, j.end_date, j.job_id, j.department_id from job_history j
 join employees e
 on j.employee_id = e.employee_id
 where e.salary >= 12000;
 
 --26 ?
 
 SELECT first_name, last_name, salary, department_id FROM employees
 WHERE 
    salary = (SELECT MIN(salary) FROM employees);


---27

select * FROM employees
where salary = 3000
and manager_id = 121;

--28
SELECT 
    e.first_name,
    e.last_name,
    e.employee_id,
    e.job_id
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
WHERE 
    l.city = 'Toronto';

--29

SELECT 
    e.first_name,
    e.last_name,
    e.department_id
FROM 
    employees e
    where salary > 3700;
    
    
--30

select * from employees
where salary > (select salary from employees where last_name ='Russell');

--31

select first_name, last_name from employees
where manager_id is null;

--32

select department_id, count(*) from employees
group by department_id;

--33

select e.last_name, l.city from employees e 
join departments d
on e.department_id = d.department_id 
join locations l
on d.location_id = l.location_id;

--34

select j.job_title, avg(e.salary) from jobs j
join employees e
on e.job_id = j.job_id
group by job_title;

--35

select e.last_name, d.department_name, l.city from employees e
join departments d
on e.department_id = d.department_id 
join locations l
on d.location_id = l.location_id;

--36

select first_name, last_name from employees
where department_id is null;


---37
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS num_employees
FROM 
    departments d
LEFT JOIN 
    employees e ON d.department_id = e.department_id
GROUP BY 
    d.department_name;

--38
select e.first_name, e.last_name, department_name from employees e
join departments d
on e.department_id = d.department_id 
where e.salary > 10000;

--39

SELECT 
    department_id,
    last_name,
    AVG(salary) AS average_salary
FROM 
    employees
GROUP BY 
    department_id, last_name
HAVING 
    AVG(salary) > 7000;
    
--40

select first_name, last_name from employees e 
join departments d 
on e.department_id = d.department_id
where department_name = 'IT';

---41

SELECT
    e.first_name,
    e.last_name
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.salary > 0.5 * (
        SELECT
            SUM(salary)
        FROM
            employees e2
        WHERE
            e2.department_id = e.department_id
    );

--42
SELECT first_name, last_name from employees
JOIN employees m ON e.employee_id = m.manager_id;

--43
SELECT d.department_code, d.department_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'London';

--44
SELECT FirstName, LastName, Salary, DepartmentID
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees)
ORDER BY Salary DESC;

--45
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary)  FROM employees WHERE department_id = 40)

--46
SELECT d.department_name, d.department_id
FROM departments d
WHERE d.location_id = (SELECT location_id FROM departments WHERE department_id = 30);

--47
SELECT d.department_ID, d.department_name, d.manager_id, d.location_id
FROM departments d
JOIN employees e ON e.department_id = d.department_id
WHERE e.first_name = 'Susan';

--48
SELECT d.department_name, l.city
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_id = 'US';

--49
SELECT e.first_Name, e.last_Name, d.department_name
FROM Employees e
JOIN Departments d ON e.Department_ID = d.Department_ID
WHERE e.Last_Name LIKE 'S%';

--50
SELECT d.department_name, COUNT(e.Department_ID) AS num_employees
FROM Departments d
JOIN Employees e ON d.Department_ID = e.Department_ID
GROUP BY d.department_name
HAVING COUNT(e.Department_ID) > 2
ORDER BY num_employees DESC;
