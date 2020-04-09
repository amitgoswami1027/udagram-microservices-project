# Udagram Microservices Project 
Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice.

The project is split into three parts:
1. [The Simple Frontend](/udacity-c3-frontend)
A basic Ionic client web application which consumes the RestAPI Backend. 
2. [The RestAPI Feed Backend](/udacity-c3-restapi-feed), a Node-Express feed microservice.
3. [The RestAPI User Backend](/udacity-c3-restapi-user), a Node-Express user microservice.

Udagram microservices project, I have setup my development environment on AWS EC2 interface. Reason for doing so is I have windows home edition system and finding it challanging to do the setup for docker and kubernetes on it. Also it add a bit of additional complexity to project, but it help me to learn a lot about the AWS ecosystem and understanding about the different components. My Udagram frontend is deployed on S3 bucket and other rest apis on the EC2 interface. Please find the following steps for the project development instructions.

## Setting Udagram Microservice Dev Environment on AWS EC2
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

### Task-09 Installing Dockers on AWS EC2 Linux instance (Docker Installation)
1. Create EC2 with Amazon Linux AMI (Linux version should be > 2.2.14)
2. Login to your EC2 with PuTTY
3. Do an update of Amzon Linux
   * "sudo yum update"
4. Now for installing docker run below command:
   * "sudo yum install -y docker"
5. Give permission
   * "sudo usermod -a -G docker ec2-user"
6. Start Docker Service
   * "sudo service docker start"
7. Run below command to get docker service up automatically after reboot:
   * "sudo chkconfig docker on"
8. Optionally, create a new user for Docker management and add him to Docker (default) group
   * "useradd dockeradmin"
   * "passwd dockeradmin"
   * "usermod -aG docker dockeradmin"
9. Once you have Docker installed, open a terminal and run:
   * "docker run alpine echo hello world"
10. Congratulations! You are now running Docker!

### Task-10 Converting the monolithic application to microservices:
1. Create a project folder in your local computer and clone the following Git repository -
   https://github.com/udacity/nd9990-c3-microservices-v1
2. Create your Dockerfile
3. Build the Image for the "user" service
   * docker build -t <your_dockerhub_username_lowercase>/udacity-restapi-user .
4. Build the image for the "feed" service
   * docker build -t <your_dockerhub_username_lowercase>/udacity-restapi-feed . 
5. Build the image for the "frontend" service
   * docker build -t <your_dockerhub_username_lowercase>/udacity-frontend . 
6. Optional Step : If you face any errors, please need to update the Angular dependencies. Try to update them before building the image 
   as follows:
   * sudo npm install -g @angular/cli@latest
   * sudo ng update --all --force
   * docker build -t <your_dockerhub_username_lowercase>/udacity-frontend . 
7. If you want to remove any image, use the following commands:
   * docker image rm -f <image_name/ID>
   * docker image prune

### Important Commands
1. Set Pythons path : /usr/bin/python3
2. npm install node-pre-gyp -g
3. npm config set python /usr/bin/python3
4. node-gyp --python /usr/bin/python3
5. sudo yum install /usr/bin/g++
6. npm ci
7. 

### Dockerizing the services 
### sudo docker run --rm --publish 8103:8103 -v $HOME/.aws:/root/.aws --env POSTGRESS_HOST=$POSTGRESS_HOST --env POSTGRESS_USERNAME=$POSTGRESS_USERNAME --env POSTGRESS_PASSWORD=$POSTGRESS_PASSWORD --env POSTGRESS_DB=$POSTGRESS_DB --env AWS_REGION=$AWS_REGION --env AWS_PROFILE=$AWS_PROFILE --env AWS_BUCKET=$AWS_BUCKET --env JWT_SECRET=$JWT_SECRET --name feed4 amitgoswami1027/udacity-restapi-feed

### Dockerfile
a text file without any extension that contains all the commands to be executed to generate an image.
#### FROM
a Dockerfile must begin with a FROM instruction . initializes a new build stage
sets the base image for subsequent instructions
#### RUN
command to create and start containers using the current image
commits the results so that the resulting committed image will be used for the next step in the Dockerfile.
#### WORKDIR
creates (if not exists) and set the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile.
#### COPY
copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>
#### EXPOSE
specify the network ports of the container at runtime
specify the network protocol that the port listens (TCP is the default)
NOTE: EXPOSE does not actually publish the port -- it functions more as a documentation tool
#### CMD
provide defaults for an executing container
if the defaults do not include an executable, you must specify an ENTRYPOINT
NOTE: there can be only one CMD instruction in a Dockerfile

# KUBERNETES( K8s)
Kubernetes (K8s) is an Apache 2.0-licensed open source Container Orchestration tool for effectively managing containerized applications.
Kubernetes can automate the deployments, maintaining a logical group of containers, and helps to scale the application services. Google started it, but many other companies like Docker, Red Hat, and VMware contributed to it. In 2016, Google transferred the IP rights to Cloud Native Computing Foundation. 

## Why do we need Kubernetes?
![](images/kube01.png)

The above image shows the containerized applications have the advantage of being lightweight and more comfortable to manage, as compared to Virtual Machine (VM) based deployment.  Kubernetes can help in managing containerized application in the following ways:
*Manage Containers - Self-healing such as auto-restart of a backup/replica container in case of a failure, automate the rollouts and rollbacks, configuration management of containers
*Autoscale Workloads and Load balancing - Distributing a load of network traffic to suitable container/node
*Optimal Resource Utilization - Each container has its own resource (CPU and memory) requirements. Kubernetes fits a container to the 
 most suitable Node so that the resources of the Node are utilized effectively.
*Service Discovery - Provide native methods for service discovery
*Storage orchestration - Automatically mounting the volumes to containers
*Others - Fire off jobs and scheduled cronjobs, quickly integrate and support 3rd party apps, and manage Stateless and Stateful applications

## How does Kubernetes work?
A Kubernetes deployment follows the “Master-Worker” model. We need to understand the key components before we look into the architecture diagram.

*Node - A physical or virtual machine that runs multiple containers belonging to an application.
*Cluster - A set of Master and Worker Nodes. When we deploy Kubernetes, we get a cluster, which each cluster has a minimum of one worker node. A master node is capable of managing multiple worker nodes.
*Master Node - A node that decides the pod scheduling, and pod replication. The main components of a master node are - “kube-api-server”, “kube-scheduler”, “kube-controller”.
*Worker Node - A node on which pods are scheduled and run.
*Pod - A group of tightly coupled containers with shared storage, network, and a specification for how to run the containers. All the containers in a Pod are co-located and co-scheduled. The worker node(s) hosts the pods.

![](images/kube02.png)

In the above diagram, the following elements are involved:
*kubelet - a “node agent” using which the worker node communicates with the master node. The kubelet runs on each Node.
*kube-proxy - a “node agent” using which the worker node communicates with the external world. The kube-proxy also runs on each Node.
*kube-apiserver - the frontend API that exposes the Kubernetes control plane.
*etcd - a key-value store to stores the cluster state
*kube-scheduler - a component that schedules the pods for running on the most suitable Node.
*kube-controller-manager - a component that bundles and runs controller processes. These processes concern the nodes, replication,  
 endpoints, and access management.

### Kubeone installation
1. Downloading a binary from GitHub Releases
   

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
