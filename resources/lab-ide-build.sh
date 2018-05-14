#!/usr/bin/env bash

# Install jq
sudo yum -y install jq

# Install bash-completion
sudo yum install bash-completion -y

if [ ! -d "docker-workshop/" ]; then
  # Download lab Repository
  git clone https://github.com/marcossantiago/docker-workshop.git
fi

cat <<EOF
  ____             _              __        __         _        _
 |  _ \  ___   ___| | _____ _ __  \ \      / /__  _ __| | _____| |__   ___  _ __
 | | | |/ _ \ / __| |/ / _ \ '__|  \ \ /\ / / _ \| '__| |/ / __| '_ \ / _ \| '_ \\
 | |_| | (_) | (__|   <  __/ |      \ V  V / (_) | |  |   <\__ \ | | | (_) | |_) |
 |____/ \___/ \___|_|\_\___|_|       \_/\_/ \___/|_|  |_|\_\___/_| |_|\___/| .__/
                                                                           |_|
 Details:
 --------
 Docker Workshop Version: May 2018
EOF

echo " Endpoint URL: https://"$(curl -s http://169.254.169.254/latest/meta-data/public-hostname/)
echo ""
