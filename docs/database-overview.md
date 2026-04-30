# Database Overview

## General description

This project is a relational database for a digital music and podcast store. It was built using SQL Server and T-SQL.

The database organizes information about users, roles, artists, albums, songs, podcasts, episodes, subscriptions, payments, saved content, listened songs, viewed episodes, and artist-content relationships.

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

## Dependent tables

The database also includes dependent tables used to represent activity, favorites, payments, and many-to-many relationships:

- Subscription payments
- Listened songs
- Viewed episodes
- Saved albums
- Saved podcasts
- Favorite artists
- Album compositions
- Song compositions
- Podcast narrations
- Episode narrations

## Database goal

The main goal of the database is to keep the system data organized, reduce redundancy, and preserve consistency between related information.

The design uses primary keys, foreign keys, composite keys, normalization, stored procedures, views, functions, triggers, and validation queries.
