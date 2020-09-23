USE Lab_9
-------------------TASK_1------------------------
SELECT Id, FName, SName, ((select sum(Salary) from Worker)/(select count(*) from worker))
 as "Avórage salary" FROM WORKER group by Id,FName,SName;


-------------------TASK_2------------------------
select sum(salary) from worker group by level;
GO
Declare @lvlSalary int
select @lvlSalary = sum(salary) from worker group by level;

SELECT Id, FName, SName,level, count(id) over(Partition by level) as "Count of Workers", 
((sum(Salary)*100.00)/@lvlSalary) FROM WORKER group by Id,FName,SName,level;


-------------------TASK_3------------------------
select (sum(salary)) from worker group by position

GO
Declare @lvlSalary int
select @lvlSalary = sum(salary) from worker group by position;

SELECT Id, FName, SName,position, count(id) over(Partition by position) as "Count of Workers", 
((sum(Salary)*100.00)/@lvlSalary)  FROM WORKER group by Id,FName,SName,position;

--3
SELECT * , ROW_NUMBER() OVER(PARTITION BY Sex ORDER BY Level) AS rownum
FROM Worker;

--4. ROW_NUMBER() delete dublicates
SELECT count(*) FROM Worker;

delete x from 
(
  select *, rn=row_number() over (partition by sex order by level)
  from worker 
) x
where rn > 1;


--5
SELECT Worker.Id, RANK() OVER(ORDER BY SUM(Worker.Job) DESC) AS rank, sum(Salary) as "Salary"
FROM Worker  JOIN VACANCY ON Worker.Job = VACANCY.Id GROUP BY Worker.Id;







-----TASK_6----------------------
SELECT Position, FName,
  count([]) as [Count]
FROM Service GROUP BY ServiceName, ServiceCustomer;
