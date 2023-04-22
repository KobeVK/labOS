# LAB-OS
DevOps Engineer Home Challenge for @LAB-OS

- [Project purpose](#purpose)
- [Architecture](#architecture)
- [install locally](#install_local)
- [Setup througt pipeline (Jenkins)](#install_with_jenkins)
- [future Work](#future_work)


# Project purpose <a name="purpose"></a>
DevOps Engineer Home Challenge for @LAB-OS
As part of this Home assignment, I was required to create a web-app behind an NginX proxy, that returns release versiono of any GitHub repository using GitHub API.

# Architecture  <a name="architecture"></a>
![Versatile web app CI diagram](media/lab-os.png)

<br>
Versatile web app  CICD flow involves the following stages: <br><br>

1. `Build` <br>
In this stage, we build a <br>
1. `Deploy` <br>
In this stage, we deploy an EC2 instance to aws, using terraform aws module<br>
4. `Test` <br>
In this stage, we test the functionality of the web-app <br>
such as: <br>
    4.1 Health Checks

# install locally  <a name="install_local"></a>
To deploy development enviornemt:
1. clone the repo
1. cd LABOS/
1. export aws_key = "<your_aws_key>"
1. export aws_secret = "<your_aws_secret>"
1. terraform init
1. terraform plan -out myplan -var="ami=${ami}" -var="region=${region}" -var="type=${type}"
1. terraform apply -auto-approve -var="ami=${ami}" -var="region=${region}" -var="type=${type}"

# Setup througt pipeline (Jenkins)  <a name="install_with_jenkins"></a>
To deploy enviornemt using jenkins pipeline:
1. head over to http://35.180.188.19:8080/job/deployEnv/
1. labos
1. Build with Parameters
1. specify region, ami and type
1. build
1. access your webapplication via the IP printed in the console output

# Future Work  <a name="future_work"></a>
1. convert to ansible instead of user-data
1. apply tests with timout of when the page is up
1. push images to docker hub and tag it with versino number
1. display a webpage that says "no github repo was entered, please use as: http://xx.xx.xx.xx:80/elastic/elasticsearch to get the release version of the repo






