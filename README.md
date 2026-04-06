# DatabasesAndBigData_FinalProject_OzgurOnen_GH1044899
E-Commerce relational database system designed and implemented using MySQL and DBeaver.

**B103 Databases & Big Data — Gisma University of Applied Sciences**
- **Name:** Ozgur Onen
- **Student ID:** GH1044899
- **Video Explanation:** [Watch here](YOUR_VIDEO_LINK)

## Project Overview
A fully normalised relational database system for an e-commerce platform built with MySQL and DBeaver. The system manages products, customers, orders, payments, and reviews.

## ER Diagram
![ER Diagram](diagrams/ecommerce_db.png)

## Repository Structure
| File | Description |
|------|-------------|
| `Schema.sql` | Creates the database and all 7 tables |
| `Indexes.sql` | Creates indexes for query optimisation |
| `Data.sql` | Inserts sample data into all tables |
| `Queries.sql` | SQL queries demonstrating CRUD operations |

## Database Schema
The system contains 7 tables:

| Table | Description |
|-------|-------------|
| `categories` | Product categories such as Electronics and Clothing |
| `products` | Products with name, price, stock quantity, and category |
| `customers` | Customer personal information and contact details |
| `orders` | Customer orders with status tracking |
| `order_items` | Junction table linking orders to products |
| `payments` | Payment records including method and status |
| `reviews` | Customer ratings (1-5) and comments for products |

## Tools Used
- MySQL
- DBeaver
- GitHub
