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


#### Applications & Services

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
