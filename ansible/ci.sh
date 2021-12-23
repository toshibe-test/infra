#!/bin/bash

mkdir ~/.ssh
cat <<EOF > ~/.ssh/config
Host *
  ForwardAgent yes
  ServerAliveInterval 30
  ServerAliveCountMax 5
  GSSAPIAuthentication no
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
EOF
cd `dirname $0`
cat ./hosts > /etc/hosts
cat /etc/hosts

echo -e "${TOSHI_KEY}" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo -e "${VAULT_PASS}" > ~/.ssh/.ansible_vault_pass
chmod 644 ~/.ssh/.ansible_vault_pass
