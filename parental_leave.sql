select * from parents_leave;

describe parents_leave;

select count(*) from parents_leave;

select count(Paid_Maternity_Leave)
from parents_leave
where Paid_Maternity_Leave <> '0';

select count(Paid_Paternity_Leave)
from parents_leave
where Paid_Paternity_Leave <> '0';

select count(Unpaid_Maternity_Leave)
from parents_leave
where  Unpaid_Maternity_Leave <> '0';

select  count(Unpaid_Paternity_Leave)
from parents_leave
where Unpaid_Paternity_Leave <> '0';

select count(Paid_Maternity_Leave)
from parents_leave
where Paid_Maternity_Leave = '0';

select count(Paid_Paternity_Leave)
from parents_leave
where Paid_Paternity_Leave ='0';


-- Identify the difference btween Maternity and Patenity leave 
select max(Paid_Maternity_Leave), max(Paid_Paternity_Leave)
from parents_leave;

-- companies that offer the most paid maternity leave 
select Company, max(Paid_Maternity_Leave)
from parents_leave
where Paid_Maternity_Leave in (select max(Paid_Maternity_Leave) from parents_leave)
group by Company;

-- companies that offer the most paid paternity leave 
select Company, max(Paid_Paternity_Leave)
from parents_leave
where Paid_Paternity_Leave in (select max(Paid_Paternity_Leave) from parents_leave)
group by Company;

-- companies that do not offer paid paternity leave 
select Company, min(Paid_Paternity_Leave)
from parents_leave
where Paid_Paternity_Leave in (select min(Paid_Paternity_Leave) from parents_leave)
group by Company;

-- companies that do not offer paid maternity leave 

select Company, min(Paid_Maternity_Leave)
from parents_leave
where Paid_Maternity_Leave in (select min(Paid_Maternity_Leave) from parents_leave)
group by Company;

-- Avg weeks given for both Paid_maternity and paternity leave

select format(avg(Paid_Maternity_Leave), 0)  as paid_maternity_leave, format(avg(Paid_Paternity_Leave), 0) as Paid_paternity_leave
from parents_leave;

-- Avg weeks given for both unPaid_maternity and unpaternity leave

select format(avg(Unpaid_Maternity_Leave), 0)  as  unpaid_maternity_leave, format(avg(Unpaid_Paternity_Leave), 0) as unPaid_paternity_leave
from parents_leave;

-- Industries that offer paid parental leave 

select Industry, count(Paid_Maternity_Leave) as Paid_Maternity_Leave, count(Paid_Paternity_Leave)as Paid_Paternity_Leave
from parents_leave
group by Industry
order by count(Paid_Maternity_Leave) desc;

-- industries that offer unpaid parental leave 

select Industry, count(Unpaid_Maternity_Leave) as Unpaid_Maternity_Leave , count(Unpaid_Paternity_Leave) as Unpaid_Paternity_Leave
from parents_leave
group by Industry
order by count(Unpaid_Maternity_Leave) desc;

-- Paid maternity distribution
select 
case when Paid_Maternity_Leave between 1 and 12 then '1-12'
     when Paid_Maternity_Leave between 12 and 22 then '12-22'
     when Paid_Maternity_Leave between 22 and 32 then '22-32'
     when Paid_Maternity_Leave between 32 and 42 then '32-42'
     when Paid_Maternity_Leave between 42 and 52 then '42-52'
     else '0'
     end as Paid_maternity_dis,
	     count(*) 
     from parents_leave
     group by Paid_maternity_dis;
	
    -- paid paternity leave  distribtion 
     select 
case when Paid_Paternity_Leave between 1 and 12 then '1-12'
     when Paid_Paternity_Leave between 12 and 22 then '12-22'
     when Paid_Paternity_Leave between 22 and 32 then '22-32'
     when Paid_Paternity_Leave between 32 and 42 then '32-42'
     when Paid_Paternity_Leave between 42 and 52 then '42-52'
     else '0'
     end as Paid_paternity_dis,
	     count(*) 
     from parents_leave
     group by Paid_paternity_dis;
     
    --  unpaid maternity leave  distribtion 
     select 
case when Unpaid_Maternity_Leave between 1 and 12 then '1-12'
     when Unpaid_Maternity_Leave between 12 and 22 then '12-22'
     when Unpaid_Maternity_Leave between 22 and 32 then '22-32'
     when Unpaid_Maternity_Leave between 32 and 42 then '32-42'
     when Unpaid_Maternity_Leave between 42 and 52 then '42-52'
     else '0'
     end as UnPaid_maternity_dis,
	     count(*) 
     from parents_leave
     group by UnPaid_maternity_dis;
     
     -- unpaid paternity leave  distribtion 
         select 
case when Unpaid_Paternity_Leave between 1 and 12 then '1-12'
     when Unpaid_Paternity_Leave between 12 and 22 then '12-22'
     when Unpaid_Paternity_Leave between 22 and 32 then '22-32'
     when Unpaid_Paternity_Leave between 32 and 42 then '32-42'
     when Unpaid_Paternity_Leave between 42 and 52 then '42-52'
     else '0'
     end as UnPaid_paternity_dis,
	     count(*) 
     from parents_leave
     group by UnPaid_paternity_dis;
     
     -- summarise all the leave columns to identify the distributio of parental weeks offered
     -- create a new column 
     alter table parents_leave add Total_parental_leave int;
     
     -- sum the values 
     update parents_leave set Total_parental_leave =coalesce(Paid_Maternity_Leave, 0) +
													coalesce(Unpaid_Maternity_Leave, 0) +
													coalesce(Paid_Paternity_Leave, 0) +
                                                    coalesce(Unpaid_Paternity_Leave, 0);
  
  -- Distribution of parental weeks offered
  
  select 
  case when Total_parental_leave between 1 and 12 then '1-12'
       when Total_parental_leave between 12 and 22 then '12-22'
       when Total_parental_leave between 22 and 32 then '22-32'
       when Total_parental_leave between 32 and 42 then '32-42'
       when Total_parental_leave between 42 and 52 then '42-52'
       else 0
       end as Parental_leave_dis,
       count(*)
       from parents_leave
       group by Parental_leave_dis;
	
    
select Total_parental_leave from parents_leave;
describe parents_leave;
select Paid_Paternity_Leave from parents_leave;





















































