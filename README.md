# coex-poc-ce-infra #
########################################
Terraform repo for the CoEx Chaos Engineering PoC

Creating Chaos

# Deploying The Application #
########################################################

git clone https://github.com/microservices-demo/microservices-demo

cd microservices-demo/deploy/kubernetes

kubectl create namespace sock-shop

kubectl apply -f complete-demo.yaml

# Create FrontEnd's LoadBalancer  #
###################################################################

kubectl apply -f k8s/frontend-services-lb.yml

# Install ChaosToolKit  #
############################################

sudo apt install python3-pip

sudo pip install -U chaostoolkit

sudo pip install -U chaostoolkit-kubernetes

sudo chaos discover chaostoolkit-kubernetes

cat discovery.json

# Terminating Application Instances #
######################################################################

cat chaos/terminate-pod.yaml

chaos run chaos/terminate-pod.yaml

kubectl --namespace sock-shop get pods

# Steady State Hypothesis #
#####################################################

cat chaos/terminate-pod-ssh.yaml

diff chaos/terminate-pod.yaml chaos/terminate-pod-ssh.yaml

chaos run chaos/terminate-pod-ssh.yaml

kubectl --namespace sock-shop apply --filename k8s/terminate-pods/pod.yaml

chaos run chaos/terminate-pod-ssh.yaml

echo $?

kubectl --namespace sock-shop apply --filename k8s/terminate-pods/pod.yaml

# Pausing After Actions #
################################################

cat chaos/terminate-pod-pause.yaml

diff chaos/terminate-pod-ssh.yaml chaos/terminate-pod-pause.yaml

chaos run chaos/terminate-pod-pause.yaml

kubectl --namespace sock-shop apply --filename k8s/terminate-pods/pod.yaml

# Phases And Conditions #
###################################################

kubectl --namespace sock-shop describe pod front-end

cat chaos/terminate-pod-phase.yaml

diff chaos/terminate-pod-pause.yaml chaos/terminate-pod-phase.yaml

chaos run chaos/terminate-pod-phase.yaml

kubectl --namespace sock-shop logs front-end

kubectl --namespace sock-shop apply --filename k8s/db

kubectl --namespace sock-shop rollout status deployment sock-shop-db

kubectl --namespace sock-shop get pods

# Repeat the previous command until the `sock-shop` Pod `STATUS` is `Running`

chaos run chaos/terminate-pod-phase.yaml


# Making The App Fault-Tolerant #
################################################################

cat k8s/terminate-pods/deployment.yaml

kubectl --namespace sock-shop apply --filename k8s/terminate-pods/deployment.yaml

kubectl --namespace sock-shop rollout status deployment front-end

chaos run chaos/terminate-pod-phase.yaml

# Delete Node #
##############################

export NODE_LABEL="beta.kubernetes.io/os=linux"

chaos run chaos/node-delete.yaml

chaos run chaos/node-drain.yaml

chaos run chaos/node-uncordon.yaml


# Destroying What We Created #
#############################################################

cd ..

kubectl delete namespace sock-shop