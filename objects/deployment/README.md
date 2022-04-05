## Test instruction
1. Create externally available service
```
kubectl apply -f test-service-node-port-web-app.yml
```
```
kubectl get services -o wide
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE   SELECTOR
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP        23d   <none>
web-app      NodePort    10.111.205.86   <none>        80:30007/TCP   70s   app=simple-web
```
2. Fetching the minikube IP and a service’s NodePort
```
minikube service --url web-app
http://192.168.49.2:30007
```
3. Create deployment for web application of version 1.0
```
kubectl apply -f test-deployment-app-v1.yml
```
4. Check which resouces have been created
```
kubectl get deployment
kubectl get rs
kubectl get pods
```
5. Apply deployment manifest for web application of version 2.0
```
kubectl apply -f test-deployment-app-v2.yml
```
> Note: pods changed since Deployment supports rolling upgrades

6. Check which resouces have been created
```
kubectl get deployment
kubectl get rs
kubectl get pods
```
7. Check rollout status
```
kubectl rollout status -w deploy/web-app
```
8. Rollback to previous version
```
kubectl rollout undo deploy/web-app
``` 
9. Check rollout history
```
kubectl rollout history deploy/web-app

deployment.apps/web-app 
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```
10. Rollback to specific version
```
kubectl rollout undo deploy/web-app --to-revision=2
```