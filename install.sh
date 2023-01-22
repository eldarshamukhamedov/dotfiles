echo "[$(date '+%Y-%m-%d %H:%M:%S')] Installing dotfiles" > $HOME/.dotfile-install-log

# Versions
NODE_VERSION=18.13.0
NPM_VERSION=9.3.1
PNPM_VERSION=7.25.1
RUSH_VERSION=5.88.2
PRETTIER_VERSION=2.6.2
SUPABASE_CLI_VERSION=1.34.5

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
sudo apt-get update
sudo apt-get -y install --no-install-recommends tmux wget

# Supabase
wget https://github.com/supabase/cli/releases/download/v${SUPABASE_CLI_VERSION}/supabase_${SUPABASE_CLI_VERSION}_linux_amd64.deb
sudo apt install -y ./supabase_${SUPABASE_CLI_VERSION}_linux_amd64.deb
rm ./supabase_${SUPABASE_CLI_VERSION}_linux_amd64.deb

# Install Node dependencies
curl https://get.volta.sh | bash
PATH=$HOME/.volta/bin:$PATH
volta install \
  node@$NODE_VERSION \
  npm@$NPM_VERSION \
  pnpm@$PNPM_VERSION \
  @microsoft/rush@$RUSH_VERSION \
  prettier@$PRETTIER_VERSION \
  git-checkout-interactive

# Set timezone
sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
echo 'America/New_York' | sudo tee /etc/timezone

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Done installing dotfiles" >> $HOME/.dotfile-install-log
