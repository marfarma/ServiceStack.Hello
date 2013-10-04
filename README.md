ServiceStack.Hello
==================

Hello world example application extracted from ServiceStack/ServiceStack.Examples, configured to run as a Docker container.  This is a proof of concept and a base to build from, to host a ServiceStack API on Linux using Nginx and Mono FastCGI.

Run the Docker Hello World Example Service
==========================================

In your host machine with docker installed, run the image as follows (ctrl-C to exit):

    vagrant@precise64:~$ sudo docker pull marfarma/servicestack

    vagrant@precise64:~$ sudo docker run marfarma/servicestack
     * Starting nginx nginx
       ...done.

In a second terminal running on the same host as above, use the `docker ps` command to determine the port that nginx is using.  In the example below, it's 49181.

    vagrant@precise64:~$ sudo docker ps
    ID                  IMAGE                          COMMAND                CREATED             STATUS              PORTS
    21b021cf47b7        marfarma/servicestack:latest   /var/www/hello/start   27 seconds ago      Up 27 seconds       49181->80
    3976891e4e44        shykes/couchdb:2013-05-03      /bin/sh -e /usr/bin/   9 days ago          Up 9 days           49153->5984

To see the service running in the docker container, you would use the port from the ps command and, using your browser, visit:

 - http://localhost:49181/servicestack/hello/pauli%20price
 - http://localhost:49181/servicestack/hello
 - http://localhost:49181/servicestack/
 - http://localhost:49181/servicestack/metadata
 
To stop the server you can use "Control+C"

The setup largely follows this tutorial, http://jokecamp.wordpress.com/2013/06/30/servicestack-api-with-fastcgi-mono-server-and-nginx-hosted-on-digitalocean/ and also exhibits the same bug:

> With every request, even successful requests I see the below message logged in the console. I do not know the source of this but the API should still be working fine and returning results.

            Error Failed to process connection. Reason: The object was used after being disposed.

 
