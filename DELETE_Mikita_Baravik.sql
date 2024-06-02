-- Step 1: Remove the film "Inception" from the inventory and all corresponding rental records

-- Delete payment records associated with the rental records of the film
DELETE FROM payment
WHERE rental_id IN (
    SELECT rental_id
    FROM rental
    WHERE inventory_id IN (
        SELECT inventory_id
        FROM inventory
        WHERE film_id = 1000
    )
);

-- Delete rental records associated with the film
DELETE FROM rental
WHERE inventory_id IN (
    SELECT inventory_id
    FROM inventory
    WHERE film_id = 1000
);

-- Delete the film from the inventory
DELETE FROM inventory
WHERE film_id = 1000;

-- Delete the film from the film_actor table
DELETE FROM film_actor
WHERE film_id = 1000;

-- Delete the film from the film_category table
DELETE FROM film_category
WHERE film_id = 1000;

-- Delete the film from the film table
DELETE FROM film
WHERE film_id = 1000;

-- Step 2: Remove any records related to you (as a customer) from all tables except "Customer" and "Inventory"

-- Delete payment records associated with the customer
DELETE FROM payment
WHERE customer_id = 3000;

-- Delete rental records associated with the customer
DELETE FROM rental
WHERE customer_id = 3000;

-- Ensure the customer remains in the customer table and inventory is intact
