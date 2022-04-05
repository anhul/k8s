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
3. Create replica set for web application of version 1.0
```
kubectl apply -f test-replicaset-app-v1.yml
```
```
kubectl get pods
NAME            READY   STATUS    RESTARTS   AGE
web-app-8jvs7   1/1     Running   0          43s
web-app-p7ctm   1/1     Running   0          43s
web-app-qt962   1/1     Running   0          43s
```
4. Apply replica set manifest for web application of version 2.0
```
kubectl apply -f test-replicaset-app-v2.yml
```
```
kubectl get pods
NAME            READY   STATUS    RESTARTS   AGE
web-app-8jvs7   1/1     Running   0          43s
web-app-p7ctm   1/1     Running   0          43s
web-app-qt962   1/1     Running   0          43s
```
> Note: pods are the same, ReplicaSet does not support rolling upgrades

5. Delete one of pods to upgrade to newer version.
```
kubectl delete pod web-app-8jvs7
```