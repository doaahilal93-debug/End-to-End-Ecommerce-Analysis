select * 
from cleaned_data 

-- Is orderID Unique?  Yes
select count (*) as totalrows, 
count(distinct(orderid)) as uniqueorders
from cleaned_data

-- Customers Counts
select count(distinct(CustomerID)) totalCustomer
from cleaned_data

-- orders num for each customer
select CustomerID, count(orderid) orders_number
from cleaned_data
group by CustomerID
order by orders_number desc 

-- sold_amount for every Product
select Product, sum(Quantity) sold_amount
from cleaned_data
group by Product
order by sold_amount desc

-- orders_number for every Product
select Product, count(OrderID) orders_number
from cleaned_data
group by Product
order by orders_number desc

-- orders_number for every PaymentMethod
select PaymentMethod, count(OrderID) orders_number
from cleaned_data
group by PaymentMethod
order by orders_number

-- the most cancelled_orders
select Top 1 
Product, count(OrderStatus) cancelled_orders
from cleaned_data
where OrderStatus= 'Cancelled'
group by Product
order by cancelled_orders desc

-- the most Returned_order 
select Top 1 
Product, count(OrderStatus) Returned_orders
from cleaned_data
where OrderStatus= 'Returned'
group by Product
order by Returned_orders desc

-- customers_number by ReferralSource 
select ReferralSource, count( distinct (CustomerID) ) customers_number
from cleaned_data
group by ReferralSource
order by customers_number desc

-- Gross_Revenue
select ROUND( sum(TotalPrice), 2 ) Gross_Revenue
from cleaned_data

-- Net_Revenue
select ROUND( sum(TotalPrice), 2 ) Net_Revenue
from cleaned_data
where OrderStatus in ( 'Shipped' , 'Delivered' )

-- Average Order Value (AOV)
select ROUND( avg(TotalPrice), 2 ) AOV
from cleaned_data
where OrderStatus in( 'Shipped', 'Delivered' )

-- Cancellation Rate
SELECT sum( case when OrderStatus = 'Cancelled' then 1 else 0 End )*100.0
                 /count(OrderID) Cancellation_Rate 
from cleaned_data 

-- cancelled_orders for every customer
select CustomerID, count(OrderID) as cancelled_orders
from cleaned_data 
where OrderStatus = 'Cancelled'
group by CustomerID
order by cancelled_orders desc

-- returned_orders for every customer
select CustomerID, count(OrderID) as Returned_orders
from cleaned_data 
where OrderStatus = 'Returned'
group by CustomerID
order by Returned_orders desc



