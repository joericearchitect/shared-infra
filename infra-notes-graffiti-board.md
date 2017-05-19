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
   
## Software that has to be installed to run env buildout stuff 
* Terraform
* Ansible
* Ansible Ec2 script
