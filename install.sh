#!/bin/bash
set -e

export NVM_DIR="$HOME/.nvm" && (
  echo "=> Git clone nvm"
  git clone https://gitee.com/RubyKids/nvm-official.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"


echo "=> 添加nvm环境变量(Bash,Zsh)"
echo -e "\n# nvm config" >> ~/.bashrc
echo -e "\n# nvm config" >> ~/.zshrc

echo "export NVM_DIR=\"\$HOME/.nvm\"" >> ~/.bashrc
echo "export NVM_DIR=\"\$HOME/.nvm\"" >> ~/.zshrc
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \\. \"\$NVM_DIR/nvm.sh\" # This loads nvm"  >> ~/.bashrc
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \\. \"\$NVM_DIR/nvm.sh\" # This loads nvm"  >> ~/.zshrc


echo "=> 使用淘宝镜像"
echo "export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node" >> ~/.bashrc
echo "export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node" >> ~/.zshrc

echo "=> 安装nvm-update,升级更新请使用该命令"
curl -fsSL https://gitee.com/RubyKids/nvm-cn/raw/master/nvm-update.sh -o nvm-update.sh
chmod +x ./nvm-update.sh
sudo mv ./nvm-update.sh /usr/local/bin/nvm-update

echo "=> 安装完成!"
echo 