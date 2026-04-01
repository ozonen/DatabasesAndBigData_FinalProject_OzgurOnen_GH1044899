USE ecommerce_db;

INSERT INTO categories (name, description) VALUES
  ('Electronics',   'Gadgets, phones, laptops'),
  ('Clothing',      'Men and women apparel'),
  ('Books',         'Fiction and non-fiction'),
  ('Home & Garden', 'Furniture and garden tools');

INSERT INTO products (category_id, name, price, stock_qty) VALUES
  (1, 'Wireless Headphones',       89.99, 120),
  (1, 'Mechanical Keyboard',       59.99,  80),
  (1, 'USB-C Hub',                 29.99, 200),
  (2, 'Mens Running Shoes',        74.99,  60),
  (2, 'Denim Jacket',              49.99,  45),
  (3, 'Clean Code',                34.99, 300),
  (3, 'The Pragmatic Programmer',  39.99, 250),
  (4, 'Garden Hose 30m',           24.99,  90),
  (4, 'Ceramic Plant Pot',         14.99, 150);

INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
  ('Alice', 'Muller',  'alice@example.com', '+49 30 1234567', 'Unter den Linden 1, Berlin'),
  ('Bob',   'Schmidt', 'bob@example.com',   '+49 89 9876543', 'Marienplatz 5, Munich'),
  ('Clara', 'Braun',   'clara@example.com', '+49 40 1112233', 'Reeperbahn 10, Hamburg'),
  ('David', 'Klein',   'david@example.com', '+49 69 5554433', 'Zeil 50, Frankfurt');

INSERT INTO orders (customer_id, status, total_amount) VALUES
  (1, 'delivered',  149.98),
  (1, 'shipped',     34.99),
  (2, 'confirmed',  119.98),
  (3, 'pending',     74.99),
  (4, 'cancelled',   49.99);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
  (1, 1, 1,  89.99),
  (1, 2, 1,  59.99),
  (2, 6, 1,  34.99),
  (3, 1, 1,  89.99),
  (3, 3, 1,  29.99),
  (4, 4, 1,  74.99),
  (5, 5, 1,  49.99);

INSERT INTO payments (order_id, method, status, amount, paid_at) VALUES
  (1, 'credit_card',   'completed', 149.98, '2026-01-15 10:30:00'),
  (2, 'paypal',        'completed',  34.99, '2026-02-01 14:00:00'),
  (3, 'bank_transfer', 'pending',   119.98,  NULL),
  (4, 'credit_card',   'pending',    74.99,  NULL),
  (5, 'paypal',        'refunded',   49.99, '2026-02-20 09:00:00');

INSERT INTO reviews (product_id, customer_id, rating, comment) VALUES
  (1, 1, 5, 'Amazing sound quality!'),
  (2, 1, 4, 'Great keyboard, slightly loud.'),
  (6, 2, 5, 'Must read for every developer.'),
  (4, 3, 3, 'Good shoes but sizing runs small.');