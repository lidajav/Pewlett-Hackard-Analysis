drop table retiring_title_count;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT  DISTINCT ON(t.emp_no) t.emp_no, m.first_name,m.last_name, t.title, t.from_date, t.to_date
--INTO unique_titles
FROM titles AS t
INNER JOIN employees AS m ON t.emp_no = m.emp_no
WHERE (m.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY t.emp_no ASC , t.to_date DESC;

-- Create ritiring title Table to count titles
SELECT COUNT(title), title 
--INTO retiring_title_count
FROM unique_titles
GROUP BY (title)
ORDER BY count(title) DESC;


--Create mentorship eligibility Table
SELECT DISTINCT ON (t.emp_no) m.emp_no,
m.first_name,
m.last_name,
m.birth_date,
d.from_date, d.to_date,
t.title
--INTO mentorship_eligibility
FROM employees AS m
INNER JOIN dept_emp AS d ON m.emp_no = d.emp_no
INNER JOIN titles AS t ON m.emp_no = t.emp_no
WHERE (m.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY t.emp_no ASC, t.to_date DESC ;


-- select title, emp_no from titles
-- where emp_no=10291
-- order by to_date desc;

