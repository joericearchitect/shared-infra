# Vagrant Dev Environment for JRA

## Overview

This folder provides a neat little dev-environment in a can.   Useful for developing sites and applications for JRA.

Basically, it is a vagrant VM running Ubuntu Linux that is pre-configured with a lot of useful tools.  

It is:
* **Portable** - 
  - Moving to a new developemnt laptop?  Recreate your entire dev environment in a few easy steps and pick up where you left off.
  - Same environment across Linux, Mac OSx, Windows and others...any OS that Vagrant supports
  - Consistent development workflow across multiple machines (e.g. work desktop running Mac OSx & home laptop running Windows)
* **Disposable** 
  - Screw something up?  Destroy your old dev environment and start over.
* **Sharable** -
  - Quick local dev environment setup for new team members
  - Common development environment for all team members
  
## Dev tools installed out of the box (as of 10/2016)
 
| Tool Name | Description |
| ------ | ----------- |
| **Docker** | |
|  - Docker Engine   |  |
|  - Docker Compose   |  |
|  - Docker Machine   |  |
|  - Docker Swarm   | X |
| **Build Tools** | |
|  - Maven   |  |
|  - Gradle  | X |
| **NodeJs**  |  |
|  - NodeJS Server  | X |
|  - NPM | X |
| **Front-End Development Tools** |  |
|  - ImageMagick | X |
|  - GraphicsMagick | X |
|  - Grunt   | X |
| **Languages - Runtime & Compilers** | |
|  - Java 8   |  |
|  - Python   |  |
|  - Ruby   |  |
|  - PHP   | X |
| **Cloud Development** |  |
|  - AWS CLI   |  |
|  - Terraform   | X |
| **Time-Saving Shell Scripts** |  |
|  - Git Shortcuts   |  |
|  - Docker Shortcuts   | X |

------

# High-Level Overview & Developer Workflow

Before diving into too many details, let's take a look at the big picture 

## Dev Environment Overview

* Your dev environment will be a virtual machine (VM) running on VirtualBox and managed by Vagrant.
* From your local machine, you ssh into the dev VM, where all of your favorite tools are set up and pre-configured.
* Typically, you code and develop in your favorite IDE on your local machine. And you compile, build, and run your applications in your dev envrionment VM.
* To support this, there are 2 things that are shared between the local host machine and the dev environment VM:
  - Shared / synced folders 
  - Ports
  
## Standard synced folders

Files in these folders will be synced between the local host machine and the dev env VM.  changes made on the host machine are immediately reflected in the VM and vice-versa.
 
| Folder Name | Description | Default Folder path on host machine | Folder path on dev env VM |
| ------ | ----------- | ----------- | ----------- |
| git | source code.  location of git repos for various projects | <local-git-project-repo>/dev-env/vagrant/workspace/git/ | /home/vagrant/workspace/git |
| applications | applications and configuration that are shared between host and vm | <local-git-project-repo>/dev-env/vagrant/workspace/applications/ | /home/vagrant/workspace/applications |
| maven/conf | configuration files for maven.  So, you can re-use your maven configurations between local and vm | <local-git-project-repo>/dev-env/vagrant/workspace/maven/conf/ | /home/vagrant/workspace/maven/conf |
| maven/.m2 | local Maven repository.  so the VM can access all the maven files that are already on the local machine. | <local-git-project-repo>/dev-env/vagrant/workspace/maven/.m2/ | /home/vagrant/workspace/maven/.m2 |
| aws | source code.  location of git repos for various projects | <local-git-project-repo>/dev-env/vagrant/workspace/aws/ | /home/vagrant/workspace/aws |

------

# Setting up and Configuring

## One-Time Set Up for brand new machine

The steps to get all this dev environment goodness are simple:

1. Install Vagrant
2. Clone this github repo
3. "vagrant up" - &nbsp;   *creates a new VM and provisions it with all of the tools mentioned above*.
4. Customize your host machine
5. Customize your dev VM

### 1 - Install Vagrant

There are plenty of resources on the web to walk you through installing Vagrant for your operation system.  Here are some good ones:
	
* [Official Vagrant Install Docs](https://www.vagrantup.com/docs/installation/ "From the horses mouth")
* [Our good friend, Google](https://www.google.com/#q=install+vagrant)

### 2 - Clone this github repo

```
git clone https://github.com/joericearchitect/infra-common.git
```
### 3 - Start Dev Environment VM - "Vagrant Up"

```
cd <local-git-project-repo>/dev-env/vagrant
vagrant up
```

Get some coffe, read a newspaper, do you taxes, finish that great American novel you're working on.

For first time set-up, this might take a while.  

5 - 10 minutes average. 15 - 20 minutes is not unheard of, especially over a slow internet connection.

### 4 - Customize your host machine


