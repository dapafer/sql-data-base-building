# Creation of "stores", "staff" and "customers" tables.

CREATE TABLE blockbuster.stores (
    store_id INT PRIMARY KEY,
    address VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(50)
);

CREATE TABLE blockbuster.staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    personal_ID VARCHAR(20),
    phone_number VARCHAR(20)
);

CREATE TABLE blockbuster.customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(50)
);



# Creation of rows for "stores" and "staff" tables.

INSERT INTO blockbuster.stores (store_id, address, phone_number, email)
VALUES (1, '123 Main St', '555-1234', 'store1@example.com');

INSERT INTO blockbuster.stores (store_id, address, phone_number, email)
VALUES (2, '456 Elm St', '555-5678', 'store2@example.com');



INSERT INTO blockbuster.staff (staff_id, first_name, last_name, personal_ID, phone_number)
VALUES (1, 'John', 'Doe', '123456789', '555-1111');

INSERT INTO blockbuster.staff (staff_id, first_name, last_name, personal_ID, phone_number)
VALUES (2, 'Jane', 'Smith', '987654321', '555-2222');



# Queries about database.

# 1. It will show the actors and the films in which they have participated.

SELECT a.first_name AS 'NAME',
        a.last_name AS 'LAST NAME',
        f.title AS 'FILM'
FROM actors AS a
		JOIN actors_films AS af ON a.actor_id = af.actor_id
        JOIN films AS f ON af.film_id = f.film_id
        ;

# 2. 