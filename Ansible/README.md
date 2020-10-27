## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Diagrams/"Network Diagram.png")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively,  playbook files may be used to install only certain pieces of it, such as Filebeat.

  - /Ansible/Filebeat

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- The only way to access the configuration side of the network is through a jump box machine, meaning there is a smaller attack surface.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the metric and system logs.
- filebeat: Watches for system logs and changes.
- metricbeat: Watches and logs system metric data such as CPU and RAM usage.

The configuration details of each machine may be found below.

| Name                 | Function   | IP Address | Operating System |
|----------------------|------------|------------|------------------|
| Jump-Box-Provisioner | Gateway    | 10.0.0.9   | Ubuntu           |
| Web-1                | Web Server | 10.0.0.7   | Ubuntu           |
| Web-2                | Web Server | 10.0.0.8   | Ubuntu           |
| Web-3                | Web Server | 10.0.0.12  | Ubuntu           |
| elk-docker           | Log Server | 10.1.0.4   | Ubuntu           |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumphost machine can accept connections from the Internet, aside for the public facing HTTP ports. Access to this machine is only allowed from the following IP addresses:
- 122.151.113.236

Currently, all machines within the network can only be accessed by the jumphost, or through the public IP above.
- elk-docker public ip: 52.175.147.245

A summary of the access policies in place can be found in the table below. (RTFW-01)

| Name       | Publicly Accessible | Allowed IP Addresses |
|------------|---------------------|----------------------|
| Jump Box   | Yes                 | 122.151.113.236      |
| elk-docker | Yes                 | 122.151.113.236      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The process saves lots of time and effort.

The playbooks perform the following tasks:
- Install docker on Webservers
- install python module for docker
- install pip3 module for python
- configure machines to connect correctly
- install filebeat and metricbeat and begin sending logs to logging server.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/dockerps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1, Web-2 and Web-3 (Webservers)

We have installed the following Beats on these machines:
- Metricbeats
- Filebeats

These Beats allow us to collect the following information from each machine:
- Metricbeats collects system metrics like resource usage, while Filebeats collects logs regarding OS and system file modification.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook files to the jumphost.
- Update the playbook configuration to include child IP addresses / groups.
- Run the playbook, and navigate to the public IP of the machine / load balancer (if identical config used) to check that the installation worked as expected.

### Downloading the Configuraion files

To download the configuration, use this command:

```
git clone https://github.com/jontiadcock/JA-Scripts-and-Other-Information-01
```