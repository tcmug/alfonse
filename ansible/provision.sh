#!/bin/bash

ansible-playbook container.yml -c ssh -i inventory/hosts
