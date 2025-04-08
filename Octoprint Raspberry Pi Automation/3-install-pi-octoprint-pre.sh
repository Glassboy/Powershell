#!/bin/bash
ansible-playbook -K --ask-become-pass -i localhost, 3-install-pi-octoprint-pre.yml --connection=local