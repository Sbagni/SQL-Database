--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e
.last_name, e.first_name, e.gender,s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;
--List employees who were hired in 1986.

select * from employees
where hire_date between ('1986-01-01') and ('1986-12-31');

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT e.dept_no, d.dept_name, e.emp_no,e.from_date,e.to_date,f.first_name,f.last_name
FROM departments AS d
INNER JOIN dept_manager AS e ON
d.dept_no=e.dept_no
left join employees as f on
e.emp_no = f.emp_no
;
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT  f.emp_no,f.first_name,f.last_name,d.dept_name
from employees as f
INNER JOIN dept_emp AS e ON
e.emp_no=f.emp_no
left join departments as d on
d.dept_no=e.dept_no
;
--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'and last_name like 'B%'
;
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_no from departments
where dept_name = 'Sales';
--d007 as sales
select f.emp_no, e.first_name,e.last_name,d.dept_name
from dept_emp as f
left join departments as d on
f.dept_no = d.dept_no
inner join employees as e on
f.emp_no = e.emp_no
where f.dept_no = 'd007'
;
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_no from departments
where dept_name = 'Development';
--d005 as development
select f.emp_no, e.first_name,e.last_name,d.dept_name
from dept_emp as f
left join departments as d on
f.dept_no = d.dept_no
inner join employees as e on
f.emp_no = e.emp_no
where f.dept_no in ('d007','d005')
;
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC;
