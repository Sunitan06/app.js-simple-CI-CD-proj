# app.js-simple-CI-CD-proj
CI(jenkins)/CD(docker)

TABLE OF CONTENTS
🐳 Introduction to DockerFile 📦:
Application File
Dockerfile
Running the Application
Push The Image From local Repository to Dockerhub

🐳 Introduction to DockerFile 📦:
A DockerFile is like a recipe for creating Docker container magic. It's a simple text file used in the Docker world.
It tells Docker what steps to follow to build a container image 🏗️. Think of it as packaging your app and all it needs into a single, lightweight, and isolated box 📦 that works the same everywhere.
A Dockerfile has instructions like choosing a starting point (base image), adding stuff (copying files), making things happen (running commands), setting the mood (environment variables), opening doors (exposing ports), and telling the container what to do (running processes) 🛠️

👉 After crafting a Dockerfile, 🏗️ you can employ the 'docker build' command to create an image from it.

🖼️ This image can subsequently be deployed to spin up containers housing your app and its necessary bits, nicely tucked away from the host system and other containers.

Project Task :

Create a Dockerfile for a simple web application (e.g. a Node.js or Python app)

🐳 Application File
Here, app.js is the file where the developer has written the code & this file should be located in the same directory as Dockerfile.

$vim app.js
Press 'i'
Enter the below code and then save the file with :wq! 

 [root@sunitan06 ~]# cat app.js

  const http = require('http');

  const hostname = '0.0.0.0';
  const port = 8000;

  const server = http.createServer((req, res) => {
      res.statusCode = 200;
        res.setHeader('Content-Type', 'text/plain');
          res.end('Hello NodeJS from Docker\n');
  });

  server.listen(port, hostname, () => {
      console.log('Server running at http://%s:%s/', hostname, port);
  });

  process.on('SIGINT', function() {
      console.log('Caught interrupt signal and will exit');
      process.exit();
  });

[root@sunitan06 ~]#

*******************************************************************************************************************

🐳 Dockerfile
Build an image using the Dockerfile and run the container

Before building the Dockerfile we will have to give ownership permission to the current user to avoid getting "permission denied while trying to connect to the Docker daemon socket" error.
$sudo chown $USER /var/run/docker.sock

To build an image from the below given Dockerfile, save it as "Dockerfile" in your application's root directory, and then run the following command in the same directory:

$vim Dockerfile
Press 'i'
Then paste the following in your Dpckerfile and save it with :wq!

  #Base image / Parent image for running node js application
  FROM node:6

  #working directory for the container when launched
  WORKDIR /app

  #copy content from our current directory (app.js & Dockerfile) & place inside app/
  COPY . /app

  #Exposing container port to 8000
  EXPOSE 8000

  #To run node application 
  CMD ["node","app.js"]

[root@sunitan06 p1]# cat Dockerfile
FROM node:6
WORKDIR /app
COPY . /app
EXPOSE 8000
CMD ["node","app.js"]
[root@sunitan06 p1]#

Now to build the above Dockerfile into an image we will use the following command:
$docker build -t my-node-app . 

Once the image is built, you can run a container from it using the command:
$docker run -d -p 8000:8000 my-node-app


🐳 Running the application:
Verify that the application is working as expected by accessing it in a web browser
http://<public_ip>:8000
******************************************************************************************************************************************
🐳 Pushing the Image From local Repository to Dockerhub

To push the Docker image to a public or private repository(Dockerhub), you can follow these steps, to know how to push the image to Docker Hub:

Create an Account on Docker Hub:

If you don't have a Docker Hub account, go to Docker Hub and create one.

Tag  the Image:

Before pushing the image, you need to tag it with the repository's URL and a version tag.

Replace **<docker-hub-username>**with your Docker Hub username and my-node-app with the name you used for the image:
http://<public_ip>:8000

$docker tag my-node-app <docker-hub-username>/my-node-app:v1

Log in to Docker Hub:
On your terminal, log in to your Docker Hub account using the docker login command:

$docker login

Before pushing an image, you will be prompted to enter your Docker Hub username and password.
Once logged in, you can push the tagged image to Docker Hub:

$docker push <docker-hub-username>/my-node-app:v1

Your pushed image will now be available on Docker Hub. You can see it by visiting your Docker Hub profile in a web browser and navigating to the "Repositories" tab.

Thank You!!







