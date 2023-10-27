# Deployed this cloned 2048 game to Azure
## Credits
This projects redeploys an existing project done by Ghazanfar Ali to Azure. Ghazanfar deployed the the 2048 game to AWS and this project seeks to replicate it on Azure.
The link to Ghazanfar's project https://medium.com/@ghazanfaralidevops/devops-project-create-a-game-using-docker-and-deploy-to-aws-beanstalk-b49b9b6e2af6.


## Dockerfile for the image
1.You just need to create a Dockerfile to be used as a image for your docker container where you will deploy your application
2.Next you need to build and tag your docker image as you please
3.Run a container from the build image and expose port 8081 to access from your local browser the application

## Explaining the Dockefile
1. Ubuntu was used as the base image though you can also use alpine to reduce the docker image
2. The third line installs required packages in Ubuntu and installs nginx server, zip utility and curl to dowload files
3. The next command ensures that nginx runs in the background. Nginx is a commonly used webserver
4. "mkdir -p /var/www/html" craetes a working directory where content is to be served by nginx
5. "curl.." command downlaods the game's source code as a zip and saves it to the /master.zip file
6. "cd /var/wwww/html" changes directory into the working directory
7. "unzip.." extracts the contents
8. "mv.." moves the contents to the current directory
9. "rm -rf ..." cleans up and removes the extracted directory 
10."Expose 80" exposes port 80 in the container to traffic
11. last command is the point of execution of the created container and starts the nginx server in the background.


## Pushing to Dockerhub
Push your build image tagged to your dockerhub account or any container registry account you might want to use.

## Deploying to AZURE
1. make sure you have an azure account as well as the requiste subscription to deploy Azure app service
2. Create Azure App service and configure the necessary settings
3. Make sure  to select your necessaty settings
4. Choose a name and select docker container as source 
5. Likewise select Dockerhub as imagesource and select public access as well as your tagged docker image that you uploaded to Dockerhub
6. You should be able to see the game application thorugh the link azure provides or you can map to your custom domin

## You can view my deployment on the link below
https://2048app.azurewebsites.net/