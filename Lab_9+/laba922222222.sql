use Services;

select * from Service;
--2

declare @t table (a float)
DECLARE @counts1 float;
DECLARE @counts2 float;
DECLARE @max float;
DECLARE @datafromrange float;

SELECT @datafromrange =  COUNT(*) from Service Where Service.ServiceDate BETWEEN '2018-06-01' AND '2019-06-01' and Service.ServiceName='Delivery food';
SELECT @counts1  = COUNT(*) from Service Where Service.ServiceDate BETWEEN '2019-01-01' AND '2019-12-31' and Service.ServiceName='Delivery food';
SELECT @counts2 = COUNT(*) from Service Where Service.ServiceDate BETWEEN '2018-01-01' AND '2018-12-31' and Service.ServiceName='Delivery food';

insert into @t (a) select @counts1 union all select @counts2

DECLARE @middle float = 100 *(@datafromrange/((@counts1 + @counts2)/2));
SELECT @max = MAX(a) from @t;
DECLARE @maxdata float = 100 *(@datafromrange/@max);

print(@datafromrange)
print (@middle)
print(@maxdata)

--3. 
DECLARE
  @pagenum  AS INT = 1,
  @pagesize AS INT = 20;
WITH C AS
(
  SELECT ROW_NUMBER() OVER(ORDER BY [ServiceName]) AS rownum,
    [ServiceName], [ServiceCustomer], [ServiceCost], [ServiceDate]
  FROM Service
)
SELECT rownum,  [ServiceName], [ServiceCustomer], [ServiceCost], [ServiceDate] FROM C
WHERE rownum BETWEEN (@pagenum - 1) * @pagesize + 1 AND @pagenum * @pagesize ORDER BY rownum;

--4.
SELECT count(*) FROM Service;

delete x from (
  select *, rn=row_number() over (partition by   [ServiceName], [ServiceCustomer] order by [ServiceName])from Service
) x
where rn > 1;

--5 
select 
	ServiceCustomer,
	month(ServiceDate) as [Month],
	count(*) as [Count]
	from Service where Month(ServiceDate) between month((select max([ServiceDate]) from Service)) - 5 and month((select max(ServiceDate) from Service))
group by month(ServiceDate), ServiceCustomer


--6
SELECT ServiceCustomer as Customer, ServiceName,
  count([ServiceName]) as [Count]
FROM Service GROUP BY ServiceName, ServiceCustomer;
