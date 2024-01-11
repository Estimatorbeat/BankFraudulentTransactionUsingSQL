create table fraudulent(
step int,
type varchar(20),
amount float,
nameorig varchar(50),
oldbalanceorg float,
newbalanceorig float,
namedest varchar(50),
oldbalancedest float,
newbalancedest float,
isfraud int,
isflaggedFraud int
);

select *
from fraudulent;

copy public.fraudulent
from 'C:\Users\DAMILOLA\Desktop\SQL Database\Assignment\Fraudulent Transactions.csv'
delimiter ',' csv header


--1. How many transactions occurred per transaction type?

select type, count(*) as "transaction occured" 
from fraudulent
group by "type"
order by "type"


--2. Which Transaction Type has the highest number of Fraudulent Transactions?

select type, count (distinct "amount") as "No of fraudulent transaction"
from fraudulent
where isfraud = 1
Group by "type"
Order by "No of fraudulent transaction" Desc
limit 1;

--3. What is the average fraudulent transaction amount?

select round(avg(amount)) as "average_fraudulent_transaction"
from fraudulent
where isfraud = 1;

--4. What is the Maximum fraudulent transaction amount?
select max(amount) as "max_fraudulent_transaction"
from fraudulent
where isfraud = 1;

--5. What is the Minimum fraudulent transaction amount?
select min(amount) as "min_fraudulent_amount"
from fraudulent
where isfraud = 1
group by "amount"
order by "min_fraudulent_amount"
offset 1
limit 1;

--6. Who are the Top 10 customers with the highest amount defrauded?

select distinct "nameorig", amount as  "total_fraudulent_amount"
from fraudulent
where isfraud = 1
order by "nameorig" Desc
limit 10;



--7. How effective is the bank in flagging fraud?

select count(distinct "amount")
from fraudulent
where "amount" between 200000 and 10000000


select count (distinct "amount")
from fraudulent
where isfraud = 1

--From the information I got from the query giving, I derive an insight that;
--The total number of fraudulent transaction was 3977 and the
--The total number of fraudulent transaction flagged for fraud is 7176
--So to my conclusion I can say the banking system is more effective in flagging fraudulent transaction, giving room to identify 3199 fraudulent transactions flagged for fraud


--8. Who are the Top 20 Fraudsters
select distinct "nameorig", amount as "Top_20_fraudsters"
from fraudulent
where isfraud = 1
order by "nameorig" Desc
limit 20;
