# LAB-OS
DevOps Engineer Home Challenge for @LAB-OS

- [Project purpose (#architecture)
- Architecture] (#architecture)
- [Technologies used](#tech)
- [Deployment ](#deploy)
- [The tests ](#tests)
- [How to use](#how-to)
- [Future](#Future)


# Project purpose
DevOps Engineer Home Challenge for @LAB-OS
As part of this Home assignment, I was required to create a web-app behind an NginX proxy, that returns release versiono of any GitHub repository using GitHub API.

# Architecture
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

# install locally
To deploy development enviornemt:
1. clone the repo
1. cd LABOS/
1. export aws_key = "<your_aws_key>"
1. export aws_secret = "<your_aws_secret>"
3. terrafrom init
4. terraform apply

