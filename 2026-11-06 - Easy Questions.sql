select * from album;

-- Question Set 1 

-- Q1: Who is the senior most employee based on job title?

select * from employee
order by levels desc
limit 1

-- Madan Mohan is the most senior employee with a Senior General Manager Title

-- Q2: Which countries have the most invoices?

select count(*) as Total, billing_country
from invoice
group by billing_country
order by Total desc

--USA has the highest number of invoices, i.e., 131

-- Q3: What are the top 3 values of total invoice?

select * from invoice
order by total desc
limit 3

-- Q4: Which city has the best customers?
-- We would like to throw a promotional Music Festival in the city where we made the most money. 
-- Write a query that returns one city with the highest sum of invoice totals.
-- Return both the city name and the sum of all invoice totals.

select sum(total) as Invoice_Total, billing_city
from invoice
group by billing_city 
order by Invoice_Total desc


-- Q5: Who is the best customer?
-- The customer who has spent the most money will be declared the best customer.
-- Write a query that returns the person who has spent the most money.
-- Note: Invoice and Customer datasets are connect by customer_id

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as Total
from customer
Join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by Total desc
limit 1

-- Madhav R is the highest spending customer
