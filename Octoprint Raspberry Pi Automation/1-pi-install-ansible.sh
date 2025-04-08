#!/bin/bash
# ---------------------------------------------------
# Script Name: 1-pi-install-ansible.sh
# Description: Updates packages and instlls Ansible on Raspberry Pi
# Author: Robert Singers
# Date: 2025-04-05
# Version: 1.0
# ---------------------------------------------------

sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
sudo apt autoremove