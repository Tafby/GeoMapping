# GeoMapping Writeup

### My solution
I used MapKit inside of a navigation controller and used the built in annotations library to display points on the map. When the user selects a point, I push a detail view onto the navigation controller.



### Things I learned
I learned so much while doing this project! I have been mostly using SpriteKit to create small games, so a lot of things in this project were new to me. Some of the things I learned include: 

* HTTP Requests using URLSesssion 
* How to parse JSON using Codable
* All the details of Mapkit, annotations, centering, etc.
* How to use a navigation controller to navigate views


### Things I would do if I had more time

##### Start the map centered on the users location instead of hard coding Seattle
I ended up hard coding a location, so that I didn't have to keep zooming in to see all of the annotations on the map

##### Error handling: Missing data, HTTP errors, etc.
I don't really have much error handling, so given more time i'd like to add that. 

##### Learn SwiftUI
When I started out, I was trying to use the MapKit with SwiftUI, but it ended up taking me to long to learn, so I went with storyboard instead.

### Shortcomings

##### Details page styling
The details page could look much better, I had some trouble with UIStackView and ending up using only UILabels

##### Organization of code
I know the organization of the code could definitely be better. I am still learning the proper way to organize files, func, etc

##### Best practices
I've learned a lot of new things during this project and had to use a lot of different resources including: blog posts, documentation, and youtube videos. I strived to follow best practices throughout the project, but this can be challenging while trying to learn new patterns. 


