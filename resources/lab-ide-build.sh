#!/usr/bin/env bash

# Install jq
sudo yum -y install jq

# Install bash-completion
sudo yum install bash-completion -y

aws ec2 describe-security-groups \
    --group-name $(curl -s http://169.254.169.254/latest/meta-data/security-groups/ | head -n 1) | \
    jq '.SecurityGroups[0].IpPermissions[].ToPort' | grep 80 && echo "Port 80 Open"

if [ $? -eq 1 ]; then
  # Allow access on port 80
  aws ec2 authorize-security-group-ingress \
      --group-name $(curl -s http://169.254.169.254/latest/meta-data/security-groups/ | head -n 1) \
      --protocol tcp --port 80 --cidr 0.0.0.0/0
fi

aws ec2 describe-security-groups \
    --group-name $(curl -s http://169.254.169.254/latest/meta-data/security-groups/ | head -n 1) | \
    jq '.SecurityGroups[0].IpPermissions[].ToPort' | grep 443 && echo "Port 443 Open"

if [ $? -eq 1 ]; then
  # Allow access on port 443
  aws ec2 authorize-security-group-ingress \
      --group-name $(curl -s http://169.254.169.254/latest/meta-data/security-groups/ | head -n 1) \
      --protocol tcp --port 443 --cidr 0.0.0.0/0
fi

if [ ! -d "docker-workshop/" ]; then
  # Download lab Repository
  git clone https://github.com/marcossantiago/docker-workshop.git
fi

cat << EOF
  ____             _              __        __         _        _
 |  _ \  ___   ___| | _____ _ __  \ \      / /__  _ __| | _____| |__   ___  _ __
 | | | |/ _ \ / __| |/ / _ \ '__|  \ \ /\ / / _ \| '__| |/ / __| '_ \ / _ \| '_ \
 | |_| | (_) | (__|   <  __/ |      \ V  V / (_) | |  |   <\__ \ | | | (_) | |_) |
 |____/ \___/ \___|_|\_\___|_|       \_/\_/ \___/|_|  |_|\_\___/_| |_|\___/| .__/
                                                                           |_|
 Details:
 --------
 Docker Workshop Version: May 2018
EOF

echo " Endpoint URL: https://"$(curl -s http://169.254.169.254/latest/meta-data/public-hostname/)
echo ""
