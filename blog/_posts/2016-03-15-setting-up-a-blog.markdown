---
layout: post
title:  "Setting Up a Blog"
date:   2016-03-15 12:00:00
categories: calendar
permalink: setting-up-a-blog
---

I knew up front that I wanted to set up a blog to track my work as I develop The Marketing Calendar.  And I wanted to start the blogging process before I even have an application up and running.  The plan is to write the system based on [Ruby on Rails](http://rubyonrails.org/).  There are more languages involved, specifically [CoffeeScript](http://coffeescript.org/), but the primary platform is Rails.

A lot of the Rails system is oriented around basic reading and writing to/from a database ([CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)).  That means there are frequent changes to the database structure.  I know from experience that during development I often like to reset the database so that it's completely fresh.  Additionally there's the possibility of making a mistake that wipes out the database on my development system.

Basically, I don't trust my local database during early development.

So I didn't really want to start creating blog entries in a database that I don't trust.  I wanted to know that if I take some time to write a blog entry then that entry needs to be saved reliably.

In doing a little research I found that creating [markdown files](https://daringfireball.net/projects/markdown/basics) is pretty straightforward. Having text files on the hard drive feels like a pretty reliable way to save my blog entries.  In addition to my regular system backups, the markdown files will be included as part of the [revision control](https://github.com/).  And, initially, the files can live anywhere on my hard drive...they don't have to be part of a "real" application.  I like that!

I've also been using the [Atom](https://atom.io/) text editor.  And Atom comes, by default, with a markdown preview package built-in.  Hit ctrl+shift+m and you can preview the post while you're typing the markdown.  I like that!

Additionally [Jekyll](https://jekyllrb.com/) can generate your blog as static web pages from your markdown files.  I followed the instructions in this [helpful guide to setting up Jekyll with Rails](http://www.sitepoint.com/jekyll-rails/).  The only issue I had was that the site suggests specifying Jekyll 2.5.3 in your Gemfile.  I was getting an error message: _Liquid Exception: Failed to get header._  Eventually I found that the current version of Jekyll is 3.1.2. When I changed my Gemfile then Jekyll generated the site correctly.  I like that!

So now I can write blog posts that will be persistent before I have a real application.  The entries are also included as part of my regular backups and revision control. Those posts aren't going anywhere.  And I like that!
