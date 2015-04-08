+++
date = "2015-04-08T18:40:02+03:00"
draft = false
title = "How I Deploy this blog site with Snap-ci"

+++

I recently got inspired to start blogging again. So my approach was to go ahead and look out for the coolest tools I could use to build my blog. I found a few but narrowed down on a static site built with [Hugo](http://gohugo.io/).


[Hugo](http://gohugo.io/) (a static site generator), basically allows you to write up the posts in markdown which it later converts to Html for you, similar to how [jekyll](http://jekyllrb.com/) works. So I went ahead and created a new site without any posts then created a repository for it on github [here](https://github.com/muranga/blog). Having the blog on github allows me automate things a little. I have created a script to build the site and package it in a tar. 

Here is what the code to package the site looks like:

	#! /bin/bash
	set -e
	OUTPUT_FOLDER='builds'
	mkdir -p $OUTPUT_FOLDER
	CURRENT_REVISION=`git rev-parse --short  HEAD`
	OUTPUT_FILE="$OUTPUT_FOLDER/blog-$CURRENT_REVISION.tar.gz"
	hugo
	tar -zcf $OUTPUT_FILE  public

The script allows me to create a zipped package of the site for a specific revision of the repository. With that setup I have added [my blog](https://github.com/muranga/blog) to [Snap CI](https://snap-ci.com/muranga/blog/branch/master) , that means whenever I push changes to github the static site gets packaged.

The next logical step is to deploy the site to the server and for that I prefer to use ansible.
This is what the playbook looks like:

	  tasks:
	  - {apt: update_cache=yes cache_valid_time=3600}
	  - apt: pkg={{item}} state=latest
	    with_items: [nginx]
	  - {user: 'name=blog generate_ssh_key=yes ssh_key_bits=2048'}
	  - {file: 'name=/home/blog/www state=directory'}
	  - {file: 'name=/home/blog/tmp state=directory'}
	  - {unarchive: src=../builds/blog-latest.tar.gz dest=/home/blog/www}
	  - {file: path=/etc/nginx/sites-enabled/default state=absent}
	  - template: 'src=nginx.conf.j2 dest=/etc/nginx/nginx.conf'
	  - {template: 'src=blog-nginx.conf.j2 dest=/etc/nginx/sites-enabled/blog.conf'}
	  - {service: 'name=nginx state=restarted'}

The playbook makes sure a folder exists to host the site, copies then unarchives the tar package in the correct path and then makes sure Nginx is properly configured to serve the site.

With ansible setup I have gone ahead to added a step in Snap-CI to deploy the blog and as you can see the blog is working. 



