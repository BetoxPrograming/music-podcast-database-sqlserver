# Database Relationships

This file explains how the database tables are connected through primary keys, foreign keys, relationship types, and intermediate tables.

The goal of this section is to show how the database preserves uniqueness, consistency, and referential integrity between the main entities of the system.

## Primary keys

Primary keys identify each record in a table. They help guarantee that each row is unique and can be referenced from other tables.

| Table | Primary key | Data type | Notes |
|---|---|---|---|
| Usuarios | ID_Usuario | INT | Unique user identifier. |
| Roles | ID_Rol | INT | Unique role identifier. |
| Artistas | ID_Artista | INT | Unique artist identifier. |
| Canciones | ID_Cancion | INT | Unique song identifier. |
| Albumes | ID_Album | INT | Unique album identifier. |
| Podcast | ID_Podcast | INT | Unique podcast identifier. |
| Episodios | ID_Episodio | INT | Unique episode identifier. |
| Suscripciones | ID_Suscripcion | INT | Unique subscription identifier. |
| Pago_Suscripcion | ID_Usuario, ID_Suscripcion | INT, INT | Composite key for user subscription payments. |
| Canciones_Escuchadas | ID_Usuario, ID_Cancion | INT, INT | Composite key for listened songs. |
| Episodios_Vistos | ID_Usuario, ID_Episodio | INT, INT | Composite key for viewed episodes. |
| Albumes_Guardados | ID_Usuario, ID_Album | INT, INT | Composite key for saved albums. |
| Podcast_Guardados | ID_Usuario, ID_Podcast | INT, INT | Composite key for saved podcasts. |
| Artistas_Favoritos | ID_Usuario, ID_Artista | INT, INT | Composite key for favorite artists. |
| Albumes_Compuestos | ID_Artista, ID_Album | INT, INT | Composite key for artist-album relationships. |
| Canciones_Compuestas | ID_Cancion, ID_Artista | INT, INT | Composite key for song-artist relationships. |
| Podcast_Locutados | ID_Podcast, ID_Artista | INT, INT | Composite key for podcast-artist relationships. |
| Episodios_Locutados | ID_Episodio, ID_Artista | INT, INT | Composite key for episode-artist relationships. |

## Relationship analysis

The relationship analysis explains how the tables interact with each other. It also identifies the foreign keys used to preserve referential integrity in the database.

| Main table | Related table | Relationship type | Foreign key | Explanation |
|---|---|---|---|---|
| Roles | Usuarios | 1:N | ID_Rol in Usuarios | One role can be assigned to many users, but each user has only one role. |
| Usuarios | Pago_Suscripcion | 1:N | ID_Usuario in Pago_Suscripcion | One user can make several subscription payments. |
| Suscripciones | Pago_Suscripcion | 1:N | ID_Suscripcion in Pago_Suscripcion | One subscription plan can be related to many payments. |
| Albumes | Canciones | 1:N | ID_Album in Canciones | One album can contain many songs, but each song belongs to one album. |
| Podcast | Episodios | 1:N | ID_Podcast in Episodios | One podcast can contain many episodes. |
| Artistas | Albumes_Compuestos | N:M | ID_Artista, ID_Album | One artist can participate in many albums, and one album can include many artists. |
| Artistas | Canciones_Compuestas | N:M | ID_Artista, ID_Cancion | One artist can compose many songs, and one song can be related to many artists. |
| Artistas | Podcast_Locutados | N:M | ID_Artista, ID_Podcast | One artist can narrate many podcasts, and one podcast can include many artists. |
| Artistas | Episodios_Locutados | N:M | ID_Artista, ID_Episodio | One artist can narrate many episodes, and one episode can include many artists. |
| Usuarios | Canciones_Escuchadas | N:M | ID_Usuario, ID_Cancion | One user can listen to many songs, and one song can be listened to by many users. |
| Usuarios | Episodios_Vistos | N:M | ID_Usuario, ID_Episodio | One user can view many episodes, and one episode can be viewed by many users. |
| Usuarios | Albumes_Guardados | N:M | ID_Usuario, ID_Album | One user can save many albums, and one album can be saved by many users. |
| Usuarios | Podcast_Guardados | N:M | ID_Usuario, ID_Podcast | One user can save many podcasts, and one podcast can be saved by many users. |
| Usuarios | Artistas_Favoritos | N:M | ID_Usuario, ID_Artista | One user can have many favorite artists, and one artist can be marked as favorite by many users. |

## One-to-many relationships

One-to-many relationships were used when one record from a main table can be related to several records in another table.

Examples:

- One role can be assigned to many users.
- One album can contain many songs.
- One podcast can contain many episodes.
- One user can make several subscription payments.
- One subscription plan can appear in many payment records.

## Many-to-many relationships

Many-to-many relationships were implemented using intermediate tables.

This avoids duplicated data and keeps the model normalized.

Examples of intermediate tables:

- Canciones_Escuchadas
- Episodios_Vistos
- Albumes_Guardados
- Podcast_Guardados
- Artistas_Favoritos
- Albumes_Compuestos
- Canciones_Compuestas
- Podcast_Locutados
- Episodios_Locutados

## Referential integrity

Foreign keys were used to preserve consistency between related tables.

This prevents invalid references, such as:

- A song assigned to a non-existing album.
- An episode assigned to a non-existing podcast.
- A payment assigned to a non-existing user.
- A favorite artist assigned to a non-existing artist.
- A saved album assigned to a non-existing user.

## Summary

The relationship structure allows the database to connect users, content, artists, subscriptions, activity, favorites, and purchases in an organized way.

The use of primary keys, foreign keys, composite keys, and intermediate tables supports data consistency and keeps the relational model normalized.
