# Normalization Notes

## Project-specific approach

This database was designed directly from the entity-relationship diagram and the relational model. Because of that, the project did not start from one large unnormalized table and then split it step by step.

Instead, the tables were created already separated by entity and relationship. This helped keep the database organized from the beginning and supported normalization up to Third Normal Form (3NF).

The original project includes normalized sample tables for users, roles, artists, songs, albums, podcasts, episodes, subscriptions, payments, user activity, saved content, favorite artists, and artist-content relationships.

## Normalization goal

The goal of normalization in this project was to:

- Reduce duplicated data.
- Separate independent entities into their own tables.
- Use foreign keys to connect related information.
- Use intermediate tables for many-to-many relationships.
- Keep each table focused on one main concept.
- Preserve referential integrity between tables.

## Example 1: Users and Roles

User information and role information were separated into two tables.

### Users

| ID_Usuario | Nombre | Apellido | Correo | Fecha_de_Registro | ID_Rol |
|---|---|---|---|---|---|
| 1 | Carlos | Álvarez | carlos.alvarez@email.com | 2024-06-29 | 1 |
| 2 | José | Fernández | jose.fernandez@email.com | 2024-06-29 | 1 |
| 3 | Karina | López | karina.lopez@email.com | 2024-06-30 | 2 |

### Roles

| ID_Rol | nombre_rol |
|---|---|
| 1 | Administrador |
| 2 | Usuario |
| 3 | Moderador |

### Normalization decision

The role name is not repeated inside the Users table. Instead, Users stores only `ID_Rol`, and the role details are stored in the Roles table.

This avoids repeating values like "Administrador", "Usuario", or "Moderador" for every user.

## Example 2: Albums and Songs

Albums and songs were separated into different tables because an album can contain several songs.

### Albums

| ID_Album | Titulo | Fecha_lanzamiento |
|---|---|---|
| 1 | Parachutes | 2000-07-10 |
| 2 | A Rush of Blood to the Head | 2002-08-26 |
| 3 | X&Y | 2005-06-06 |

### Songs

| ID_Cancion | Titulo | Duracion | ID_Album |
|---|---|---|---|
| 1 | Yellow | 00:04:29 | 1 |
| 2 | The Scientist | 00:05:09 | 2 |
| 3 | Clocks | 00:05:07 | 2 |

### Normalization decision

The album information is not repeated in every song record. Each song stores `ID_Album` as a foreign key.

This keeps album data in one place and allows several songs to be connected to the same album.

## Example 3: Podcasts and Episodes

Podcasts and episodes were separated because one podcast can have multiple episodes.

### Podcasts

| ID_Podcast | Titulo | Categoria |
|---|---|---|
| 1 | 99% Invisible | Diseño |
| 2 | Waveform | Tecnología |
| 3 | The Daily | Noticias |

### Episodes

| ID_Episodio | Titulo | Fecha_lanzamiento | Duracion | ID_Podcast |
|---|---|---|---|---|
| 1 | The Hidden World of Design | 2020-01-15 | 00:28:15 | 1 |
| 2 | Sound and Space | 2020-02-12 | 00:30:03 | 1 |
| 3 | Invisible Infrastructure | 2020-03-18 | 00:32:40 | 1 |

### Normalization decision

Podcast information is stored once in the Podcasts table. Each episode references its podcast through `ID_Podcast`.

This avoids repeating the podcast title, description, or category for every episode.

## Example 4: Many-to-many relationships

Several relationships in this project are many-to-many. These relationships were separated into intermediate tables.

### Saved albums

| ID_Usuario | ID_Album |
|---|---|
| 1 | 2 |
| 1 | 4 |
| 2 | 1 |

### Favorite artists

| ID_Usuario | ID_Artista |
|---|---|
| 1 | 5 |
| 17 | 3 |
| 12 | 2 |

### Song compositions

| ID_Cancion | ID_Artista |
|---|---|
| 12 | 5 |
| 45 | 33 |
| 3 | 1 |

### Normalization decision

These tables do not store repeated user, album, artist, or song details. They only store the identifiers needed to connect records.

This keeps the model normalized and allows flexible relationships, such as:

- One user saving many albums.
- One album being saved by many users.
- One artist being related to many songs.
- One song being related to many artists.

## Tables used as normalized examples

The project documentation includes sample records for the normalized tables, instead of showing all 50 records for each table.

This is enough for documentation because the complete data belongs in the SQL insertion scripts, not inside this explanation file.

## Result

The final database structure supports 3NF because each table has a clear purpose, repeated data is reduced, foreign keys connect related entities, and many-to-many relationships are handled through intermediate tables.

The full structure is supported by the relational model, primary keys, foreign keys, composite keys, and SQL Server implementation scripts.
