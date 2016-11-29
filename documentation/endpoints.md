# PROFILE API

**Authentication required for POST, PUT/PATCH, and DELETE**

- Authorization: Token token={your token}

## `GET /profiles`
 
**response:**
 
- Status Code: 200

Sample Response: 

```json
{
	"name": "Pablo Picasso",
	"style": "Cubism",
	"profile_type": "artist",
	"description": "Picasso was an influential artist in the 20th century..." 
}
```

## `POST /profiles`
**Body Parameters:**

- name: *String*
- style: *String*
- profile_type: *String*
- description: *String*

Sample Response: 

- Status Code: 201

```json
{
	"name": "Pablo Picasso",
	"style": "Cubism",
	"profile_type": "artist",
	"description": "Picasso was an influential artist in the 20th century..." 
}
```

## `PUT,PATCH /profiles/:id`

**Body Parameters:**

- first_name: *String*
- last_name: *String*
- username: *String*
- email: *String*

Sample Response: 
- Status Code: 200

```json
{
	"name": "Pablo Picasso",
	"style": "Cubism",
	"profile_type": "artist",
	"description": "Picasso was an influential artist in the 20th century..." 
}
```

## `DELETE /profiles/:id`
**response:**
- Status Code: 200

```json
{
	"name": "Pablo Picasso",
	"style": "Cubism",
	"profile_type": "artist",
	"description": "Picasso was an influential artist in the 20th century..." 
}
```


# PHOTO API
**Authentication required for POST, PUT/PATCH, and DELETE**

- Authorization: Token token={your token}

## `GET /profiles/:profile_id/photos`
 
**response:**
 
- Status Code: 200

Sample Response: 

```json
{
	[{"profile_id": "1",
	"photo_file_name": "Picasso1.jpg",
	"photo_content_type": "img/jpeg",
	"showing_id": "2"},
	"{{photo_url}}"]
}
```

## `GET /photos/:id`
 
**response:**
 
- Status Code: 200

Sample Response: 

```json
{
	[{"profile_id": "1",
	"photo_file_name": "Picasso1.jpg",
	"photo_content_type": "img/jpeg",
	"showing_id": "2"},
	"{{photo_url}}"]
}
```

## `POST /profiles/:profile_id/photos`
**Body Parameters:**

- profile_id: *Integer*
- price: *Integer*
- description: *String*
- order: *Integer*
- photo: *Image*
- showing_id: *Integer*

Sample Response: 

- Status Code: 201

```json
{
	[{"profile_id": "1",
	"photo_file_name": "Picasso1.jpg",
	"photo_content_type": "img/jpeg",
	"showing_id": "2"},
	"{{photo_url}}"]
}
```

## `PUT,PATCH /profiles/:profile_id/photos/:id or /photos/:id`

**Body Parameters:**

- profile_id: *Integer*
- price: *Integer*
- description: *String*
- order: *Integer*
- photo: *Image*
- showing_id: *Integer*

Sample Response: 
- Status Code: 200

```json
{
	[{"profile_id": "1",
	"photo_file_name": "Picasso1.jpg",
	"photo_content_type": "img/jpeg",
	"showing_id": "2"},
	"{{photo_url}}"]
}
```

## `DELETE /profiles/:profile_id/photos/:id`
**response:**
- Status Code: 200

```json
{
	[{"profile_id": "1",
	"photo_file_name": "Picasso1.jpg",
	"photo_content_type": "img/jpeg",
	"showing_id": "2"},
	"{{photo_url}}"]
}
```

# SHOWING API
**Authentication required for POST and DELETE**

- Authorization: Token token={your token}

## `GET /showings`
 
**response:**
 
- Status Code: 200

Sample Response: 

```json
{
	"artist_id": "1",
	"gallery_id": "2",
	"description": "Check out Picasso's art here!",
}
```
## `GET /showings/:id`
 
**response:**
 
- Status Code: 200

Sample Response: 

```json
{
	"artist_id": "1",
	"gallery_id": "2",
	"description": "Check out Picasso's art here!",
}
```

## `POST /profiles/:profile_id/showings/`
 
**response:**
 
- Status Code: 201

Sample Response: 

```json
{
	"artist_id": "1",
	"gallery_id": "2",
	"description": "Check out Picasso's art here!",
}
```

## `DELTE /showings/:id`
 
**response:**
 
- Status Code: 200

Sample Response: 

```json
{
	"artist_id": "1",
	"gallery_id": "2",
	"description": "Check out Picasso's art here!",
}
```