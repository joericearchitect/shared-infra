 ## Overview
 
 Just somee random notes in planning out JRA infra.  just to capture stuff
 
 go back and comb through all this and make formal docs
 
 
 ## Notes from moving from 1 AWS Account to the next 
 
 ### Stuff that I had to change in Terraform
 
 * Hosted Zone ID 
   - because I had to set up new hosted zone first.
   - solution is to create a new hosted zone as part of this automation
   
* AMI Id
  - Using a cust
  
* Key Pair

* Creds
  - access key
  - access secret
  
 ## Challenges when creating a dynamic automated solution wihtout requiring a lot o manual setup
 
 * Managing AWS account specific things like:
   +  AMIs
   +  Domain Names

## Stuff you gotta do to set up enviornment to run the env buildout scripts & stuff
*  set environment variables
   -  Can use [dev-env-vars.sh](https://github.com/joericearchitect/shared-infra/blob/master/scripts/config/dev-env-vars.sh) as an example of all env variables to set
   -  Or can copy that file into:  /etc/profile.d
   
*  Set up the aws access key file:
   -  Make sure to put privatge access key (access-key-name.pem) somewhere
   -  chmod 400 <file>
   -  Set environment variable AWS_KEY_FILE_PATH=<file>
   
## Stuff that has to be parameterized in order to allow jenkins to build

* jra-domain-name
* amis_docker_node
* environment-domain-prefix
* environment
* environment_type
* environment-size
* aws region
* vpc_cidr
* public_subnet_cidr
* private_subnet_cidr
* 
   
### Software that has to be installed to run env buildout stuff 
* Terraform
* Ansible
* Ansible Ec2 script


## To-Dos

* Parameterize the following in ansible scripts
  -  Ansible
     - domain name

* Add creation of hosted zone to terraform script
  -  Right now, it's expected to be there
  
## Thoughts on Infra API & CLI

### Overview

2 central components of the JRA Infrastructure are automation and dynamic enviornments.  The goal is to make it super easy and super fast to:

* Automate the build out of dynamic enviornments and deployment of application code
* Test & Validate both infrastructure and applications running on it are stable and functioning correctly
* Get information about these highly dynamic environments:  metadata, metrics, names, etc.
* Automatically detect and respond to error conditions without human intervention.  Self heal where possible.
* Automatically roll back code and infrastructure to last good known state in case of deployment failures
* Etc, Etc, Etc.  All the dev-ops-ey stuff

To that end, I am building out 3 things that will greatly simplify and speed all that work mentioned above.  

1) **A REST API** - that gives easy-to-consume information and metadata about the enviornment, infrastructure, and applications
2) **A CLI (Command-Line Interface)** - interface for interacting with environment and executing automated tasks.  Used by both humans and automated machines.
3) **Docker Container Pre-Configured with both the API and the CLI** - to make it super-easy to execute the infrastructure automation from any machine that has a Docker Engine.

They build on top of each other.  Basically,

* The API pulls dynamic information about the environment & state of the infrastructure from many different APIs and datasources and provide a unified higher-level view.  Data Sources:
  - AWS Metadata (AWS API)
  - Docker Metadata (Docker API & CLI)
  - Configuration Stores (Consul)
  - Infrastructure (Load Balancers, Reverse-Proxies, API Gateways)
  - Metrics collection & operational analytics (Grafana & Splunk)

* The CLI uses the data from the API to execute scripts & run automation tasks.  The CLI provides a higher-level abstraction over a number of lower-level scripts, tools, and technologies used for automation.  The CLI abstracts over:
   - Terraform scripts for infrastructure buildout
   - Ansible / Chef scripts for infrastructure provisioning & configuration
   - Docker & Docker Compose configs
   - Database & persistent data backup, restoration, archival, and migration scripts
   - Infrastucture Validation scripts

* The Docker Container makes all of the above self-contained, portable, and super-easy to execute.  All you need is Docker and the necessesary credentials:  eg, AWS secrets & keys, Git Hub credentials, etc.  These docker containers can be used and executed by:
   - CI / CD PIpelines - Jenkins would run the standard JRA CLI tools to build, deploy, run validations, get metadata and configuation data, sping up new enviornments, spin down environments, etc
   - Infrastructure Engineers - validate enviornments, troubleshoot infrastructure issues, experiment
   - Developers

