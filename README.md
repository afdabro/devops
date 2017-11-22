# devops
Automated mac developer environment setup using Ansible.

## Getting Started

If you want to dive right in, execute the following from the terminal:
```
curl -s https://raw.githubusercontent.com/afdabro/devops/master/start.sh | /bin/bash
```

### Start Script
The Start script performs the following tasks:
1. Clones the repository
2. Changes directories to repository
3. Executes the install script

### Install Script
The Install script performs the following tasks:
* Installs & Configures Ansible
* Installs Applications using Homebrew and Cask
* Configures Mac Settings for Developer Environment