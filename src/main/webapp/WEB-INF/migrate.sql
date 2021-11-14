CREATE DATABASE fruitbasket;
use fruitbasket;

create table users (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(120) NOT NULL,
    email varchar(220) NOT NULL,
    password_hash varchar(220) NOT NULL,
    is_admin BOOL NOT NULL DEFAULT FALSE, 
	PRIMARY KEY(id)
);

create table addresses (
	id int NOT NULL AUTO_INCREMENT,
    street varchar(120) NOT NULL,
	user_id int NOT NULL,
    INDEX user_ind (user_id),
    FOREIGN KEY (user_id)
		REFERENCES users(id)
			ON DELETE CASCADE,
	PRIMARY KEY (id)
);
    
create table products (
	id int NOT NULL AUTO_INCREMENT,
    product_name varchar(120) NOT NULL,
    product_descr text,
    price float NOT NULL DEFAULT 0.00,
    available_quantity int unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (id)
);

create table carts (
	id int NOT NULL AUTO_INCREMENT,
    user_id int NOT NULL,
    INDEX user_ind (user_id),
    FOREIGN KEY (user_id)
		REFERENCES users(id)
			ON DELETE CASCADE,
	created DATETIME DEFAULT NOW(),
    cart_status TINYINT UNSIGNED DEFAULT 0,
    delivery_address int NOT NULL,
    FOREIGN KEY (delivery_address)
		REFERENCES addresses(id)
			ON DELETE CASCADE,
    PRIMARY KEY (id)
);

create table cart_items (
	id int NOT NULL AUTO_INCREMENT,
    cart_id int NOT NULL,
    INDEX cart_ind (cart_id),
    FOREIGN KEY (cart_id)
		REFERENCES carts(id)
			ON DELETE CASCADE,
	product_id int NOT NULL,
    FOREIGN KEY (product_id)
		REFERENCES products(id)
			ON DELETE CASCADE,
	quantity int unsigned NOT NULL DEFAULT 1,
	PRIMARY KEY (id)
);
