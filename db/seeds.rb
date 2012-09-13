#!/bin/env ruby
# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: 'marco', password: "marcosero", password_confirmation: "marcosero", email: "marco@marcosero.com", bio_md: "I like to code and I'm interested in many fields of computer science and social media.
 
Visit my [site](http://marcosero.com)  
Fork my [projects](https://github.com/MarcoSero)  
View my [photos](http://photo.marcosero.com)")

Post.create(title: "Why start another blog?",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,4,24,17),
            category_list: ["Stuff"],
            content_md: "That's the question I made myself: why should I start a new blog? The answer is easily explained: I want a place to share and discuss with any other developer of issues, events, great tutorial and all other stuffs that concern the world of the developers.

I'm a developer but first of all a student so I'll want to write about all that affect me (and I hope you too) such as web technologies, mobile platforms, software engineering, user interface design, computer networks, security, artificial intelligence... and so on, exploring a lot of fields of programming and computer science.
I code mainly in Cocoa/Cocoa Touch, so you have to excuse me if most of articles regard it.

So, let's start!")


Post.create(title: "An iOS application purely in C? It's possible",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,4,25,17),
            category_list: ["C", "iOS", "Objective-C"],
            content_md: "A question on StackOverflow caught my attention: *[\"How to write iOS app purely in C\](http://stackoverflow.com/questions/10289890/how-to-write-ios-app-purely-in-c/)*

The first thing I thought was is theoretically possible to write a program entirely in C, because Objective-C is a superset of the C-language, but I had no idea of how I could implement it.

But the [answer](http://stackoverflow.com/questions/10289890/how-to-write-ios-app-purely-in-c/10290255#10290255) gave by Richard J. Ross III is brilliant.

That's an example of how good knowledge of a programming language(s) driven by an authentic curiosity, can bring to unexpected result.
For didactic purpose this example shows ways to use object oriented techniques in a non-object oriented language like C.")



Post.create(title: "C Implementation of the A* Pathfinding Algorithm",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,4,27,17),
            category_list: ["Artificial Intelligence", "C"],
            content_md: "Exploring GitHub, sometimes you could find unusable software, good-for-nothing software, embarrassingly inefficient software. But a lot of times you can also find excellent software, wrote with brain and not only with keyboard.
This is the case of the [implementation of the A*](https://github.com/BigZaphod/AStar), written by [@BigZaphod](http://twitter.com/#!/bigzaphod) (Sean Heber). Most of code is in C, for obvious reasons of efficiency. In fact efficiency is the keyword of this algorithm and its implementation.

For those who don't know, A* is The algorithm to create a pathfind from a node \"start\" to a node \"goal\". It's one of the oldest algorithm but nevertheless it's still used today.
It uses a heuristic function *h(x)* that is a sum of two cost-function: **f(x) + g(x)**, where x is the current node.
*f(x)* is the real heuristic function that gives us an estimate of the cost to reach the goal. Conversely *g(x)* represents the cost that algorithm have done to reach the x node.
At each step, the algorithm chooses the node with the minimum value of h(x).
Trying to describe A* in few lines could be the hardest thing that I've tried to done in the last years, so if you wanna a more detailed description, [Wikipedia](http://en.wikipedia.org/wiki/A*_search_algorithm) could be a good point to start.

In his implementation the author chose to use a binary heap to implement the priority queue of nodes and an indexed array for fast lookups of previously visited nodes. This is probably the most logical choice.

> To use it, you must define 3 functions which provide information about node connectivity, sorting, and heuristics. A \"node\" for purposes of this implementation is simply a pointer to any data you want. You must also specify the size of the node data you're pointing to. If you're just using pointers, the size is simply something like sizeof(MyNodeStruct *), however this implementation is capable of storing whole structures (such as {int x; int y;}) as well.

The source code and a full readme can be founded on BigZaphod's GitHub, where is included a Xcode's sample project that gives us an example of how to integrate it in our projects.

I had a word with Sean Heber and I asked him a couple of questions about his project:

*There are several different pathfinding's algorithms. Why did you choose A\*?*

> I'm no pathfinding expert, but all of the algorithms have a variety of tradeoffs. Usually the tradeoff is time vs. memory. A* seems to have one of the best balances of those tradeoffs in the context of games, at least, and I think that's why it's been the gold standard for so long. In a game you're often more willing to sacrifice memory if it buys you faster execution time, and that's something A* can do. A* also allows you to weight the \"cost\" of transitioning from one state (or cell on a map, etc) to another so in a sense it actually solves two problems - it finds a path from one state to another, and it can also find the *best* path given many possible paths of varying difficulty. Obviously that's quite useful when you're trying to get a game character to move from point A to point B in a way that doesn't seem entirely unnatural. Another advantage of A* is that by using different heuristics you can sacrifice some path optimality for speed - again with games it's often more important to compute something quickly than to compute it exactly correctly.

*Why did you decide to write your own A* implementation? Did you not find one's that satisfies you?*

>I didn't look for other implementations, really. The underlying point of the project was to understand how it works and the best way to do that was to just make it myself.  I also did it all in C because I decided it'd be more of a challenge that way and would really get to the meat of the details. Writing A* itself was only part of the challenge as I also had to implement bits of other algorithms like binary search and binary heap to implement the priority queue I needed for A*. I probably should have used a hash table rather than a sorted array, and I might do that some day, but for now it's been fast enough as it is.

*Have you already used your code in some your projects or do you know anyone that uses it?*

>I'm using it my own toy projects. Nothing has been shipped with it to my knowledge. So far it's been working great and I haven't noticed any problems. I know of at least one person who's thinking of putting it in his own game.

*Thanks for your time :) *

> No problem. :)")

Post.create(title: "Programming Languages Popularity",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,5,1,17),
            category_list: ["Stuff"],
            content_md: "As developer I am always interested about programming languages popularity. It is a significant clue about the future and the impact they can have in the job market.
Let's analyze some data!

####The favorite programming languages

Hacker News posted a simple question to its readers:

>What's your favorite programming language?

And these are the answers with the number of votes:

1. Python 3044
2. Ruby 1718
3. JavaScript 1412
4. C 966
5. C# 828
6. PHP 662
7. Java 551
8. C++ 529
9. Haskell 518
10. Clojure 458
11. CoffeeScript 361
12. Objective C 326
13. Lisp 321
14. Perl 310
15. Scala 233
15. Scheme 190
17. Other 188
18. Erlang 162
19. Lua 145
20. SQL 101

This stats doesn't mean much, because these are the favorite programming languages, not the most popular. Klint Finley [commented](http://devopsangle.com/2012/04/06/top-20-most-popular-programming-languages-among-hacker-news-readers/) them:

> Polls like this don’t do much to tell us which programming languages are “best” or what languages are most used in production. They’re not even controlled to make sure the people voting are actually programmers, so it’s hard to read too much into them. But they do tell a bit about what languages developers like to use. As developers become entrepreneurs and startups become enterprises, these sort of preferences can have an impact on the job market, so taking a look at these sorts of lists can help developers decide what to learn.

#### GitHub and StackOverflow

For some \"real\" stats, we can see the graph below that compares languages based on GitHub and StackOverflow popularity (updated to February 2012)

![image](http://f.cl.ly/items/1P2O1z3Y3o3E073z1w0b/20120208-jqctdbqg7yfbj785pe9gjtjp8t1.png)

This graph tells us nothing new. The best are always the same.

#### O'Reilly book sales

At the end, the last (fresh) stats I founded is based on O'Reilly book sales. O’Reilly’s book data seems like it can provide a bit of insight into both, if we assume that employers will buy books for employees based on internal needs and that individual developers will buy books based on their own interests.

1. Java
2. JavaScript
3. C#
4. Objective C
5. C++
6. PHP
7. VBA
8. Python
9. SQL
10. ActionScript
11. .net Languages

There are different factors to consider analyzing these data, and always Klint Finley [wrote](http://devopsangle.com/2012/04/27/programming-language-popularity-based-on-oreilly-book-sales/) about them:

> For example, it could be that just about everyone who wants to learn C or Perl already has a book on it. It could also be that the preferred books on some languages are not published by O’Reilly. Still, I think we can conclude a few things based on the data we have now:  
1. Java is still very popular, thanks in part to Android.  
2. Python is more popular than Ruby.  
3. R and JavaScript are still growing fast.  
4. Despite challenges, PHP isn’t going anywhere any time soon.  
5. The Microsoft languages are still sitting pretty.

I quite agree with him. It's hard to oust kings such as Java or PHP, for all people say.")







Post.create(title: "Apple rejecting applications which use Dropbox",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,5,2,17),
            category_list: ["Stuff"],
            content_md: "Seems [Apple is rejecting applications which use Dropbox](https://forums.dropbox.com/topic.php?id=59350). Why?

> Apps that link to external mechanisms for purchases or subscriptions to be used in the app, such as a “buy” button that goes to a web site to purchase (for example) a digital book, will be rejected.

*and don't forget us rebels could type \"buy Dropbox space\" on google.com too!*")











Post.create(title: "There’s No Such Thing as the Perfect Developer Laptop",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,5,9,17),
            category_list: ["Stuff"],
            content_md: "About [Finley's post](http://devopsangle.com/2012/05/08/theres-no-such-thing-as-the-perfect-developer-laptop/) on Dell’s experimental developer-centric laptop Project Sputnik.

> Many developers think they already have the perfect notebook in the Macbook Pro or Macbook Air. Linux kernel developer Linus Torvalds famously uses an Air, and told TechCrunch: “I’m have to admit being a bit baffled by how nobody else seems to have done what Apple did with the Macbook Air – even several years after the first release, the other notebook vendors continue to push those ugly and *clunky* things.”
Web developers in particular have favored Macs in recent years, and although Apple caught a little flak for making Xcode a paid download, the OSX environment makes for a friendly place for developers who want a Unix toolchain without giving up the comforts of a mainstream computing environment. The ability to run multiple operating systems through Boot Camp or through virtualization tools like Parallels and VMware Fusion make it hard to beat.

My view.")













Post.create(title: "The 'Brogrammer' Culture",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,5,12,17),
            category_list: ["Stuff"],
            content_md: "Via [good.is](http://www.good.is/post/attracting-more-women-to-computer-science-requires-shattering-the-brogrammer-culture/)

>Call it \"revenge of the nerds\": Computer programmers are beginning to shed the stereotype of antisocial guys with bad acne and extensive action figure collections. Unfortunately, they’re ditching the image of awkward geeks in favor of being seen as collar-popping, beer-swilling bros.
They call them \"brogrammers\"—tech startups and university computer science departments are chock full of them. But whether they're nerds or bros, one thing that hasn't changed is that the programmers are overwhelmingly men. And the brogrammer culture is making computer science a pretty unwelcome environment for women college students.")






Post.create(title: "Please Don't Learn to Code",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,5,16,17),
            category_list: ["Stuff"],
            content_md: "Great [article](http://www.codinghorror.com/blog/2012/05/please-dont-learn-to-code.html). I am no 100% agree, but some parts are interesting.
Particularly:

>It assumes that coding is the goal. Software developers tend to be software addicts who think their job is to write code. But it's not. Their job is to solve problems. Don't celebrate the creation of code, celebrate the creation of solutions. We have way too many coders addicted to doing just one more line of code already.")











Post.create(title: "How I Write Code",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,5,19,17),
            category_list: ["Stuff"],
            content_md: "I found an old-but-interesting [post](http://blog.bigzaphod.org/2009/05/27/how-i-write-code/) about the personal coding workflow.

>I might be driving and suddenly get a flash of something that’s wrong in the code or a way to fix a bug I noticed hours or days ago. I’ve found memory leaks while driving and nowhere near a computer, for example. It can be a problem when trying to go to sleep at night, too, and I found the best way to deal with it is just get up, fix the code, and go back to bed. Trying to stay in bed and ignore it simply leads to insomnia.

Personally I think about written code in the shower but, just as Sean Heber, I thought and solved a problem in the bed, coding the fix in that moment with my MacBook above bedspread.")












Post.create(title: "Programming as a Foreign Language",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,5,27,17),
            category_list: ["Stuff"],
            content_md: ">Just as with spoken languages, achieving fluency in a programming language requires immersion. Once fluency is achieved, similar languages become much more accessible. Learning a new language in a non-immersive environment will give you concepts, syntax, rules, and trivia, but you will not achieve fluency, which in programming languages gives you the power to craft original solutions to arbitrary problems.

via [Red Squirrel's Nuts](http://nuts.redsquirrel.com/post/23200685522/programming-as-a-foreign-language)")







Post.create(title: "Rules for Framework Development",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,6,25,17),
            category_list: ["Stuff"],
            content_md: "How a framework has to be written?
Some pieces of the awesome article of [mortoray](http://mortoray.com/2010/04/23/rules-for-framework-development/).

>Some projects confuse rapid application development (RAD) with a framework, sometimes a content manager is called a framework, and a significant number are simply junk.

And so on:

>A good framework lets you completely ignore it and do something on your own. Furthermore it must not be an all-or-nothing approach. Framework components must be usable and adaptable outside the original intentions of their developer. [...] If the user wishes to load a JSON object instead of XML at one point, then it should be possible. The framework shouldn’t anticipate all uses, rather it should be arranged as adaptable and extendible.  
[...] A framework should be simple and easy to use. It must save the users time rather than create headaches.")









Post.create(title: "Goodbye MongoDB",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,7,17,17),
            category_list: ["Database", "MongoDB", "NoSQL"],
            content_md: "I'm using MongoDB for my thesis work, and unquestionably it is full of great features. I choose it for its awesome handling of geo-located documents and its quick queries.

There are many other excellent features:

- you can index ANY attribute
- \"agile and scalable\" as 10gen says
- very quick
- awesome documentation and drivers for any language
- integrated Map/Reduce (even if too slow)
- Apache licence
- and so on...

But on the other side there are many features not exactly friendly.

In [this great article](http://www.zopyx.com/blog/goodbye-mongodb), a zopyx's employee explains why they said \"goodbye mongodb\".

He criticized these features:

>Locking: a global lock for any operation is like a suicide
>Query language: not very easy (for who already knows SQL)
>Map/Reduce: its slowness is due to the monothread Javascript engine (for that reason, I used MongoDB+Hadoop in my thesis)
>Journaling: MongoDB pre-allocates 3 GB of data for journaling - independent of the actual database size(s) - insane for small installations

I completely agree with him. In particular on locking and Map/Reduce problems.

The employee ends his article with

>MongoDB is currently more about marketing and hype than it deserves. The primary goal of 10gen is currently running through the world in order to tell the world how cool MongoDB is.

Here I disagree. MongoDB has a great potential and 10gen's guys are working hard and well to improve their project.")









Post.create(title: "Thoughts of a Rails (and Ruby) beginner",
            user_id: user.id,
            published: true,
            published_at: DateTime.new(2012,9,3,17),
            category_list: ["Ruby", "Ruby on Rails"],
            content_md: "A couple of weeks ago I decided to learn Ruby to take advantage from the most acclaimed framework of last years: Ruby on Rails.
My background of web application developer was PHP-only, so I didn't know any framework such as Cake or Zend.
In the last months every time I started a new project I felt afraid because my code used to get dirty after some hundreds of lines, probably because mere PHP and MVC-pattern were no best friends.
When I was going to start to learn Cake, I have been stopped: \"Learn Rails!\", said a voice in my head. And after only a week I can say that I have to buy it [the voice, E.d] a beer, but maybe it's not enought.

From a developer with a \"relatively deep\" Java and C-related background, I love **Ruby** because it's strongly typed and meanwhile there's no static type checking.
I love its light syntax and every character that I don't type on my keyboard against to other more verbose languages like Java or Obj-C.
I have not yet played deeply with modules and mixin to realize multiple inheritance, but I will.

But talking about **Rails**, I've to admit: Ruby on Rails is the state of art of all existing frameworks.
The speed and smartness to have stuff working is amazing. I think there are only few others languages/frameworks to realize the real AGILE software developing as you can do with Rails.
Every line of code you'll write, it's predisposed to be tested (with unit, functional and integration tests) with automatic templates and without need of plugins or other stuff.
The DRY (**D**on't **R**epeat **Y**ourself) logic is taked to the extreme (maybe too much, the amount of total files is huge!) and every piece of the puzzle fits perfectly.

Coding and coding, I'm amazed every day more of how this framework works and how fast I can build a web application. The road to be fluent in Ruby is long, but I'm excited to learn all can I do.

And as Sam Ruby said:

>Consider spending less time talking and more prototyping")



























