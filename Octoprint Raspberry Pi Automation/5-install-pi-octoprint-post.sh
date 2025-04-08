#!/bin/bash
# Capture the Octoprint Instance name from the command line
SERVICE_NAME=$1
ansible-playbook -K --ask-become-pass -i localhost, 5-install-pi-octoprint-post.yml --connection=local --extra-vars "service_name=${SERVICE_NAME}"
