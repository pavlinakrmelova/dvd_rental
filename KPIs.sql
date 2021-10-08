-- Revenue per store

select inventory.store_id, sum(payment.amount) from inventory
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
group by inventory.store_id


-- KPIs
-- 1. Revenue per client

SELECT customer.store_id, (sum(payment.amount)) / (COUNT( DISTINCT customer.customer_id)) FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
group by customer.store_id

-- 2. client retention rate

select (((select count(create_date) from customer
where create_date between '2000-01-01' and '2008-02-01') - (select count(create_date) from customer
where create_date between '2007-02-01' and '2008-02-01')) / ((select count(create_date) from customer
where create_date between '2000-01-01' and '2007-02-01'))) * 100 as customer_retention_rate

-- 3.Profit Margin

SELECT 
(SELECT SUM(payment.amount) FROM rental 
INNER JOIN payment ON rental.rental_id = payment.rental_id) -
(SELECT SUM(inventory.movie_cost) FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id) AS Profit_Margin, 
to_char(rental.rental_date, 'mm') AS month FROM rental
GROUP BY to_char(rental.rental_date, 'mm') 
ORDER BY month ASC


