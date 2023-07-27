# dolly-v2-3b

This is to deploy the large language model “Dolly v2 3b” as an API on the Kubernetes cluster.
Hints:
- The model used for this code is dolly-v2-3b and it is available on huggingface.co (https://huggingface.co/databricks/dolly-v2-3b)
- This code consists of a Dockerfile, a requirements.txt, and a Python script to load the model into a web
a server capable of running it, and a Kubernetes deployment, service, and ingress.

Also included is a Terraform script to set up Azure Cognitive Services account and deploy a language model into it.



