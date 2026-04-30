# Technical Decisions

## SQL Server and T-SQL

The database was built using SQL Server and T-SQL. This allowed the project to use relational database features such as primary keys, foreign keys, stored procedures, functions, views, triggers, and validation queries.

## Database creation order

The database was created in stages:

1. Create the database.
2. Create the tables.
3. Add primary keys.
4. Add foreign keys.
5. Create stored procedures.
6. Insert data using stored procedures.
7. Add views, functions, triggers, and validation queries.

This order helps avoid dependency errors between tables.

## Primary keys

Primary keys were used to identify each record in the main tables.

Some tables use simple primary keys, such as:

- Users
- Roles
- Artists
- Songs
- Albums
- Podcasts
- Episodes
- Subscriptions

Other tables use composite primary keys because they represent relationships between two entities.

## Foreign keys

Foreign keys were used to connect related tables and preserve referential integrity.

This helps ensure that records cannot be related to non-existing data.

## Intermediate tables

Many-to-many relationships were handled through intermediate tables.

This decision keeps the model normalized and avoids storing repeated values in the main tables.

## Stored procedures

Stored procedures were created to insert data into the tables.

This makes the insertion process more organized and reusable, because each table has its own insertion procedure.

## Views, functions, and triggers

The project includes additional database objects to support automation, validation, and data consultation.

- Views help simplify queries and reports.
- Functions help encapsulate reusable logic.
- Triggers help automate actions when specific database events happen.

## Validation queries

Validation queries were used to confirm that the database objects were created correctly and that the data could be consulted after insertion.

## Project limitation

This project focuses on database design and SQL Server implementation. It does not include a complete production application, user interface, authentication system, or deployment environment.
