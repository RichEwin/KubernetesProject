# Video-Blog - Kubernetes

Video-Blog is an application built in React that renders a youtube video. This application is designed to be containerized with the use of Docker and deployed using Kubernetes.

Kubernetes is an open-source container-orchestration system for automating computer application deployment, scaling, and management.

## How to Run
- Clone this repository
- Navigate to the project. In a terminal run the script ```sh buildanddeploywithkubernetes.sh```
- The application is available locally at http://localhost:3000/

Use the commands below to check the deployment using ```kubectl```:

```
➜ kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
video-blog-8645cc6784-wjqv4   1/1     Running   0          29s
video-blog-8645cc6784-zp5zp   1/1     Running   0          29s
```
```
➜ kubectl get deployment
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
video-blog   2/2     2            2           84s
```
## Cleardown
Once you deploy video-blog locally, run ```sh cleardown.sh``` in a terminal and all images, containers and deployments will be removed/deleted. 