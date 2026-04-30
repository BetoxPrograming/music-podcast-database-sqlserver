# Data Dictionary

This file describes the main tables used in the Music & Podcast database.

## Main tables

### Users

Stores user information.

| Field | Data type | Description |
|---|---|---|
| ID_Usuario | INT | Unique user identifier. |
| Nombre | VARCHAR(30) | User first name. |
| Apellido | VARCHAR(30) | User last name. |
| Correo | VARCHAR(50) | User email address. |
| Contraseña | VARCHAR(30) | User password. |
| Fecha_de_Registro | DATE | User registration date. |
| ID_Rol | INT | Role assigned to the user. |

### Roles

Stores the available user roles.

| Field | Data type | Description |
|---|---|---|
| ID_Rol | INT | Unique role identifier. |
| nombre_rol | NVARCHAR(30) | Name of the role, such as administrator, user, or moderator. |

### Artists

Stores information about artists and content creators.

| Field | Data type | Description |
|---|---|---|
| ID_Artista | INT | Unique artist identifier. |
| nombre_artistico | NVARCHAR(50) | Public or artistic name. |
| nombre_real | NVARCHAR(30) | Real first name. |
| apellido_real | NVARCHAR(30) | Real last name. |
| nacionalidad | NVARCHAR(30) | Country or region of origin. |
| biografia | NVARCHAR(MAX) | Short biography or career description. |

### Songs

Stores song information.

| Field | Data type | Description |
|---|---|---|
| ID_Cancion | INT | Unique song identifier. |
| Titulo | NVARCHAR(100) | Song title. |
| Duracion | TIME | Song duration. |
| ID_Album | INT | Album related to the song. |

### Albums

Stores album information.

| Field | Data type | Description |
|---|---|---|
| ID_Album | INT | Unique album identifier. |
| Titulo | NVARCHAR(100) | Album title. |
| Fecha_lanzamiento | DATE | Album release date. |
| Descripcion | NVARCHAR(300) | Album description. |

### Podcasts

Stores podcast information.

| Field | Data type | Description |
|---|---|---|
| ID_Podcast | INT | Unique podcast identifier. |
| Titulo | NVARCHAR(100) | Podcast title. |
| Descripcion | NVARCHAR(300) | Podcast description. |
| Categoria | NVARCHAR(50) | Podcast category. |

### Episodes

Stores podcast episode information.

| Field | Data type | Description |
|---|---|---|
| ID_Episodio | INT | Unique episode identifier. |
| Titulo | NVARCHAR(100) | Episode title. |
| Fecha_lanzamiento | DATE | Episode release date. |
| Duracion | TIME | Episode duration. |
| ID_Podcast | INT | Podcast related to the episode. |

### Subscriptions

Stores subscription plans.

| Field | Data type | Description |
|---|---|---|
| ID_Suscripcion | INT | Unique subscription identifier. |
| Nombre | NVARCHAR(30) | Subscription plan name. |
| Precio | DECIMAL(10,2) | Subscription price. |

## Dependent tables

### Pago_Suscripcion

Stores subscription payments made by users.

| Field | Data type | Description |
|---|---|---|
| ID_Usuario | INT | User who made the payment. |
| ID_Suscripcion | INT | Subscription related to the payment. |
| Fecha_pago | DATE | Payment date. |

### Canciones_Escuchadas

Stores the relationship between users and listened songs.

| Field | Data type | Description |
|---|---|---|
| ID_Usuario | INT | User who listened to the song. |
| ID_Cancion | INT | Song listened by the user. |

### Episodios_Vistos

Stores the relationship between users and viewed episodes.

| Field | Data type | Description |
|---|---|---|
| ID_Usuario | INT | User who viewed the episode. |
| ID_Episodio | INT | Episode viewed by the user. |

### Albumes_Guardados

Stores albums saved by users.

| Field | Data type | Description |
|---|---|---|
| ID_Usuario | INT | User who saved the album. |
| ID_Album | INT | Saved album. |

### Podcast_Guardados

Stores podcasts saved by users.

| Field | Data type | Description |
|---|---|---|
| ID_Usuario | INT | User who saved the podcast. |
| ID_Podcast | INT | Saved podcast. |

### Artistas_Favoritos

Stores favorite artists selected by users.

| Field | Data type | Description |
|---|---|---|
| ID_Usuario | INT | User who marked the artist as favorite. |
| ID_Artista | INT | Favorite artist. |

### Albumes_Compuestos

Represents the relationship between artists and albums.

| Field | Data type | Description |
|---|---|---|
| ID_Artista | INT | Artist related to the album. |
| ID_Album | INT | Album related to the artist. |

### Canciones_Compuestas

Represents the relationship between artists and songs.

| Field | Data type | Description |
|---|---|---|
| ID_Cancion | INT | Song related to the artist. |
| ID_Artista | INT | Artist related to the song. |

### Podcast_Locutados

Represents the relationship between artists and podcasts.

| Field | Data type | Description |
|---|---|---|
| ID_Podcast | INT | Podcast related to the artist. |
| ID_Artista | INT | Artist related to the podcast. |

### Episodios_Locutados

Represents the relationship between artists and episodes.

| Field | Data type | Description |
|---|---|---|
| ID_Episodio | INT | Episode related to the artist. |
| ID_Artista | INT | Artist related to the episode. |
