 ## Overview
 
 Just somee random notes in planning out JRA infra.  just to capture stuff
 
 go back and comb through all this and make formal docs
 
# Overview Notes on Environments

## Tools used in Environments

* **Terraform** 
  -  Used to
     + Create & Destroy Environment Networking & Machine Resources 
  - Notes:
    +  dsf
    
* **Ansible** 
  -  Used to
     +  Provision Environment and Deploy Apps 
  - Notes:
    +  XXX

* **Docker Swarm** 
  -  Used to
     + Schedule, Run, and Monitor Docker Swarm Service / Containers 
  - Notes:
    +  XXX
    
    
* **JRA Infra API** 
  -  Used to
     + Provide meta-data about the live dynamic enviornment 
  - Notes:
    +  XXX

* **JRA Infra CLI (Python Script)** 
  -  Used to
     + Command Line Interface to 
       1) create, configure, refresh, and destroy environments, 
       2) Get Inforation & Metadata about Environments, 
       3) deploy resources into environments, 
       4) validate environments  
  - Notes:
    +  JRA CLI will be used by both humans and automation tools. The CLI calls teraform, ansible, docker swarm, and the JRA Infra API to automate.

* **JRA Infra Admin Docker Image** 
  -  Used to
     + Make it easy to execute JRA CLI commands without having to set up a machine or environment.  Docker is only prerequisite. 
  - Notes:
    +  XXX
    
* **JRA Jenkins CI / CD Pipeline** 
  -  Used to
     + manage environments through CI / CD pipelines.  Automated and Manual Push-button.  The only interface non-ops users use to interact with environments  
  - Notes:
    +  XXX
    

# Notes on Environment Operations

## Create Environment

### Jenkins Pipeline

**Inputs**

**Outputs**


### JRA Infra CLI

**Inputs**

**Outputs**


### Terraform

**Inputs**

* Environment MetaData
  - environment display id
  - environment name
  - environment display name
  - environment description
  - environment type
  - environment size
  - environmentDurabilityType
  - environmentDomainPrefix
  - environmentDomainName
  - environmentStartPortRange
  - environmentEndPortRange
  - vpcCidr
  - public subnet cidr
  - private subnet cider
  - central admin infra
    - logging-driver
    - logging-server-url
    - metrics-server-url
    - monitoring-server-url
    - jra-infra-api-url
  - local admin infra
    - logging-driver
    - logging-server-url
    - metrics-server-url
    - monitoring-server-url
    - jra-infra-api-url

* Regions, Availability Zones, and AMIs

* Container Cluster
  - container cluster display id
  - container cluster name
  - container cluster display name
  - Public Cluster Nodes
    - num of instances
    - container cluster node display id
    - container cluster node name
    - container cluster node display name
    - application groups
    - node type
    - swarm cluster node role
  - Private Cluster Nodes

* 

**Outputs**

* vpc ids

* 

### Ansible

**Inputs**

**Outputs**


  -  
     
