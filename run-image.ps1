docker run --name angular-demo -it -p 4200:4200 -v /app/node_modules -v /d/Projects/DockerLearning/AngularDemo/angular-docker-demo:/app -e CHOKIDAR_USEPOLLING=true 77ebbbddccc88
