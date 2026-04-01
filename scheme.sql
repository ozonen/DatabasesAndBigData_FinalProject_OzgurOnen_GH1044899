CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL UNIQUE,
    description   TEXT
);

CREATE TABLE products (
    product_id    INT AUTO_INCREMENT PRIMARY KEY,
    category_id   INT,
    name          VARCHAR(200) NOT NULL,
    description   TEXT,
    price         DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_qty     INT NOT NULL DEFAULT 0 CHECK (stock_qty >= 0),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

CREATE TABLE customers (
    customer_id   INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(100) NOT NULL,
    last_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(150) NOT NULL UNIQUE,
    phone         VARCHAR(20),
    address       TEXT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT PRIMARY KEY,
    customer_id   INT NOT NULL,
    status        ENUM('pending','confirmed','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
    total_amount  DECIMAL(10, 2) NOT NULL DEFAULT 0,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    item_id       INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT NOT NULL CHECK (quantity > 0),
    unit_price    DECIMAL(10, 2) NOT NULL,
    UNIQUE (order_id, product_id),
    FOREIGN KEY (order_id)   REFERENCES orders(order_id)   ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id    INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT NOT NULL,
    method        ENUM('credit_card','paypal','bank_transfer','cash') NOT NULL,
    status        ENUM('pending','completed','failed','refunded') NOT NULL DEFAULT 'pending',
    amount        DECIMAL(10, 2) NOT NULL,
    paid_at       TIMESTAMP NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

CREATE TABLE reviews (
    review_id     INT AUTO_INCREMENT PRIMARY KEY,
    product_id    INT NOT NULL,
    customer_id   INT NOT NULL,
    rating        TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment       TEXT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (product_id, customer_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id)  ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE cascade
);
