# Database Relationships

This file explains the main relationships used in the database.

## Relationship types

The database uses two main relationship types:

- One-to-many relationships.
- Many-to-many relationships using intermediate tables.

## One-to-many relationships

### Roles to Users

One role can be assigned to many users, but each user has only one role.

- Relationship: 1:N
- Foreign key: ID_Rol in Users

### Albums to Songs

One album can contain many songs, but each song belongs to one album.

- Relationship: 1:N
- Foreign key: ID_Album in Songs

### Podcasts to Episodes

One podcast can contain many episodes, but each episode belongs to one podcast.

- Relationship: 1:N
- Foreign key: ID_Podcast in Episodes

### Users to Subscription Payments

One user can make several subscription payments.

- Relationship: 1:N
- Foreign key: ID_Usuario in Pago_Suscripcion

### Subscriptions to Subscription Payments

One subscription plan can be related to many payments.

- Relationship: 1:N
- Foreign key: ID_Suscripcion in Pago_Suscripcion

## Many-to-many relationships

Many-to-many relationships were implemented using intermediate tables.

### Users and Songs

A user can listen to many songs, and a song can be listened to by many users.

- Intermediate table: Canciones_Escuchadas
- Composite key: ID_Usuario, ID_Cancion

### Users and Episodes

A user can view many episodes, and an episode can be viewed by many users.

- Intermediate table: Episodios_Vistos
- Composite key: ID_Usuario, ID_Episodio

### Users and Albums

A user can save many albums, and an album can be saved by many users.

- Intermediate table: Albumes_Guardados
- Composite key: ID_Usuario, ID_Album

### Users and Podcasts

A user can save many podcasts, and a podcast can be saved by many users.

- Intermediate table: Podcast_Guardados
- Composite key: ID_Usuario, ID_Podcast

### Users and Artists

A user can mark many artists as favorite, and an artist can be marked as favorite by many users.

- Intermediate table: Artistas_Favoritos
- Composite key: ID_Usuario, ID_Artista

### Artists and Albums

An artist can participate in many albums, and an album can include many artists.

- Intermediate table: Albumes_Compuestos
- Composite key: ID_Artista, ID_Album

### Artists and Songs

An artist can compose many songs, and a song can be related to many artists.

- Intermediate table: Canciones_Compuestas
- Composite key: ID_Cancion, ID_Artista

### Artists and Podcasts

An artist can narrate many podcasts, and a podcast can include many artists.

- Intermediate table: Podcast_Locutados
- Composite key: ID_Podcast, ID_Artista

### Artists and Episodes

An artist can narrate many episodes, and an episode can include many artists.

- Intermediate table: Episodios_Locutados
- Composite key: ID_Episodio, ID_Artista

## Referential integrity

Foreign keys were used to preserve consistency between tables. This prevents invalid relationships, such as a song being assigned to a non-existing album or a payment being assigned to a non-existing user.
