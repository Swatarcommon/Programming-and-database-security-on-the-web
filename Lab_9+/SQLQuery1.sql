USE FORLAB

--1
SELECT count(*) FROM PEOPLE
	WHERE Age BETWEEN 20 AND 40;
---------------------------------------
SELECT Id, Age, Salary, RANK() OVER(ORDER BY SUM(PEOPLE.Job)) AS rank
	,(100.00*Salary / (sum(Salary) OVER()))/100.00 AS "%"  
FROM PEOPLE
group by Id, Salary, Age;

---------------------------------------
SELECT SomeJob.Id, People.Job
	,count(PEOPLE.Job) OVER()
	, count(SomeJob.Id)
	,count(SomeJob.Id) OVER()
	,(100.00 / (count(SomeJob.Id)))/100.00 AS "%"  
FROM PEOPLE
	join SomeJob ON PEOPLE.Job = SomeJob.Id
GROUP BY PEOPLE.Job, SomeJob.Id;

--3
SELECT * , ROW_NUMBER() OVER(PARTITION BY Age ORDER BY Age) AS rownum
FROM PEOPLE;

--4. ROW_NUMBER() delete dublicates
SELECT count(*) FROM PEOPLE;

delete x from 
(
  select *, rn=row_number() over (partition by Age order by Age)
  from PEOPLE 
) x
where rn > 1;


--5
SELECT PEOPLE.Job, count(PEOPLE.Job) as count,
  RANK() OVER(ORDER BY SUM(PEOPLE.Job) DESC) AS rank
FROM PEOPLE
  JOIN SomeJob ON PEOPLE.Job = SomeJob.Id
GROUP BY PEOPLE.Job;