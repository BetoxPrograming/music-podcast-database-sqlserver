# Technical Decisions

## SQL Server and T-SQL

The project was implemented using SQL Server Management Studio and T-SQL.

This decision allowed the database to use relational database features such as tables, primary keys, foreign keys, stored procedures, functions, views, triggers, and validation queries.

## Relational database approach

A relational model was used because the system needs to manage structured information related to users, roles, artists, albums, songs, podcasts, episodes, subscriptions, payments, favorites, and activity records.

This approach helps organize the data into connected tables instead of storing all information in one large structure.

## Entity-relationship model to relational model

The project started with an entity-relationship diagram and then moved to a relational model.

This helped identify the main entities, attributes, relationships, primary keys, foreign keys, and intermediate tables required by the system.

## Normalization up to 3NF

The database was organized following normalization principles up to Third Normal Form.

This decision helps reduce duplicated data, separate independent concepts into their own tables, and preserve consistency across the database.

## Main and dependent tables

The database separates main tables from dependent tables.

Main tables store core information, such as users, roles, artists, songs, albums, podcasts, episodes, and subscriptions.

Dependent tables store relationships, activity, payments, saved content, and favorites.

## Intermediate tables for many-to-many relationships

Many-to-many relationships were implemented using intermediate tables.

Examples include:

- Canciones_Escuchadas
- Episodios_Vistos
- Albumes_Guardados
- Podcast_Guardados
- Artistas_Favoritos
- Albumes_Compuestos
- Canciones_Compuestas
- Podcast_Locutados
- Episodios_Locutados

This keeps the database normalized and avoids repeated data inside the main tables.

## Database creation order

The database was created in stages:

1. Create the database.
2. Create the tables.
3. Add primary keys.
4. Add foreign keys.
5. Create stored procedures.
6. Insert data using stored procedures.
7. Create functions.
8. Create views.
9. Create triggers.
10. Validate the created objects.

This order helps avoid dependency errors between tables and database objects.

## Primary keys

Primary keys were used to identify each record in the main tables.

Some tables use simple primary keys, such as Users, Roles, Artists, Songs, Albums, Podcasts, Episodes, and Subscriptions.

Other tables use composite primary keys because they represent relationships between two entities.

## Foreign keys

Foreign keys were used to connect related tables and preserve referential integrity.

This prevents invalid references, such as a song assigned to a non-existing album, an episode assigned to a non-existing podcast, or a payment assigned to a non-existing user.

## Stored procedures

Stored procedures were created to insert data into the tables.

The project uses one insertion procedure per table. This makes the insertion process more organized, reusable, and easier to maintain.

## Data insertion through procedures

Data was inserted using stored procedures instead of writing direct INSERT statements everywhere.

This decision helps keep the insertion logic consistent and reduces errors during data loading.

## Functions

Scalar functions were implemented to support reusable calculations and statistics.

These functions help avoid repeating the same logic in different queries.

## Views

Views were created to simplify consultation of related data.

This allows complex JOIN queries to be reused through a simpler structure, making reports and data analysis easier.

## Triggers

Triggers were created to automate specific actions after database events.

For example, one trigger automatically updates the payment date when a subscription payment is inserted without a date.

This supports automation and helps preserve data integrity.

## Validation queries

Validation queries were used to confirm that the database objects were created correctly.

The project validates:

- Created tables
- Primary keys
- Foreign keys
- Stored procedures
- Functions
- Views
- Triggers
- Inserted data examples

## Project limitation

This project focuses on database design and SQL Server implementation.

It does not include a full production application, user interface, authentication system, deployment environment, or commercial integration.
