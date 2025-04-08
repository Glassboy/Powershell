#!/bin/bash
ansible-playbook -K --ask-become-pass -i localhost, "2-install-pi-basics
.yml" --connection=local
