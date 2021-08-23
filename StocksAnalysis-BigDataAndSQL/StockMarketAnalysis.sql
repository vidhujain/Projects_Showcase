-- create schema command
-- we will create tables and data in this new schema named Assignment
-- this will be done only once
-- comment this command if the sql file has to be run again to ignore duplicate schema error

## Lets first drop schema Assignment if already existing ##
drop schema Assignment;

## Now create schema Assignment
create schema Assignment;

-- use Assignment schema
use Assignment;

######## For data import ###############
-- Please note that we have imported data using data import wizard and have selected columns 
-- 		1. Date (text)
-- 		2. Close Price (double)
-- 		3. WAP (double)
-- 		4. No.of Shares (int)
-- 		5. No. of Trades (int)
-- 		6. Total Turnover (Rs.) (double)
-- There were some cells in csv file which had null values like for column 'Deliverable Quantity' has no value for date '9-Dec-2015'
-- Since we have not selected that column so such null values will not affect the data import
-- During Data Import using wizard the tables will be auto created with the names as below
-- Data has been imported in table named
	-- 1. bajaj_auto
    -- 2. eicher_motors
    -- 3. hero_motocorp
    -- 4. infosys
    -- 5. tcs
    -- 6. tvs_motors
-- Total 889 records were imported using Table data import wizard
########################### Question 1 ####################################
-- 1. Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. 
-- 		(This has to be done for all 6 stocks)

################ Solution for Question1 begins ##########################
########## bajaj_auto ##########
-- lets check the data description of bajaj_auto table
desc bajaj_auto;

-- total number of records in bajaj_auto table
select count(*) from bajaj_auto;

-- lets view first few rows of bajaj_auto table
select * from bajaj_auto limit 5;

########### eicher_motors ##########
-- lets check the data description of eicher_motors table
desc eicher_motors;

-- total number of records in eicher_motors table
select count(*) from eicher_motors;

-- lets view first few rows of eicher_motors table
select * from eicher_motors limit 5;

########### hero_motocorp ##########
-- lets check the data description of hero_motocorp table
desc hero_motocorp;

-- total number of records in hero_motocorp table
select count(*) from hero_motocorp;

-- lets view first few rows of hero_motorcorp table
select * from hero_motocorp limit 5;

########### infosys ##########
-- lets check the data description of infosys table
desc infosys;

-- total number of records in infosys table
select count(*) from infosys;

-- lets view first few rows of infosys table
select * from infosys limit 5;

########### tcs ##########
-- lets check the data description of tcs table
desc tcs;

-- total number of records in tcs table
select count(*) from tcs;

-- lets view first few rows of tcs table
select * from tcs limit 5;

########### tvs_motors ##########
-- lets check the data description of tvs_motors table
desc tvs_motors;

-- total number of records in tvs_motors table
select count(*) from tvs_motors;

-- lets view first few rows of tvs_motors table
select * from tvs_motors limit 5;

########## convert date column #############
-- we need "date" column to be in date format as 'dd-mm-yyyy' and then convert the text column to date

-- ### table - bajaj_auto
update bajaj_auto
set `date` = str_to_date(`date`,'%d-%M-%Y');
alter table bajaj_auto
modify `date` date;
desc bajaj_auto;
-- lets now view first few rows of bajaj_auto table
select * from bajaj_auto limit 5;

-- ### table - eicher_motors
update eicher_motors
set `date` = str_to_date(`date`,'%d-%M-%Y');
alter table eicher_motors
modify `date` date;
desc eicher_motors;
-- lets now view first few rows of eicher_motors table
select * from eicher_motors limit 5;

-- ### table - hero_motocorp
update hero_motocorp
set `date` = str_to_date(`date`,'%d-%M-%Y');
alter table hero_motocorp
modify `date` date;
desc hero_motocorp;
-- lets now view first few rows of hero_motocorp table
select * from hero_motocorp limit 5;

-- ### table - infosys
update infosys
set `date` = str_to_date(`date`,'%d-%M-%Y');
alter table infosys
modify `date` date;
desc infosys;
-- lets now view first few rows of infosys table
select * from infosys limit 5;

-- ### table - tcs
update tcs
set `date` = str_to_date(`date`,'%d-%M-%Y');
alter table tcs
modify `date` date;
desc tcs;
-- lets now view first few rows of tcs table
select * from tcs limit 5;

