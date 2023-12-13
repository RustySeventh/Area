# Project overview

The AREA project consists in the creation of a software suite that functions similarly to IFTTT and/or Zapier. This software suite is a divided into 3 parts:
```
A server to implement all the features.
A web application to use the app from a browser.
A mobile application to use the app from a phone.
```

### Languages

#### This project was developped using the following languages:
```
Server → Python.
Database → Django.
Web application → Flutter.
Mobile application → Flutter.
```

### Documentation

#### In the documentation/ folder you can find these documents:

```
User's guide.md → Technical documentation to use the API
AREA services.png → Diagram showing all the AREAs workflow
```

### Mobile app

![Home page](/assets/Home_page.png)
![Services page](/assets/Services_page.png)

### Services
Here are all the different actions/reactions that you can use:

- YouTube:
  - Actions:
    - Detect if there is a new video on channel X (enter the name of an existing channel)
    - Detect if there is a new subscriber to channel X
- Discord:
  - Action: Detect if we have received a DM
  - Reactions:
    - Send a DM
    - Send a message in a server channel
- Weather:
  - Action: Detect if it is more/less than X degrees in a city
- Timer:
  - Action: End of timer
- Currency Conversion:
  - Action: Detect if a certain currency surpasses/falls below X amount.
- Spotify:
  - Reactions:
    - Add a new playlist
    - Delete a playlist
    - Play the next song
    - Play the previous song
    - Pause the current music
    - Resume the current music
    - Queue a song
