# Database Implementation

## General implementation

The database was implemented in SQL Server Management Studio using T-SQL scripts.

The implementation followed this order:

1. Create the database.
2. Create the tables.
3. Add primary keys.
4. Add foreign keys.
5. Create stored procedures.
6. Insert data using stored procedures.
7. Create scalar functions.
8. Create views.
9. Create triggers.
10. Validate the created objects using SQL Server system queries.

## Database creation

The database was created using the name `BD_Tienda_Musica_Podcast`.

This database works as the main container for the tables, relationships, stored procedures, functions, views, triggers, and validation queries.

## Table creation

The project includes 18 tables created according to the relational model.

The tables were created first without primary keys or foreign keys. This allowed the structure to be defined before adding relational constraints.

## Primary keys

Primary keys were added after table creation using `ALTER TABLE`.

Simple primary keys were used for main entity tables, while composite primary keys were used for intermediate relationship tables.

## Foreign keys

Foreign keys were added after primary keys.

They connect related tables and preserve referential integrity between users, roles, content, artists, subscriptions, payments, favorites, and activity records.

## Stored procedures

The project includes one insertion stored procedure for each table.

The purpose of these procedures is to organize the insertion process, reduce repeated SQL logic, and make data loading more controlled.

## Data insertion

Data was inserted using the stored procedures.

This approach keeps the insertion process consistent and allows each table to receive data through a defined parameter structure.

## Functions

Scalar functions were implemented to support reusable calculations and statistics.

Examples include counting user activity, such as the total number of songs listened to by a specific user.

## Views

Views were created to simplify queries that combine data from multiple tables.

For example, one view connects users with their assigned roles, making the data easier to consult without writing the full JOIN query every time.

## Triggers

Triggers were implemented to automate database actions and support data integrity.

For example, one trigger updates the payment date automatically when a subscription payment is inserted without a date.

## Validation

Validation queries were used to confirm that tables, primary keys, foreign keys, stored procedures, functions, views, and triggers were created correctly.
