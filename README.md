# Udagram Image Filtering Microservice
# Setting Udagram Microservice Dev Environment on AWS EC2
### Task-01 Installing GIT on AWS EC2
Commands :
1. Perform a quick update on your instance:
   sudo yum update -y
2. #Install git in your EC2 instance
   sudo yum install git -y 
3. #Check git version
   git version

### Task-02 Install node version manager (nvm) by typing the following at the command line.
1. curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
2. Activate nvm by typing the following at the command line.
   . ~/.nvm/nvm.sh 
3. Use nvm to install the latest version of Node.js by typing the following at the command line. Installing Node.js also installs the  
   Node Package Manager (npm) so you can install additional modules as needed.
   nvm install node
4. Test that Node.js is installed and running correctly by typing the following at the command line.
   node -e "console.log('Running Node.js ' + process.version)"

### Task-03 Install the Ionic CLI
1.  npm install -g @ionic/cli

### Task-04 install python3 on AWS
1. sudo yum install python3

### Task-05 Check installations
1. node --version
2. npm --version
3. ionic --version

### Task-06 GIT Clone Repo
Current repo

### Task-07 Command to build and run project
1. npm install
2. npm install bcrypt
3. source ~/.bash_profile
4. npm run dev

### Task-08 - Problem connecting to postgress database on AWS from EC2 instance
1. Check the username/password.
2. Security Groups while creating RDS -Postgress, allocate default security group which does not have permission for inbound and 
   outbound traffic. Need to update the same.
3. 


# Udagram Image Filtering Microservice

Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice.

The project is split into three parts:
1. [The Simple Frontend](/udacity-c3-frontend)
A basic Ionic client web application which consumes the RestAPI Backend. 
2. [The RestAPI Feed Backend](/udacity-c3-restapi-feed), a Node-Express feed microservice.
3. [The RestAPI User Backend](/udacity-c3-restapi-user), a Node-Express user microservice.

## Getting Setup

> _tip_: this frontend is designed to work with the RestAPI backends). It is recommended you stand up the backend first, test using Postman, and then the frontend should integrate.

### Installing Node and NPM
This project depends on Nodejs and Node Package Manager (NPM). Before continuing, you must download and install Node (NPM is included) from [https://nodejs.com/en/download](https://nodejs.org/en/download/).

### Installing Ionic Cli
The Ionic Command Line Interface is required to serve and build the frontend. Instructions for installing the CLI can be found in the [Ionic Framework Docs](https://ionicframework.com/docs/installation/cli).

### Installing project dependencies

This project uses NPM to manage software dependencies. NPM Relies on the package.json file located in the root of this repository. After cloning, open your terminal and run:
```bash
npm install
```
>_tip_: **npm i** is shorthand for **npm install**

### Setup Backend Node Environment
You'll need to create a new node server. Open a new terminal within the project directory and run:
1. Initialize a new project: `npm init`
2. Install express: `npm i express --save`
3. Install typescript dependencies: `npm i ts-node-dev tslint typescript  @types/bluebird @types/express @types/node --save-dev`
4. Look at the `package.json` file from the RestAPI repo and copy the `scripts` block into the auto-generated `package.json` in this project. This will allow you to use shorthand commands like `npm run dev`


### Configure The Backend Endpoint
Ionic uses enviornment files located in `./src/enviornments/enviornment.*.ts` to load configuration variables at runtime. By default `environment.ts` is used for development and `enviornment.prod.ts` is used for produciton. The `apiHost` variable should be set to your server url either locally or in the cloud.

***
### Running the Development Server
Ionic CLI provides an easy to use development server to run and autoreload the frontend. This allows you to make quick changes and see them in real time in your browser. To run the development server, open terminal and run:

```bash
ionic serve
```

### Building the Static Frontend Files
Ionic CLI can build the frontend into static HTML/CSS/JavaScript files. These files can be uploaded to a host to be consumed by users on the web. Build artifacts are located in `./www`. To build from source, open terminal and run:
```bash
ionic build
```
***
