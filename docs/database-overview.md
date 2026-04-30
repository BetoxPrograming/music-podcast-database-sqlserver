# Database Overview

## General description

This project is a relational database for a digital music and podcast store. It was implemented using SQL Server Management Studio and T-SQL.

The database was designed to organize, store, and consult information about users, roles, artists, albums, songs, podcasts, episodes, subscriptions, payments, saved content, listened songs, viewed episodes, and artist-content relationships.

## Database name

The database was created with the following name:

```sql
BD_Tienda_Musica_Podcast
```

This database acts as the main container for tables, relationships, stored procedures, functions, views, triggers, and validation queries.

## Main entities

The main entities of the database are:

- Users
- Roles
- Artists
- Songs
- Albums
- Podcasts
- Episodes
- Subscriptions

These tables store the main information required by the system.

## Dependent tables

The database also includes dependent tables used to represent payments, user activity, saved content, favorites, and many-to-many relationships:

- Pago_Suscripcion
- Canciones_Escuchadas
- Episodios_Vistos
- Albumes_Guardados
- Podcast_Guardados
- Artistas_Favoritos
- Albumes_Compuestos
- Canciones_Compuestas
- Podcast_Locutados
- Episodios_Locutados

These tables help connect the main entities without duplicating data.

## Database objects

The project includes several SQL Server objects:

- Tables
- Primary keys
- Foreign keys
- Composite keys
- Stored procedures
- Scalar functions
- Views
- Triggers
- Validation queries

## Implementation summary

The database implementation followed this general order:

1. Create the database.
2. Create the 18 tables.
3. Add primary keys.
4. Add foreign keys.
5. Create stored procedures.
6. Insert data using stored procedures.
7. Create scalar functions.
8. Create views.
9. Create triggers.
10. Validate the database objects using SQL Server system queries.

## Stored procedures

The database includes one insertion stored procedure for each table.

These procedures were created to make the data insertion process more organized, reusable, and consistent.

## Functions

Scalar functions were created to support reusable calculations and statistics.

For example, one function calculates the total number of songs listened to by a specific user.

## Views

Views were created to simplify queries that combine data from multiple tables.

For example, one view shows users with their assigned roles without requiring the full JOIN query every time.

## Triggers

Triggers were implemented to automate database actions and support data integrity.

For example, one trigger automatically updates the payment date when a subscription payment is inserted without a date.

## Database goal

The main goal of the database is to keep the system data organized, reduce redundancy, preserve referential integrity, and support future scalability.

The final design combines normalization, relational modeling, SQL Server constraints, stored procedures, views, functions, triggers, and validation queries.