-- ### table - tvs_motors
update tvs_motors
set `date` = str_to_date(`date`,'%d-%M-%Y');
alter table tvs_motors
modify `date` date;
desc tvs_motors;
-- lets now view first few rows of tvs_motors table
select * from tvs_motors limit 5;

-- create table and the insert data using bajaj table with columns 20 days and 50 days moving average 
create table bajaj1(
	select `Date`, `Close Price`, 
    avg(`Close Price`) over(order by `Date` rows 19 preceding) '20 Day MA',
    avg(`Close Price`) over(order by `Date` rows 49 preceding) '50 Day MA'
    from bajaj_auto
);
-- view the records of bajaj1 table
select * from bajaj1;

-- set the previous 19 days moving average value to null since moving average for those days cant be calculated
update bajaj1
set `20 Day MA` = Null
limit 19;

-- view the records of bajaj1 table
select * from bajaj1;

-- Similarly set the previous 49 days moving average value to null since moving average for those days cant be calculated
update bajaj1
set `50 Day MA` = Null
limit 49;

-- view the records of bajaj1 table
select * from bajaj1;



-- create table and the insert data using eicher_motors table with columns 20 days and 50 days moving average 
create table eicher_motors1(
	select `Date`, `Close Price`, 
    avg(`Close Price`) over(order by `Date` rows 19 preceding) '20 Day MA',
    avg(`Close Price`) over(order by `Date` rows 49 preceding) '50 Day MA'
    from eicher_motors
);
-- view the records of eicher_motors1 table
select * from eicher_motors1;

-- set the previous 19 days moving average value to null since moving average for those days cant be calculated
update eicher_motors1
set `20 Day MA` = Null
limit 19;

-- view the records of eicher_motors1 table
select * from eicher_motors1;

-- Similarly set the previous 49 days moving average value to null since moving average for those days cant be calculated
update eicher_motors1
set `50 Day MA` = Null
limit 49;

-- view the records of eicher_motors1 table
select * from eicher_motors1;


-- create table and the insert data using hero_motocorp table with columns 20 days and 50 days moving average 
create table hero_motocorp1(
	select `Date`, `Close Price`, 
    avg(`Close Price`) over(order by `Date` rows 19 preceding) '20 Day MA',
    avg(`Close Price`) over(order by `Date` rows 49 preceding) '50 Day MA'
    from hero_motocorp
);
-- view the records of hero_motocorp1 table
select * from hero_motocorp1;

-- set the previous 19 days moving average value to null since moving average for those days cant be calculated
update hero_motocorp1
set `20 Day MA` = Null
limit 19;

-- view the records of hero_motocorp1 table
select * from hero_motocorp1;

-- Similarly set the previous 49 days moving average value to null since moving average for those days cant be calculated
update hero_motocorp1
set `50 Day MA` = Null
limit 49;

-- view the records of hero_motocorp1 table
select * from hero_motocorp1;


-- create table and the insert data using infosys table with columns 20 days and 50 days moving average 
create table infosys1(
	select `Date`, `Close Price`, 
    avg(`Close Price`) over(order by `Date` rows 19 preceding) '20 Day MA',
    avg(`Close Price`) over(order by `Date` rows 49 preceding) '50 Day MA'
    from infosys
);
-- view the records of infosys1 table
select * from infosys1;

-- set the previous 19 days moving average value to null since moving average for those days cant be calculated
update infosys1
set `20 Day MA` = Null
limit 19;

-- view the records of infosys1 table
select * from infosys1;

-- Similarly set the previous 49 days moving average value to null since moving average for those days cant be calculated
update infosys1
set `50 Day MA` = Null
limit 49;

-- view the records of infosys1 table
select * from infosys1;


-- create table and the insert data using tcs table with columns 20 days and 50 days moving average 
create table tcs1(
	select `Date`, `Close Price`, 
    avg(`Close Price`) over(order by `Date` rows 19 preceding) '20 Day MA',
    avg(`Close Price`) over(order by `Date` rows 49 preceding) '50 Day MA'
    from tcs
);
-- view the records of tcs1 table
select * from tcs1;

-- set the previous 19 days moving average value to null since moving average for those days cant be calculated
update tcs1
set `20 Day MA` = Null
limit 19;

-- view the records of tcs1 table
select * from tcs1;

-- Similarly set the previous 49 days moving average value to null since moving average for those days cant be calculated
update tcs1
set `50 Day MA` = Null
limit 49;

