## Test instruction
1. Create service
```
kubectl apply -f ../deployment/test-service-node-port-web-app.yml
```
2. Create deployment for web application of version 1.0
```
kubectl apply -f ../deployment/test-deployment-app-v1.yml
```
3. Create job which retrieves the version of running web-app
```
kubectl apply -f test-job.yml
```
4. Check output of the pod created by the job
```
kubectl logs app-version-wxrj2
```
