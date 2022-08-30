echo "[$(date '+%Y-%m-%d %H:%M:%S')] Installing dotfiles" > $HOME/.dotfile-install-log

# Copy dotfiles and dotfile dependencies
cp -fr aperture.zsh-theme $HOME/.oh-my-zsh/custom/themes/aperture.zsh-theme
cp -fr .bashrc $HOME/.bashrc
cp -fr .dircolors $HOME/.dircolors
cp -fr .gitconfig $HOME/.gitconfig
cp -fr .install-vs-code-extensions.sh $HOME/.install-vs-code-extensions.sh
cp -fr .npmrc $HOME/.npmrc
cp -fr .tmux.conf $HOME/.tmux.conf
cp -fr .vimrc $HOME/.vimrc
cp -fr .zsh_history $HOME/.zsh_history
cp -fr .zshrc $HOME/.zshrc

# Install OS dependencies
sudo apt-get -y install --no-install-recommends tmux wget
# Supabase
wget https://github.com/supabase/cli/releases/download/v1.3.0/supabase_1.3.0_linux_amd64.deb
sudo apt install -y ./supabase_1.3.0_linux_amd64.deb
rm ./supabase_1.3.0_linux_amd64.deb

# Install Node dependencies
npm install -g n
PATH="$PATH"
sudo n lts
sudo chown -R $(whoami) /usr/local/n /usr/local/lib/node_modules /usr/local/bin /usr/local/include /usr/local/share
npm install -g @microsoft/rush@5.77.1 prettier@2.6.2 pnpm@7.9.5 git-checkout-interactive

# Set timezone
sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
echo 'America/New_York' | sudo tee /etc/timezone

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Done installing dotfiles" >> $HOME/.dotfile-install-log