-- view the records of tcs1 table
select * from tcs1;


-- create table and the insert data using tvs_motors table with columns 20 days and 50 days moving average 
create table tvs_motors1(
	select `Date`, `Close Price`, 
    avg(`Close Price`) over(order by `Date` rows 19 preceding) '20 Day MA',
    avg(`Close Price`) over(order by `Date` rows 49 preceding) '50 Day MA'
    from tvs_motors
);
-- view the records of tvs_motors1 table
select * from tvs_motors1;

-- set the previous 19 days moving average value to null since moving average for those days cant be calculated
update tvs_motors1
set `20 Day MA` = Null
limit 19;

-- view the records of tvs_motors1 table
select * from tvs_motors1;

-- Similarly set the previous 49 days moving average value to null since moving average for those days cant be calculated
update tvs_motors1
set `50 Day MA` = Null
limit 49;

-- view the records of tvs_motors1 table
select * from tvs_motors1;

########################## Question 2 ###############################################
-- 2. Create a master table containing the date and close price of all the six stocks. 
-- 		(Column header for the price is the name of the stock)

-- Solution --> we will use inner join using column Date
create table master_stock_price
(
	select b.`Date`, b.`Close Price` 'Bajaj', t.`Close Price` 'TCS', tvs.`Close Price` 'TVS', i.`Close Price` 'Infosys', 
    e.`Close Price` 'Eicher', h.`Close Price` 'Hero'
    from bajaj_auto b
    inner join tcs t
    using(`Date`)
    inner join tvs_motors tvs 
    using(`Date`)
    inner join infosys i
    using(`Date`)
    inner join eicher_motors e
	using(`Date`)
    inner join hero_motocorp h
	using(`Date`)
    order by b.`Date`
);

-- display results of master table
select * from master_stock_price;

########################## Question 3 ###############################################
-- 3. Use the table created in Part(1) to generate buy and sell signal. 
-- 		Store this in another table named 'bajaj2'. Perform this operation for all stocks.

## Logic : 
-- If 50 day moving average is null then signal is 'NA' as not applicable
-- else if 20 day moving average value is greater than 50 day moving average value
-- and previous day 20 day moving avergae value was less than 50 day moving average value then mark it as buy 
-- else mark it as sell

-- check values in table baja1 and create new table bajaj2
create table bajaj2
(
	select `Date`, `Close Price`,
    (case
		when `50 Day MA` is Null then 'NA'
        when `20 Day MA` > `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) < (lag(`50 Day MA`,1) over(order by `Date`))) then 'Buy'
        when `20 Day MA` < `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) > (lag(`50 Day MA`,1) over(order by `Date`))) then 'Sell'
        else 'Hold'
	end) as 'Signal'
    from bajaj1
);

-- display baja2
select * from bajaj2;

-- check values in table eicher_motors1 and create new table eicher_motors2
create table eicher_motors2
(
	select `Date`, `Close Price`,
    (case
		when `50 Day MA` is Null then 'NA'
        when `20 Day MA` > `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) < (lag(`50 Day MA`,1) over(order by `Date`))) then 'Buy'
        when `20 Day MA` < `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) > (lag(`50 Day MA`,1) over(order by `Date`))) then 'Sell'
        else 'Hold'
	end) as 'Signal'
    from eicher_motors1
);

-- display eicher_motors2
select * from eicher_motors2;

-- check values in table hero_motocorp1 and create new table hero_motocorp2
create table hero_motocorp2
(
	select `Date`, `Close Price`,
    (case
		when `50 Day MA` is Null then 'NA'
        when `20 Day MA` > `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) < (lag(`50 Day MA`,1) over(order by `Date`))) then 'Buy'
        when `20 Day MA` < `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) > (lag(`50 Day MA`,1) over(order by `Date`))) then 'Sell'
        else 'Hold'
	end) as 'Signal'
    from hero_motocorp1
);

-- display hero_motocorp2
select * from hero_motocorp2;

-- check values in table infosys1 and create new table infosys2
create table infosys2
(
	select `Date`, `Close Price`,
    (case
		when `50 Day MA` is Null then 'NA'
        when `20 Day MA` > `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) < (lag(`50 Day MA`,1) over(order by `Date`))) then 'Buy'
        when `20 Day MA` < `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) > (lag(`50 Day MA`,1) over(order by `Date`))) then 'Sell'
        else 'Hold'
	end) as 'Signal'
    from infosys1
);

