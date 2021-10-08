-- Few Basic KPIs metrics in DVD-rental Shop

-- Data is devided into 15 tables such as inventory, informations about customers, payments, types of movies, etc.


-- KPIs

-- 1. Revenue per client 
-- Here I am focusing on the metric of productivity (annual revenue divided by number of clients). 
-- Joining two tables to combine unique custumers id.

SELECT customer.store_id, (sum(payment.amount)) / (COUNT( DISTINCT customer.customer_id)) FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
WHERE customer.create_date BETWEEN '2020-01-01' and '2021-01-01'
group by customer.store_id

-- 2. client retention rate

select (((select count(create_date) from customer
where create_date between '2000-01-01' and '2021-01-01') - (select count(create_date) from customer
where create_date between '2020-01-01' and '2021-01-01')) / ((select count(create_date) from customer
where create_date between '2000-01-01' and '2019-12-31'))) * 100 as customer_retention_rate

-- 3.Profit Margin - Simply deducted revenue from expenses. 
-- Lack of data does not allow to include expenses 
-- for building maintenance, for employees, taxes, sales, etc. 
-- So here are included just expences from purchase of movies.

SELECT 
(SELECT SUM(payment.amount) FROM rental 
INNER JOIN payment ON rental.rental_id = payment.rental_id) -
(SELECT SUM(inventory.movie_cost) FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id) AS Profit_Margin, 
to_char(rental.rental_date, 'mm') AS month FROM rental
GROUP BY to_char(rental.rental_date, 'mm') 
ORDER BY month ASC

-- 4.Revenue per store

select inventory.store_id, sum(payment.amount) from inventory
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
group by inventory.store_id