### Some Basic Principles for API & CLI

* Don't re-invent the wheel.  Both the API and CLI are meant to be abstractions on top of other tools to make it eaiser and faster to work with them.  Does not try to replace those tools.
  - The API will pull together metadata from many different sources and tie them together.  
  - The CLI should largely be used as the glue between other tools & scripts such as Terraform, Ansbile, Docker, etc.
  - Typical use case:  Call 1 script passing in data from the API, get the output from the response, then look up data in the API needed to call another script.

* Small & modular - re-usable building blocks that can be mixed and matched to quickly build complex scripts.

* The CLI is a real CLI and have the features of a modern useful CLI.  It should provide some of the following features:
  - --help and usage guides
  - long and short parameter names
  - syntax validation
  - contextual information in errors - should provide as much information as possible to help troubleshoot and spot any issues
    + Horrible - "Error Occurred" is the most frstruating and unhelpful messaging possible to give someone who is trying to use your tool.  
    + Useful - "Error Occurred trying to connect to AWS using key-pair-name:  'XXX'.  Error message:  'XXX'.  AWS command attempted:  'XXX'.  
  = exit codes
  - progress bars for long-running tasks (where possible)
  - Reasonable timeouts

* The API should be as simple as possible, while providing the most useful amount of data possible.  It should be easily consumable.
  - Prefer flat data structures as much as possible.

* The CLI should be high-level and simple.  Should hide complexity as much as possible.
  - Carefully think through the contract:
    - Inputs
    - Outputs
    - Required Fields
    - Idempotence of operations
    - Expected Pre-Conditions & Post Conditions
    - Validations
      - Input parameters
      - Environment state  
      
* Infrastructure as Code - Code is versioned controlled and tested
  - Unit tests for CLI, scripts, and other tools
  - For each scripting language or tool, see if there is a linting for it and use it if possible.
  - Infrastructure scripts & CLI 

* The meta-data returned from the API should not be exhaustive.  Should contain only the most pertinent data needed to aid scripting and UI displays
  + Should contain links to the source systems / data for more info whereever possible.
  + Good Candidates to be returned from API
    -  Lookup info:  For each resource should have various identifiers used by different systems / tools.  
    -  Basic status & health info
    -  Tags, Labels, and other metadate used to organize and filter resources.
    -  Names and descriptions - used for display and indexing / searching.
    -  Dates (created, modified, deleted)
    -  Links to source systems for more detailed info (Links to AWS API, Docker API, Consul API, ElasticSearch queries, etc)
    -  Example:  For a Swarm Node Resource, should return the following to make it easier to lookup identifiers 
       + instance id, public & private IPs and dns names (provided by and used by AWS EC2)
       + node id, leader status, active status, exposed and internal ports (provided and used by Docker Swarm)
       + AWS instance tags 
       + Docker Engine Labels
       + Docker Swarm Labels
       + Consul configuration
       + JRA metadata:  node type, environment-name, environment-instance-id, failure zone
       + Status & Health
         -  ELB health check
         -  Docker Swarm Node health
         -  Grafana Health Stats
    -  Another example: For a Docker Swarm Service, (i.e application, database, api, etc), should return:
       + service id, service name, replicas, image, ports, constraints, image version (provided by and used by docker)
       + JRA Metadata (Application name, application type, environment flip, application-version, etc
       + Application URLs
         - API Spec
         - Main UI URL
         - Main API URL
         - Health Check URL
       + External URLs
         - Metrics URL (Grafana)
         - Splunk URL

### Orgnization of API

#### Environments

**Resources**

* Environments (list & detail)
  - Identifiers (searchable)
    + environment id
    + environment type
    + environment name

#### Swarm Clusters

**Resources**

* Nodes (list & detail)
  - Identifiers (searchable)
    + environment id
    + environment type
    + environment name
    
* Docker Engines (list & detail)

#### Applications & Services

* Services (list & detail)

#### Infrastructure Configuration

#### Application Configuration

#### Infrastructure Health & Status

#### Application Health and Status

#### Metrics

### Organization of CLI
