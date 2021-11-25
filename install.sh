echo "[$(date '+%Y-%m-%d %H:%M:%S')] Installing dotfiles" > $HOME/.dotfile-install-log

# Copy dotfiles and dotfile dependencies
cp -fr aperture.zsh-theme $HOME/.oh-my-zsh/custom/themes/aperture.zsh-theme
cp -fr .bashrc $HOME/.bashrc
cp -fr .dircolors $HOME/.dircolors
cp -fr .gitconfig $HOME/.gitconfig
cp -fr .install-vs-code-extensions.sh $HOME/.install-vs-code-extensions.sh
cp -fr .tmux.conf $HOME/.tmux.conf
cp -fr .vimrc $HOME/.vimrc
cp -fr .zsh_history $HOME/.zsh_history
cp -fr .zshrc $HOME/.zshrc

# Install OS dependencies
sudo apt-get -y install --no-install-recommends tmux wget
npm install -g git-checkout-interactive

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Done installing dotfiles" >> $HOME/.dotfile-install-log
