echo "=> 删除~/.nvm"
rm -rf $HOME/.nvm

echo "=> 删除相关环境变量"
sed -i '/nvm config/d' "${HOME}/.bashrc"
sed -i '/This loads nvm/d' "${HOME}/.bashrc"
sed -i '/NVM_NODEJS_ORG_MIRROR/d' "${HOME}/.bashrc"

sed -i '/nvm config/d' "${HOME}/.zshrc"
sed -i '/This loads nvm/d' "${HOME}/.zshrc"
sed -i '/NVM_NODEJS_ORG_MIRROR/d' "${HOME}/.zshrc"

echo "=> 删除nvm-update"
sudo rm  /usr/local/bin/nvm-update
echo "=> 卸载完成!"