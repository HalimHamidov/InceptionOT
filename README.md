# Inception-of-Things

21 school project

Description
This project aims to introduce you to kubernetes from a developer perspective. You will have to set up small clusters and discover the mechanics of continuous integration. At the end of this project you will be able to have a working cluster in docker and have a usable continuous integration for your applications.

# Keywords

- System administration

# Skills

- Rigor
- Network & system administration

# P3
# Difference K3D & K3S
1. K3D deploy to Docker-based k3s Kubernetes, and K3S on virtual-machine-based Kubernetes cluster
2. K3D have scalable version
3. More features
4. You could k3D even in little devices (RaspBerry Pi, IoT).


# Useful commands:


# TODO проверить красные линии и 
    default: error: error validating "/vagrant/confs/ingress.yaml": error validating data: [ValidationError(Ingress.spec.rules[0].http.paths[0].backend): unknown field "serviceName" in io.k8s.api.networking.v1.IngressBackend, ValidationError(Ingress.spec.rules[0].http.paths[0].backend): unknown field "servicePort" in io.k8s.api.networking.v1.IngressBackend]; if you choose to ignore these errors, turn validation off with --validate=false
    Возомжно сломан и kubectl потому что все применяется а он ничего из ресурсов не видит/