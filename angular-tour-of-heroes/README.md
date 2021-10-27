# AngularTourOfHeroes

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 12.2.8.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.


## Build docker image using docker file. 

1. Go to folder angular-tour-of-heroes
2. Run below command to make dokcer image from Dockerfile present in the folder

```
docker build -t angular-tour-of-heroes:latest .
```
3. Validate if image is created

```
docker images

REPOSITORY                            TAG                 IMAGE ID            CREATED             SIZE
angular-tour-of-heroes                latest              c3d2bc579158        3 hours ago         20.7MB

```

4. to validate all the files copied properly in the image , save image as tar.

```
docker image save angular-tour-of-heroes:latest -o angular-tour-of-heroes.tar

```

5. Untar the tar file and unzip layer folders inside


6. create a tag for pushing into docker hub

```
docker image tag angular-tour-of-heroes:latest <<DOCKR_HUB_ID>>/angular-tour-of-heroes:latest
```

7. Push to DockerHub

```
docker push <<DOCKR_HUB_ID>>/angular-tour-of-heroes:latest

```

8. Pull from docker hub and run it.

```
docker run -d -it -p 80:80 --name test <<DOCKR_HUB_ID>>/angular-tour-of-heroes:latest
```
