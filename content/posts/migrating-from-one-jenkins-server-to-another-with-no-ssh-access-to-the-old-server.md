+++
categories = ["Dev", "CI"]
date = "2015-04-21T09:49:10+03:00"
description = "Migrating from one Jenkins server to another with no ssh access to the old server using the backup plugin"
draft = false
keywords = ["Jenkins", "Backup"]
title = "How I migrated from one Jenkins server to another with no ssh access to the old server"

+++
Imagine a normal day after work while you are working on your favorite side project and you decide to add a new step to the [Jenkins](https://jenkins-ci.org/) job for your project.
The new task requires you to install some system packages on the CI for example you now need nodejs installed on Jenkins. 
The first thing would be to SSH into the server and install the package , but that is when you realise that you can't access the server via SSH anymore because your jenkins box has been running without any issues for a few years and when you set it up you did not do a good job of storing the password for the SSH user you setup so you are locked out.

That is the situation I found myself in a few days ago. I tried several things even trying to get my service provider to get into the server and change the password for me , but that did not work out (it was taking too long to get feedback).
My next approach was to try and see if I could install a Jenkins plugin to provide the needed functionality and as much as there are many Jenkins plugins out there I failed to find one that worked for me.
While I was looking for a plugin I found a plugin for [backup](https://wiki.jenkins-ci.org/display/JENKINS/Backup+Plugin) called [Backup Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Backup+Plugin), which allows you to backup your entire jenkins configuration. 
I quickly went into the Jenkins settings under the plugins section and installed the plugin.

![Installed](/images/backup-plugin-installed.png)

Once I had the plugin installed , I followed the newly added Backup Manager Link in the Jenkins Settings and then went to setup and configured it to create a backup in the workspace of one of the jobs I had setup.

I added gradle, rubyenv and android folders to the custom exclusions list so that I could keep the backup quick and small.

![Backup Settings](/images/backup-settings.png)


When I ran the backup from the backup manager, it created a tarball in the workspace for the test-job that way I was able to download it.

After downloading I began setting up a new instance of Jenkins, after Jenkins was installed I installed the Backup Plugin on the new instance and copied the configuration tarball to the server and stored it in the backups folder.

Once the backup plugin was installed I configured the Backup Directory to /backups. 
When I navigated back to the Backup Manager under restore , the backup I had made from the old server was available and I restored it onto the Jenkins instance.
Jenkins restarted and immediately asked me to login and when I tried my old credentials they worked instantly .

I went ahead and reinstalled all the plugins I had installed on the old server and I had a new instance of Jenkins with all my old jobs setup.