-- display infosys2
select * from infosys2;

-- check values in table tcs1 and create new table tcs2
create table tcs2
(
	select `Date`, `Close Price`,
    (case
		when `50 Day MA` is Null then 'NA'
        when `20 Day MA` > `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) < (lag(`50 Day MA`,1) over(order by `Date`))) then 'Buy'
        when `20 Day MA` < `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) > (lag(`50 Day MA`,1) over(order by `Date`))) then 'Sell'
        else 'Hold'
	end) as 'Signal'
    from tcs1
);

-- display tcs2
select * from tcs2;

-- check values in table tvs_motors1 and create new table tvs_motors2
create table tvs_motors2
(
	select `Date`, `Close Price`,
    (case
		when `50 Day MA` is Null then 'NA'
        when `20 Day MA` > `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) < (lag(`50 Day MA`,1) over(order by `Date`))) then 'Buy'
        when `20 Day MA` < `50 Day MA` and ((lag(`20 Day MA`,1) over(order by `Date`)) > (lag(`50 Day MA`,1) over(order by `Date`))) then 'Sell'
        else 'Hold'
	end) as 'Signal'
    from tvs_motors1
);

-- display tvs_motors2
select * from tvs_motors2;

########################### Question 4 #################################
-- 4. Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold)
-- 	 	for the Bajaj stock.

-- Solution --> create function named Bajaj_Signal that will take Date as input and returns Signal as output

delimiter $$
create function Bajaj_Signal(inputDate date)
returns varchar(5) deterministic
begin
	declare outputSignal varchar(5);
	set outputSignal = (select `Signal` from bajaj2 where `Date` = inputDate);
    return outputSignal;
end; $$
delimiter ;

-- Test case for user-defined function
select Bajaj_Signal('2015-03-23') `Signal`; ## this will return as hold
select Bajaj_Signal('2015-05-18') `Signal`; ## this will return as buy
select Bajaj_Signal('2015-08-24') `Signal`; ## this will return as sell
select Bajaj_Signal('2015-01-01') `Signal`; ## this will return as NA;
select Bajaj_Signal('2020-01-01') `Signal`; ## this will return as Null since the date is not in table;


#################### Main Tasks end here ######################################

-- ################ Extra For inference that will help in conclusion and recommendations ##################
select * from bajaj1;
select * from bajaj2;
select count(*) from bajaj2 where `Signal`='Buy';
select count(*) from bajaj2 where `Signal`='Sell';

select bj1.`Date`,bj1.`Close Price`,bj1.`20 Day MA`, bj1.`50 Day MA`, bj2.`Signal`
from bajaj1 bj1
inner join bajaj2 bj2
using(`Date`);

-- Lets see how much stock has increased or decreased since 01-01-2015 till 31-07-2018
select round((((select `Close Price` from bajaj_auto where `Date`='2018-07-31') - 
(select`Close Price` from bajaj_auto where `Date`='2015-01-01'))/
(select `Close Price` from bajaj_auto where `Date`='2015-01-01'))*100,2) as Per_Value;

-- Lets see how many shares have increased or decreased since 01-01-2015 till 31-07-2018
select round(((select `No.of Shares` from bajaj_auto where `Date`='2018-07-31')/
(select`No.of Shares` from bajaj_auto where `Date`='2015-01-01')),2) as Shares_Percentage;



select * from eicher_motors2;
select count(*) from eicher_motors2 where `Signal`='Buy';
select count(*) from eicher_motors2 where `Signal`='Sell';

select e1.`Date`,e1.`Close Price`,e1.`20 Day MA`, e1.`50 Day MA`, e2.`Signal`
from eicher_motors1 e1
inner join eicher_motors2 e2
using(`Date`);

-- Lets see how much stock has increased or decreased since 01-01-2015 till 31-07-2018
select round((((select `Close Price` from eicher_motors where `Date`='2018-07-31') - 
(select`Close Price` from eicher_motors where `Date`='2015-01-01'))/
(select `Close Price` from eicher_motors where `Date`='2015-01-01'))*100,2) as Per_Value;

-- Lets see how many shares have increased or decreased since 01-01-2015 till 31-07-2018
select round(((select `No.of Shares` from eicher_motors where `Date`='2018-07-31')/
(select`No.of Shares` from eicher_motors where `Date`='2015-01-01')),2) as Shares_Percentage;



select * from hero_motocorp2;
select count(*) from hero_motocorp2 where `Signal`='Buy';
select count(*) from hero_motocorp2 where `Signal`='Sell';

select h1.`Date`,h1.`Close Price`,h1.`20 Day MA`, h1.`50 Day MA`, h2.`Signal`
from hero_motocorp1 h1
inner join hero_motocorp2 h2
using(`Date`);

-- Lets see how much stock has increased or decreased since 01-01-2015 till 31-07-2018
select round((((select `Close Price` from hero_motocorp where `Date`='2018-07-31') - 
(select`Close Price` from hero_motocorp where `Date`='2015-01-01'))/
(select `Close Price` from hero_motocorp where `Date`='2015-01-01'))*100,2) as Per_Value;

-- Lets see how many shares have increased or decreased since 01-01-2015 till 31-07-2018
select round(((select `No.of Shares` from hero_motocorp where `Date`='2018-07-31')/
(select`No.of Shares` from hero_motocorp where `Date`='2015-01-01')),2) as Shares_Percentage;


select * from infosys2;
select count(*) from infosys2 where `Signal`='Buy';
select count(*) from infosys2 where `Signal`='Sell';

select i1.`Date`,i1.`Close Price`,i1.`20 Day MA`, i1.`50 Day MA`, i2.`Signal`
from infosys1 i1
inner join infosys2 i2
using(`Date`);

-- Lets see how much stock has increased or decreased since 01-01-2015 till 31-07-2018
select round((((select `Close Price` from infosys where `Date`='2018-07-31') - 
(select`Close Price` from infosys where `Date`='2015-01-01'))/
(select `Close Price` from infosys where `Date`='2015-01-01'))*100,2) as Per_Value;

-- Lets see how many shares have increased or decreased since 01-01-2015 till 31-07-2018
select round(((select `No.of Shares` from infosys where `Date`='2018-07-31')/
(select`No.of Shares` from infosys where `Date`='2015-01-01')),2) as Shares_Percentage;



select i1.`Date`,i1.`Close Price`,i1.`20 Day MA`, i1.`50 Day MA`, i2.`Signal`, 
(i1.`Close Price`-lag(i1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1',
(i.`No.of Shares`-lag(i.`No.of Shares`,1) over(order by `Date`)) 'No. of shares diff lag 1'
from infosys1 i1
inner join infosys2 i2
using(`Date`)
inner join infosys i
using(`Date`)
order by `Date`;


select * from tcs2;
select count(*) from tcs2 where `Signal`='Buy';
select count(*) from tcs2 where `Signal`='Sell';

select t1.`Date`,t1.`Close Price`,t1.`20 Day MA`, t1.`50 Day MA`, t2.`Signal`
from tcs1 t1
inner join tcs2 t2
using(`Date`);

-- Lets see how much stock has increased or decreased since 01-01-2015 till 31-07-2018
select round((((select `Close Price` from tcs where `Date`='2018-07-31') - 
(select`Close Price` from tcs where `Date`='2015-01-01'))/
(select `Close Price` from tcs where `Date`='2015-01-01'))*100,2) as Per_Value;

-- Lets see how many shares have increased or decreased since 01-01-2015 till 31-07-2018
select round(((select `No.of Shares` from tcs where `Date`='2018-07-31')/
(select`No.of Shares` from tcs where `Date`='2015-01-01')),2) as Shares_Percentage;



select * from tvs_motors2;
select count(*) from tvs_motors2 where `Signal`='Buy';
select count(*) from tvs_motors2 where `Signal`='Sell';

select t1.`Date`,t1.`Close Price`,t1.`20 Day MA`, t1.`50 Day MA`, t2.`Signal`
from tvs_motors1 t1
inner join tvs_motors2 t2
using(`Date`); 

-- Lets see how much stock has increased or decreased since 01-01-2015 till 31-07-2018
select round((((select `Close Price` from tvs_motors where `Date`='2018-07-31') - 
(select`Close Price` from tvs_motors where `Date`='2015-01-01'))/
(select `Close Price` from tvs_motors where `Date`='2015-01-01'))*100,2) as Per_Value;

-- Lets see how many shares have increased or decreased since 01-01-2015 till 31-07-2018
select round(((select `No.of Shares` from tvs_motors where `Date`='2018-07-31')/
(select`No.of Shares` from tvs_motors where `Date`='2015-01-01')),2) as Shares_Percentage;



-- Lets see the maximum turnover is for which company stock
with stocks_turnover as
(
	select b.`Date` `Date`, b.`Total Turnover (Rs.)` bajaj,
	e.`Total Turnover (Rs.)` eicher,
	h.`Total Turnover (Rs.)` hero,
	i.`Total Turnover (Rs.)` infosys,
	t.`Total Turnover (Rs.)` tcs,
	tvs.`Total Turnover (Rs.)` tvs
	from bajaj_auto b
	inner join eicher_motors e
	using(`Date`)
	inner join hero_motocorp h
	using(`Date`)
	inner join infosys i
	using(`Date`)
	inner join tcs t
	using(`Date`)
	inner join tvs_motors tvs
	using(`Date`)
	where `Date`='2018-07-31'
)
select `Date`,
	@var_max_val := greatest(bajaj, eicher, hero, infosys, tcs, tvs) as max_value,
	Case @var_max_val 	when bajaj then 'bajaj'
						when eicher then 'eicher'
                        when hero then 'hero'
                        when infosys then 'infosys'
                        when tcs then 'tcs'
                        when tvs then 'tvs'
	end as max_turnover_stock
from stocks_turnover
;

-- Lets see the maximum Number of shares is for which company stock
with max_no_of_shares as
(
	select b.`Date` `Date`, b.`No.of Shares` bajaj,
	e.`No.of Shares` eicher,
	h.`No.of Shares` hero,
	i.`No.of Shares` infosys,
	t.`No.of Shares` tcs,
	tvs.`No.of Shares` tvs
	from bajaj_auto b
	inner join eicher_motors e
	using(`Date`)
	inner join hero_motocorp h
	using(`Date`)
	inner join infosys i
	using(`Date`)
	inner join tcs t
	using(`Date`)
	inner join tvs_motors tvs
	using(`Date`)
	where `Date`='2018-07-31'
)
select `Date`,
	@var_max_val := greatest(bajaj, eicher, hero, infosys, tcs, tvs) as max_value,
	Case @var_max_val 	when bajaj then 'bajaj'
						when eicher then 'eicher'
                        when hero then 'hero'
                        when infosys then 'infosys'
                        when tcs then 'tcs'
                        when tvs then 'tvs'
	end as max_noOfShares_stock
from max_no_of_shares
;

-- Lets check for the last Signal was 'Buy' or 'Sell' on stocks
select `Date`, bajaj1.`Close Price`, round(`20 Day MA`,3), round(`50 Day MA`,3), `Signal`, 
(bajaj1.`Close Price`-lag(bajaj1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from bajaj1
inner join bajaj2
using(`Date`);

-- Last time when the stock closing price dropped to the lowest
with close_price_diff as
(
select `Date`,  bajaj1.`Close Price`,
(bajaj1.`Close Price`-lag(bajaj1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from bajaj1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select min(`Close Price diff lag 1`) from close_price_diff)
;

-- Last time when the stock closing price was to the maximum
with close_price_diff as
(
select `Date`,  bajaj1.`Close Price`,
(bajaj1.`Close Price`-lag(bajaj1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from bajaj1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select max(`Close Price diff lag 1`) from close_price_diff)
;
select `Date`, `Close Price` from bajaj1
where `Close Price` = (select max(`Close Price`) from bajaj1);

select `Date`, eicher_motors1.`Close Price`, round(`20 Day MA`,3), round(`50 Day MA`,3), `Signal` 
from eicher_motors1
inner join eicher_motors2
using(`Date`);

select `Date`, eicher_motors1.`Close Price`, round(`20 Day MA`,3), round(`50 Day MA`,3), `Signal`, 
(eicher_motors1.`Close Price`-lag(eicher_motors1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from eicher_motors1
inner join eicher_motors2
using(`Date`);

-- Last time when the stock closing price dropped to the lowest
with close_price_diff as
(
select `Date`,  eicher_motors1.`Close Price`,
(eicher_motors1.`Close Price`-lag(eicher_motors1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from eicher_motors1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select min(`Close Price diff lag 1`) from close_price_diff)
;

-- Last time when the stock closing price was to the maximum
with close_price_diff as
(
select `Date`,  eicher_motors1.`Close Price`,
(eicher_motors1.`Close Price`-lag(eicher_motors1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from eicher_motors1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select max(`Close Price diff lag 1`) from close_price_diff)
;

-- Lets check for the last Signal was 'Buy' or 'Sell' on stocks
select `Date`, hero_motocorp1.`Close Price`, round(`20 Day MA`,3), round(`50 Day MA`,3), `Signal`, 
(hero_motocorp1.`Close Price`-lag(hero_motocorp1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from hero_motocorp1
inner join hero_motocorp2
using(`Date`);

-- Last time when the stock closing price dropped to the lowest
with close_price_diff as
(
select `Date`,  hero_motocorp1.`Close Price`,
(hero_motocorp1.`Close Price`-lag(hero_motocorp1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from hero_motocorp1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select min(`Close Price diff lag 1`) from close_price_diff)
;

-- Last time when the stock closing price was to the maximum
with close_price_diff as
(
select `Date`,  hero_motocorp1.`Close Price`,
(hero_motocorp1.`Close Price`-lag(hero_motocorp1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from hero_motocorp1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select max(`Close Price diff lag 1`) from close_price_diff)
;

select `Date`, `Close Price` from hero_motocorp1
where `Close Price` = (select max(`Close Price`) from hero_motocorp1);

-- Lets check for the last Signal was 'Buy' or 'Sell' on stocks
select `Date`, infosys1.`Close Price`, round(`20 Day MA`,3), round(`50 Day MA`,3), `Signal`, 
(infosys1.`Close Price`-lag(infosys1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from infosys1
inner join infosys2
using(`Date`);

-- Last time when the stock closing price dropped to the lowest
with close_price_diff as
(
select `Date`,  infosys1.`Close Price`,
(infosys1.`Close Price`-lag(infosys1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from infosys1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select min(`Close Price diff lag 1`) from close_price_diff)
;

-- Last time when the stock closing price was to the maximum
with close_price_diff as
(
select `Date`,  infosys1.`Close Price`,
(infosys1.`Close Price`-lag(infosys1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from infosys1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select max(`Close Price diff lag 1`) from close_price_diff)
;

select `Date`, `Close Price` from infosys1
where `Close Price` = (select max(`Close Price`) from infosys1);

select `Date`, `Close Price` from infosys1
order by `Close Price` desc;

-- Lets check for the last Signal was 'Buy' or 'Sell' on stocks
select `Date`, tcs1.`Close Price`, round(`20 Day MA`,3), round(`50 Day MA`,3), `Signal`, 
(tcs1.`Close Price`-lag(tcs1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from tcs1
inner join tcs2
using(`Date`);

-- Last time when the stock closing price dropped to the lowest
with close_price_diff as
(
select `Date`,  tcs1.`Close Price`,
(tcs1.`Close Price`-lag(tcs1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from tcs1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select min(`Close Price diff lag 1`) from close_price_diff)
;

-- Last time when the stock closing price was to the maximum
with close_price_diff as
(
select `Date`,  tcs1.`Close Price`,
(tcs1.`Close Price`-lag(tcs1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from tcs1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select max(`Close Price diff lag 1`) from close_price_diff)
;

select `Date`, `Close Price` from tcs1;
#order by `Close Price` desc;
select `Date`, `Close Price` from tcs1
where `Close Price` = (select max(`Close Price`) from tcs1);


-- Lets check for the last Signal was 'Buy' or 'Sell' on stocks
select `Date`, tvs_motors1.`Close Price`, round(`20 Day MA`,3), round(`50 Day MA`,3), `Signal`, 
(tvs_motors1.`Close Price`-lag(tvs_motors1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from tvs_motors1
inner join tvs_motors2
using(`Date`);

-- Last time when the stock closing price dropped to the lowest
with close_price_diff as
(
select `Date`,  tvs_motors1.`Close Price`,
(tvs_motors1.`Close Price`-lag(tvs_motors1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from tvs_motors1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select min(`Close Price diff lag 1`) from close_price_diff)
;

-- Last time when the stock closing price was to the maximum
with close_price_diff as
(
select `Date`,  tvs_motors1.`Close Price`,
(tvs_motors1.`Close Price`-lag(tvs_motors1.`Close Price`,1) over(order by `Date`)) 'Close Price diff lag 1'
from tvs_motors1)
select `Date`,`Close Price`, `Close Price diff lag 1`
from close_price_diff
where `Close Price diff lag 1` = (select max(`Close Price diff lag 1`) from close_price_diff)
;

select `Date`, `Close Price` from tvs_motors1
where `Close Price` = (select max(`Close Price`) from tvs_motors1);
