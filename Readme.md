# Docker Example with pipeline

This example is with react app and CI/CD with docker using git/TravisCI and deployment env

## basic commands to run
<code>npm run start </code> start a development server

<code> npm run test </code> execute tests in the projects

<code> npm run build </code> builds a production ready application

## How to run docker build from env specific dockerfile
<code> docker build -f Dockerfile.dev . </code> 

    in here we are specifying the file for docker build command to run with '-f' 

## Docker volume
Kind of a place holder in the container, so it will not copy the directories as it is. but will reference to the directories in the local machine

<code> docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app < imageid > </code>

explanation on the command
<code> -v /app/node_modules </code> 
    idea of this is to say to docker that dont map this file/folder with the outside directory ( as in this exaple we dont have node_module in the local directories)

<code> $(pwd):/app </code> 
copy all in present working directory to 'app' directory

## Using docker compose for easily run these commands
<code>
    version: "3"
    services:
    web: 
        build: 
        context: .
        dockerfile: Dockerfile.dev
        ports:
        - "3000:3000"
        volumes:
        - /app/node_modules
        - .:/app
</code>

## multi step build process
in this example its two steps 
    1) build the application using alphine
    2) run the application using Nginx ( only consider about the build directory)
