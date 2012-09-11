# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: 'marco', password: "rtfgvb90", password_confirmation: "rtfgvb90", email: "marco@marcosero.com")

Post.create(title: "Event Detection", content_md: "## DBSCAN Algorithm in Map/Reduce logic, implemented with Hadoop and MongoDB

## The Project
This project is my thesis work for my bachelor degree at the Department of Computer Science of University of Turin.  
It would not have been possible without the help and the supervision of [Prof. Giancarlo Ruffo](http://www.di.unito.it/~ruffo/) and the [ARCS group](http://arcs.di.unito.it/).

## Algorithm
### Just a bit of background
The algorithm use the map/reduce logic to analyze tweets and photos in MongoDB and to create geolocated **events**.  

A *point* is a tweet or a photo, with an hashtag and a geotag.  
A *cluster* is an event, with a number of points analyzed and a number of neighboring points to analyze.

#### Hadoop

![Hadoop](https://raw.github.com/MarcoSero/Event-Detection/master/images/hadoop.jpg)

I choosed [Hadoop](http://hadoop.apache.org/) to realize Map/Reduce because it is the most widely used framework for this kind of job and it has large documentation.  
In this way, I don't care about multithreading and multiprocessing and I leave Hadoop this kind of jobs.

The algorithm is running on a server with 16 cores and 32GB of RAM.
This is my [mapred-site.xml](http://cl.ly/IrX1) if someone cares.

#### MongoDB

![Hadoop](https://raw.github.com/MarcoSero/Event-Detection/master/images/mongodb.png)

After a deep research in many relational and not relational database, [MongoDB](http://www.mongodb.org/) was my choice. It has a great documentation, a powerful support of geolocated queries and it is very scalable.  
The Mongo-Hadoop plugin let me to integrate it in MongoDB. Its config options are in the file `mongo-dbscan.xml`.

### Map
The map function reads the points in input. All points are not visited; this is due to the input query execute in MongoDB from Hadoop.  
If a point has enought points in neighborhood, then a cluster will be emitted and the point is marked as clusterized; otherwise, do nothing.

### Reduce
The reduce function has in input an 'array' of clusters with the same key.  
Its job is to aggregate these clusters and to analyze their neighborhood to merge all points into a unique cluster.  
This method can be called much times, virtually every time the map function emits a new cluster with a key equals to another cluster.

## Scripts
I've written a couple of PHP scripts to collect datas from real-time stream of Twitter and [Teleportd](http://www.teleportd.com).  
There is another script to delete all points and events 6 hours old.  
Take a look in `scripts` folder.

## At work
This algorithm is currently running in our server. Visit [eventdetection.marcosero.com](http://eventdetection.marcosero.com) to view my project.

![](https://raw.github.com/MarcoSero/Event-Detection/master/images/screenshot.png)", user_id: user.id)