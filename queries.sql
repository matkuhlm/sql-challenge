--Employees with their salaries
select emp.emp_no,
emp.last_name,emp.first_name,emp.sex, sal.salary
from employees as emp
	left join salaries as sal
	on (emp.emp_no = sal.emp_no)
order by emp.emp_no;

--employees hired in 1986 with fname, lname, and hire date
select last_name, first_name, hire_date
from employees
where hire_date between '1986-01-01'and '1986-12-31';

--Dept managers with dept no, dept name, employee num, last name, first name
select
dm.dept_no,
d.dept_name,
dm.emp_no,
em.last_name,
em.first_name
from dept_manager as dm
	inner join departments as d
	on (dm.dept_no = d.dept_no)
	inner join employees as em
	on (dm.emp_no = em.emp_no);
	

--each employee with: dept, em no, last, first, dept name
select
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees as e
	inner join dept_emp as dpe
	on (e.emp_no = dpe.emp_no)
	inner join departments as d
	on (dpe.dept_no = d.dept_no);
	
--all employees with Hercules B showing: First name, last name, sex
select 
first_name,
last_name,
sex
from employees
where first_name = 'Hercules'
and
last_name like 'B%'
;
--why are there so many people named hercules? wild...

--all sales staff showing: Emp no, last name, first name, dept name
select
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees as e
	inner join dept_emp as dpe
	on (e.emp_no = dpe.emp_no)
	inner join departments as d
	on (dpe.dept_no = d.dept_no)
	where d.dept_name = 'Sales'
	;
--all sales and dev staff showing: em no, last name, first name, dept name
select
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees as e
	inner join dept_emp as dpe
	on (e.emp_no = dpe.emp_no)
	inner join departments as d
	on (dpe.dept_no = d.dept_no)
	where d.dept_name = 'Sales' OR d.dept_name = 'Development'
	;
--frequency of last names in decending order
select
last_name,
count(last_name)
from employees
group by last_name
order by count(last_name) DESC;


