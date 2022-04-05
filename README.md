# Learning K8s features

## Working with Minikube

### Launching Minikube
```
minikube start
```
```
minikube stop
```
```
minikube status
```
### Access to local Docker images

Start minikube
```
minikube start
```
Set minikube-docker env
```
eval $(minikube docker-env)             # unix shells
minikube docker-env | Invoke-Expression # PowerShell
```
 Build image in the same terminal where docker env was set
```
docker build -t foo:0.0.1 .
```

Run in minikube
```
kubectl run/apply ...
```
Return back to local docker env
```
eval $(minikube docker-env -u)
```
## References
https://kubernetes.io/docs/reference/kubectl/cheatsheet/
https://theithollow.com/2019/01/30/kubernetes-deployments/
