#!/bin/bash

set -e
set -x

if rpm -q --whatprovides kernel | grep -Fqv $(uname -r); then
  rpm -q --whatprovides kernel | grep -Fv $(uname -r) | xargs sudo yum -y remove
fi

sudo yum --enablerepo=epel clean all
sudo tee /var/log/yum.log < /dev/null
