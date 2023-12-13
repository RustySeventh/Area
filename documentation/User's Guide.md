# AREA project

Epitech's 3rd year **Web Development** project

## Table of content:
- [About](#about)
- [Our Group](#our_group)
- [Installation](#installation)
	- [Prerequisites](#prerequisites)
	- [Startup](#startup)
- [Endpoints](#endpoints)
	- [about.json](#api_about)
	- [api/login](#api_login)
	- [api/logout](#api_logout)
	- [api/register](#api_register)
	- [api/update_triggers](#api_update_triggers)
	- [api/get_user_data](#api_get_user_data)
	- [api/spotify_login](#api_sp_login)
	- [api/discord_login](#api_dis_login)
 - [Services](#services)

<a id="about"></a>
## About

This is Epitech's 3rd year project. It is a web development project, whose goal is to write business logic between 3 parts: a *mobile app* and a *web app*, both connected to the *application server*, which we will describe in the following document.

<a id="our_group"></a>
## Our group
* Size of group : 5
* Repository : [B-DEV-500-NCY-5-1-area-alessio.saturno](https://github.com/EpitechPromo2026/B-DEV-500-NCY-5-1-area-alessio.saturno)
* Languages used: Python, Dart
* Frameworks used: Django, Flutter

<a id="installation"></a>
## Installation
<a id="prerequisites"></a>
### Prerequisites
##### Docker
```
sudo apt-get install docker
```
```
sudo apt-get install docker-compose
```

<a id="startup"></a>
### Startup

Download the repository and open a **terminal** in the folder

Run:
```
sudo docker-compose up --build
```
This will start the *application server* using docker, allowing your *front app* to connect to it. The address your front app should connect to is:
```
http://localhost:8080/
```
*You may want to replace `localhost` with your machine's ip address, as the application server runs locally

<a id="endpoints"></a>
## Endpoints
<a id="api_about"></a>
### `about.json`
##### Request
Headers: None
Body: None
##### Response
`200 - [A list of all Action, and their linked Reactions]` if the action was performed correctly

<a id="api_login"></a>
### `api/login`
##### Request
Headers: 
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;email: [Your email]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;password: [Your password]
}
Body: None
##### Response
`200 - Login successful` if the action was performed correctly
`401 - You're already connected` if you are already logged in and try again
`401 - Wrong email or password` if you entered wrong credentials

<a id="api_logout"></a>
### `api/logout`
##### Request
Headers: None
Body: None
##### Response
`200 - Logout successful` if the action was performed correctly
`401 - Not logged in` if you are not logged in and try to logout

<a id="api_register"></a>
### `api/register`
##### Request
Headers: 
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;email: [Your email]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;password: [Your password]
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;username: [Your username]
}
Body: None
##### Response
`200 - User created` if the action was performed correctly
`401 - At least one field is empty` if one or more fields are empty
`401 - Email already exists` if there is already a user with the same email

<a id="api_update_triggers"></a>
### `api/update_triggers`
##### Request
Headers: None
Body: [A list of all Action, and their linked Reactions]
##### Response
`200 - Triggers updated` if the action was performed correctly
`401 - You're not logged in` if you are not logged in yet

<a id="api_get_user_data"></a>
### `api/get_user_data`
##### Request
Headers: None
Body: None
##### Response
`200 - [A list of all Action, and their linked Reactions]` if the action was performed correctly
`401 - You're not logged in` if you are not logged in yet

<a id="api_sp_login"></a>
### `api/spotify_login`
##### Request
Headers: None
Body: None
##### Response
`200 - [The URL to authorize with Spotify]` if the action was performed correctly
`401 - You're not logged in` if you are not logged in yet

<a id="api_dis_login"></a>
### `api/discord_login`
##### Request
Headers: None
Body: None
##### Response
`200 - [The URL to authorize with Spotify]` if the action was performed correctly
`401 - You're not logged in` if you are not logged in yet

<a id="services"></a>
## Services
Go to [documentation](https://github.com/EpitechPromo2026/B-DEV-500-NCY-5-1-area-alessio.saturno/tree/main/documentation/AREA%20services.png), to see a list of all available Services
