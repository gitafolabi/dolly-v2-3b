# dolly-v2-3b

This is to deploy the large language model “Dolly v2 3b” as an API on the Kubernetes cluster.
Hints:
- The model used for this code is dolly-v2-3b and it is available on huggingface.co (https://huggingface.co/databricks/dolly-v2-3b)
- This code consists of a Dockerfile, a requirements.txt, a python script to load the model into a web
server capable of running it, and a Kubernetes deployment, service, and ingress.

To deploy this:

Build the Docker image by running: 

- docker build -t dollyapp .

- docker tag dollyapp avurlerby/dollyapp:latest

- docker push avurlerby/dollyapp:latest

Then deploy to Kubernetes, cd to the deployment directory.

- cd infra/deployment/

Create dollyapp namespace:

- Kubectl create ns dollyapp

Apply the deployment, service and ingress.

- kubectl apply -f deployment.yaml -n dollyapp

- kubectl apply -f service.yaml -n dollyapp

- kubectl apply -f ingress.yaml -n dollyapp


Get the state of all the kubernetes objects

-  kubectl get -A -n dollyapp

Check the pods status:

- kubectl describe pods -n dollyapp

If the pod is running, image has been pulled and the Container has been started, check the logs of the pods to see if the app is running as expected

- kubectl logs -f <dollyapp-pod-name> -n dollyapp.


Downloading (…)okenizer_config.json: 100%|██████████| 450/450 [00:00<00:00, 142kB/s]
Downloading (…)/main/tokenizer.json: 100%|██████████| 2.11M/2.11M [00:00<00:00, 4.41MB/s]
Downloading (…)cial_tokens_map.json: 100%|██████████| 228/228 [00:00<00:00, 132kB/s]
Downloading (…)lve/main/config.json: 100%|██████████| 819/819 [00:00<00:00, 476kB/s]
Downloading pytorch_model.bin: 100%|██████████| 5.68G/5.68G [00:30<00:00, 185MB/s] 

Muchas Gracias!
