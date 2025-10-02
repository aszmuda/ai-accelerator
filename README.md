# AI Accelerator

This project is designed to initialize an OpenShift cluster with a recommended set of operators and components that aid with deploying Red Hat OpenShift AI along with its dependencies.
This project is a customized version of the [Red Hat AI Accelerator](https://github.com/redhat-ai-services/ai-accelerator) project.

Once the initial components are bootstrapped, several ArgoCD Application objects are created which are then used to install and manage the installation of the operators on the cluster.

![AI Accelerator Overview](documentation/diagrams/AI_Accelerator.drawio.png)

## Additional Documentation and Info

* [Installation Guide—](documentation/installation.md)containing step-by-step instructions for executing this installation sequence on your cluster

### Operators

* [Authorino Operator](components/operators/authorino-operator/)
* [NVIDIA GPU Operator](components/operators/gpu-operator-certified/)
* [Node Feature Discovery Operator](components/operators/nfd/)
* [OpenShift AI](components/operators/openshift-ai/)
* [OpenShift Pipelines](components/operators/openshift-pipelines/)
* [OpenShift Serverless](components/operators/openshift-serverless/)
* [OpenShift ServiceMesh](components/operators/openshift-servicemesh/)

### Applications

* OpenShift GitOps: [ArgoCD](components/argocd/)
* S3 compatible storage: [MinIO](components/apps/minio)

### Configuration

* [Bootstrap Overlays](bootstrap/overlays/)
* [Cluster Configuration Sets](clusters/overlays/)
