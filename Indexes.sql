USE ecommerce_db;

CREATE INDEX idx_products_category  ON products(category_id);
CREATE INDEX idx_orders_customer    ON orders(customer_id);
CREATE INDEX idx_order_items_order  ON order_items(order_id);
CREATE INDEX idx_payments_order     ON payments(order_id);
CREATE INDEX idx_reviews_product    ON reviews(product_id);
