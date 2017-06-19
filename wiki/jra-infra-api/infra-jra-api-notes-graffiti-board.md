 ## Overview
 
 Just somee random notes in planning out JRA infra.  just to capture stuff
 
 go back and comb through all this and make formal docs
 
# Notes on API Orgnization

## Environments

**Resources**

* Environments (list & detail)
  - Identifier
    + jra.environment-cananical-id
  - Filter fields
    + jra.environment type
    + jra.environment name
    + jra.environment-status
  - Return Data (List & Filter)
     + List of All Environments
       - canonical-id
       - name
       - description
       - link to environment detail
       - environment-status
       - environment-start-date-time
       - environment-end-date-date
       - environment-last-modification-date-time
     * Response Duration
  - Return Data (Detail)
     + <identifiers & filter fields>
     + environment-start-date-time
     + environment-last-modified-date-time
     + environment-activity-events
       + activity-event-type
       + activity-start-date-time
       + activity-end-date-time
     + Response Duration
     + jra.environment-durability-type
     + environment-billing-info
     + environment-configuration
       + Terraform State file
     + environment-health
     + links
       - metrics
       - logging
       - consul
     + list of swarm clusters
     + List of Application Groups
    
**Operations**
  - Create Environment
  - Destroy Environment
  - Stop Environment
  - Start Environment
  - Backup Environment
  - Validate Environment
  
**Endpoints**

* /infra-api/environments

* /infra-api/environments/{environment-canonical-id}

#### Swarm Clusters

**Resources**

* Swarm Cluster (list & details)
  - Identifiers
    + jra.canonical-swarm-cluster-id

* Nodes (list & detail)
  - Identifiers
    + jra.cananical-node-id
    + aws-instance-id
    + docker-swarm-node-id
  - Filter Fields
    + environment-id
    + environment-type
    + environment-name
    + environment-status
    + public-ip
    + public-dns
    + private-ip
    + private-dns
    + environment type
    + environment name
    + jra.node-type
    + aws-region
    + aws-avail-zone
    + swarm-node-host-name
  - Return Data (Detail)
     + <identifiers & filter fields>
     + aws-AMI-id
     + aws-ELBs
     + AWS links
       - VPCs
       - Security Groups
       - subnets
     + Node configuration (consul)
     + List of Services Deployed
     + List of Containers Running
     + hardware capacity info
       + cpu cores
       + allocated memory
       + allocated disk
     + hardware runtime info
       + used-memory
       + free-memory
       + cpu used
       + used-disk
       + free-disk

**Endpoints**

* /infra-api/container-clusters

* /infra-api/container-clusters/{container-cluster-canonical-id}

* /infra-api/container-nodes

* /infra-api/container-nodes/{container-node-canonical-id}

* /infra-api/containers

* /infra-api/containers/{container-canonical-id}


#### Applications & Service
**Resources**
* Services (list & detail)

**Endpoints**

* /infra-api/application-groups

* /infra-api/application-groups/{application-group-canonical-id}

* /infra-api/applications

* /infra-api/applications/{application-canonical-id}

* /infra-api/application-instances

* /infra-api/application-instances/{application-instance-canonical-id}

#### Infrastructure Configuration

#### Application Configuration

#### Infrastructure Health & Status

#### Application Health and Status

#### Metrics


## General Notes

* This is how ApplicationGroups will work - super flexible
  -  Appliccation Groups are an arbitrary way to group resources together.  They can be used for different purposes:
     1) get rolled up views of costs, alerts, status info, etc, etc, etc 
     2) group resources into different application views:  For example you might have:
        -  an "availability service" application group that groups all the smaller micro-services that make up the availabiliy api
        -  an application group that groups just the services your team manages.
        -  multiple groupings:
	        -  a "persistence" application group that groups all containers running databases and other persistent stores .
	        -  or you could have an "elasticSearch" and "MongoDB" application group that groups just the all services running elasticsearch or mongodb.
	 3) Use Cases
	    -  Tag all MySql instances with "MySql" application group so you can set up sql Monitoring tools to auto-discover all MySql dataases in environment
	    -  Set up dashboards & monitoring alerts for only the resources & services your team supports.
	 4) You get the idea

* A resource can belong to mutliple application groups.  And any resource that can be tagged or labeled can be part of an application group, both infrastructure & applications, including:
  - AWS EC2 instances
  - AWS VPCs, security groups, subnets, ELBs, Nat Gateways, etc, etc
  - Docker Engine running on a VM or physical machine
  - Containers deployed to Docker Engine
  - Docker Swarm Node
  - Swarm Services and containers deployed to Docker Swarm
  

* difference betweeen application stack and application group:
  -  Both are a way to group different resources together.
  -  But Applicaton Stack is meant to be a fixed grouping.  It allows multiple swarm servies to be considered as an isolated, self-contained, single deployable unit.
  -  Application Groups are flexible way to group resourcs for purposes of organizing, reporting, and getting different cost views.
  -  Application Groups can be applied to any resource.  Appliction Stacks ponly grup together related Docker Swarm Services & Docker Engine containers.
  -  Examples:
     *  App Stack - WordPress app - UI & MySql - considered as 1 app.  MySql is dedicated to WordPres and no other service will share it.
     *  App Stack - Small Admin App - UI, 2 REST services, & MySql - self-contained.  Deployed & updated as a unit.
     *  Application Group - Enterprise UI that relies on a number of REST services.  
        - We may want to group them together for billing & monitoring purposes, 
        - but they are independent services that communicate with each other.  Independently deployed.
        - They will all be tagged with the same application gorup, but not deployed as part of the same app stack.
        


  -  
     
