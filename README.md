# Mac Developer Machine Setup
The purpose of this repository is to automate most of the mac developer environment setup using Ansible.

## Getting Started

The easiest way to dive right in is to execute the following from the terminal:
```
curl -s https://raw.githubusercontent.com/afdabro/devops/master/start.sh | /bin/bash
```
This will execute the Start Script to install the developer environment.

### Start Script
The Start script performs the following tasks:
1. Clones the repository
2. Changes directories to repository
3. Executes the install script

### Install Script
The Install script performs the following tasks:
* Installs & Configures Ansible
* Installs Applications using Homebrew and Cask
* Installs & Configures Languages
    * Python3
    * Node
    * Java
    * Go
* Configures Mac Settings for Developer Environment
* Installs & Configures AWS CLI

### Manual Steps

Sadly, not every step can be automated. The following sections focus on areas which are not automated but still play an important role in developer environment setup.

#### Configure AWS

I. Get the access key ID and secret access key for your IAM user

Note: Your AWS user must have IAM permissions in order to retrieve AWS credentials.

1. Open the IAM console from within the AWS Console.

2. In the navigation pane of the console, choose Users.

3. Choose your IAM user name (not the check box).

4. Choose the Security credentials tab and then choose Create access key.

5. To see the new access key, choose Show. Your credentials will look something like this: 
```
Access key ID: AKIAIOSFODNN7EXAMPLE
Secret access key: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```
6. To download the key pair, choose Download .csv file. Store the keys in a secure location.

II. Initialize AWS Profile

1. Open a terminal
2. Execute the following command but replace "me" with a valid profile name.
```
aws configure --profile me
```
3. Enter the AWS Access Key ID and Secret access key retrieved in part 1.
4. Enter the default region. Ex.
```
us-east-1
```
5. Press enter to accept the default output file type of text.

III. More AWS profiles

Repeat Parts 1 & 2 for all profiles.

IV. More Information

[AWS CLI Getting Started Guide](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)