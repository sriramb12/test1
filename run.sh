  sudo apt update
  sudo apt install -y net-tools
  ifconfig
  ip=`grep 10.*255 /proc/net/fib_trie | head -1 | awk '{print $(NF)}'`
  ssh-copy-id -i ~/.ssh/id_rsa.pub -o IdentitiesOnly=yes root@$ip
  ssh-keygen -b 2048 -t rsa /tmp/sshkey -q -N ""
  ssh-copy-id -i ~/.ssh/id_rsa.pub -o IdentitiesOnly=yes root@10.208.159.229
  sudo apt install -y     software-properties-common     bash-completion     git     git-lfs     nano     vim     terminator     screen     tmux     locales     tzdata     mc     curl     lsb-release     iftop     iperf     iputils-ping     python3-pip
  sudo locale-gen en_US.UTF-8; sudo dpkg-reconfigure -f noninteractive locales
  sudo apt install -y docker
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88 && sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable" && sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io && sudo usermod -aG docker $USER
  DOCKER_VER=1.29.2
  mkdir -p ~/.local/bin && pushd ~/.local/bin && wget https://gitlab.com/ApexAI/ade-cli/uploads/591bf9c7ef766cf859749b21afa700b7/ade+x86_64 -O ade && sudo chmod +x ade && echo "export PATH=$PATH:$(pwd)" | tee -a ~/.bashrc && echo 'export ADE_DOCKER_RUN_ARGS="--privileged --network=host"'  | tee -a ~/.bashrc && source ~/.bashrc && popd
  cd ~/ade_image
  export deploy_user='sriramb' &&  export deploy_token='SriramSafeAi' &&  docker login -u deploy_ade_volume -p $deploy_ade_volume_token registry.gitlab.safeai.ai &&  ./mk_docker.sh --ade_home ~/adehome 
  mkdir ~/ade_image
  export DEPLOY_ADE_VOLUME_USER=sriramb
  export DEPLOY_ADE_VOLUME_TOKEN=SriramSafeAi
  export deploy_user=$DEPLOY_ADE_VOLUME_USER  &&  export deploy_token=$DEPLOY_ADE_VOLUME_TOKEN &&  docker login -u $DEPLOY_ADE_VOLUME_USER -p $DEPLOY_ADE_VOLUME_TOKEN registry.gitlab.safeai.ai &&  ./mk_docker.sh --ade_home ~/adehome 
  env
  export deploy_user=root &&  docker login -u $DEPLOY_ADE_VOLUME_USER -p $DEPLOY_ADE_VOLUME_TOKEN registry.gitlab.safeai.ai &&  
  git clone git@gitlab.safeai.ai:production/ade_image.git 
  git clone https://$DEPLOY_ADE_VOLUME_USER:$DEPLOY_ADE_VOLUME_TOKEN@gitlab.safeai.ai/production/ade_image.git
  ~/ade_image/mk_docker.sh --ade_home ~/adehome 
