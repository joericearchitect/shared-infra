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
   -  Set environment variable AWS_KEY_PATH=<file>
   
### Software that has to be installed to run env buildout stuff 
* Terraform
* Ansible
* Ansible Ec2 script

