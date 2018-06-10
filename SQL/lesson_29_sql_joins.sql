
-- LESSON 29: SQL Joins --

-- 11. Quiz: JOIN Questions Part 1 --

-- 11.1.
-- Provide a table for all web_events associated with account name of Walmart.
-- There should be three columns. Be sure to include the primary_poc, time of
-- the event, and the channel for each event. Additionally, you might choose to
-- add a fourth column to assure only Walmart events were chosen.

SELECT web.channel, web.occurred_at, accounts.primary_poc
FROM web_events AS web
JOIN accounts
  ON accounts.id = web.account_id
WHERE accounts.name = 'Walmart';


-- 11.2.
-- Provide a table that provides the region for each sales_rep along with their
-- associated accounts. Your final table should include three columns: the
-- region name, the sales rep name, and the account name. Sort the accounts
-- alphabetically (A-Z) according to account name.

-- note -- additional columns of the same name are omitted unless aliased:
SELECT s.name sales_Rep, r.name region, a.name account
FROM sales_reps AS s
JOIN region AS r
  ON s.region_id = r.id
JOIN accounts AS a
  ON s.id = a.sales_rep_id
ORDER BY a.name;


-- 11.3.
-- Provide the name for each region for every order, as well as the account name
-- and the unit price they paid (total_amt_usd/total) for the order. Your final
-- table should have 3 columns: region name, account name, and unit price. A few
-- accounts have 0 for total, so I divided by (total + 0.01) to assure not
-- dividing by zero.

SELECT
	r.name region, 
    a.name account, 
    o.total_amt_usd / (o.total + 0.00001) unit_price
FROM orders AS o
JOIN accounts AS a
  ON o.account_id = a.id
JOIN sales_reps AS s
  ON a.sales_rep_id = s.id
JOIN region AS r
  ON s.region_id = r.id



-- 19. Quiz: Last Check --

-- 19.1.
-- Provide a table that provides the region for each sales_rep along with their
-- associated accounts. This time only for the Midwest region. Your final table
-- should include three columns: the region name, the sales rep name, and the
-- account name. Sort the accounts alphabetically (A-Z) according to account
-- name.

SELECT s.name sales_rep, r.name region, a.name account
FROM sales_reps AS s
JOIN region AS r
  ON s.region_id  = r.id
 AND r.name = 'Midwest'
JOIN accounts AS a
  ON a.sales_rep_id = s.id
ORDER BY s.name;

-- 19.2.
-- Provide a table that provides the region for each sales_rep along with their
-- associated accounts. This time only for accounts where the sales rep has a
-- first name starting with S and in the Midwest region. Your final table should
-- include three columns: the region name, the sales rep name, and the account
-- name. Sort the accounts alphabetically (A-Z) according to account name.

SELECT s.name sales_rep, r.name region, a.name account
FROM sales_reps AS s
JOIN region AS r
  ON s.region_id  = r.id
 AND s.name LIKE 'S%'
 AND r.name = 'Midwest'
JOIN accounts AS a
  ON a.sales_rep_id = s.id
ORDER BY s.name;

-- 19.3.
-- Provide a table that provides the region for each sales_rep along with their
-- associated accounts. This time only for accounts where the sales rep has a
-- last name starting with K and in the Midwest region. Your final table should
-- include three columns: the region name, the sales rep name, and the account
-- name. Sort the accounts alphabetically (A-Z) according to account name.

SELECT s.name sales_rep, r.name region, a.name account
FROM sales_reps AS s
JOIN region AS r
  ON s.region_id  = r.id
 AND s.name LIKE '% K%'
 AND r.name LIKE 'Midwest'
JOIN accounts AS a
  ON a.sales_rep_id = s.id
ORDER BY a.name;

-- 19.4.
-- Provide the name for each region for every order, as well as the account name
-- and the unit price they paid (total_amt_usd/total) for the order. However,
-- you should only provide the results if the standard order quantity exceeds
-- 100. Your final table should have 3 columns: region name, account name, and
-- unit price. In order to avoid a division by zero error, adding .01 to the
-- denominator here is helpful total_amt_usd/(total+0.01).

SELECT 
	r.name region, 
    a.name account,
    o.total_amt_usd / o.total unit_price
FROM accounts AS a
JOIN orders as o
  ON o.account_id = a.id
     -- adding the constraint here instead of in a WHERE clause avoids 
     -- division-by-zero errors because only rows with o.total exceeding 
     -- 100 are pulled before the derived column is calculated:
 AND o.total > 100 
JOIN sales_reps as s
  ON a.sales_rep_id = s.id
JOIN region as r
  ON r.id = s.region_id;

-- 19.5.
-- Provide the name for each region for every order, as well as the account
-- name and the unit price they paid (total_amt_usd/total) for the order.
-- However, you should only provide the results if the standard order quantity
-- exceeds 100 and the poster order quantity exceeds 50. Your final table
-- should have 3 columns: region name, account name, and unit price. Sort for
-- the smallest unit price first. In order to avoid a division by zero error,
-- adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).

SELECT 
	r.name region, 
    a.name account,
    o.total_amt_usd / o.total unit_price
FROM accounts AS a
JOIN orders as o
  ON o.account_id = a.id
 AND o.total > 100
 AND o.poster_qty > 50 
JOIN sales_reps as s
  ON a.sales_rep_id = s.id
JOIN region as r
  ON r.id = s.region_id
ORDER BY unit_price;


-- 19.6.
-- Provide the name for each region for every order, as well as the account name
-- and the unit price they paid (total_amt_usd/total) for the order. However,
-- you should only provide the results if the standard order quantity exceeds
-- 100 and the poster order quantity exceeds 50. Your final table should have 3
-- columns: region name, account name, and unit price. Sort for the largest unit
-- price first. In order to avoid a division by zero error, adding .01 to the
-- denominator here is helpful (total_amt_usd/(total+0.01).

-- same as above, except for the last line:
SELECT 
	r.name region, 
    a.name account,
    o.total_amt_usd / o.total unit_price
FROM accounts AS a
JOIN orders as o
  ON o.account_id = a.id
 AND o.total > 100
 AND o.poster_qty > 50 
JOIN sales_reps as s
  ON a.sales_rep_id = s.id
JOIN region as r
  ON r.id = s.region_id
ORDER BY unit_price DESC;


-- 19.7.
-- What are the different channels used by account id 1001? Your final table
-- should have only 2 columns: account name and the different channels. You can
-- try SELECT DISTINCT to narrow down the results to only the unique values.

SELECT DISTINCT w.channel, a.name account
FROM web_events AS w
JOIN accounts AS a
  ON w.account_id = a.id
 AND a.id = 1001;

-- 19.8.
-- Find all the orders that occurred in 2015. Your final table should have 4
-- columns: occurred_at, account name, order total, and order total_amt_usd.
 
 SELECT 
	o.occurred_at, 
    a.name, 
    o.total, 
    o.total_amt_usd
FROM accounts AS a
JOIN orders AS o
  ON o.account_id = a.id
 AND o.occurred_at 
    BETWEEN '2015-01-01'
 	    AND '2016-01-01';
