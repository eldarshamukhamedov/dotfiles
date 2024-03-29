if which code > /dev/null; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Found VS Code instance" >> $HOME/.dotfile-install-log

  if [ -f "$HOME/.vscode-remote/.extensions-installed" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] VS Code extensions already installed, skipping setup" >> $HOME/.dotfile-install-log
  else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Installing VS Code extensions" >> $HOME/.dotfile-install-log
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension esbenp.prettier-vscode
    code --install-extension formulahendry.auto-close-tag
    code --install-extension formulahendry.auto-rename-tag
    code --install-extension styled-components.vscode-styled-components
    code --install-extension ms-azuretools.vscode-docker
    code --install-extension netcorext.uuid-generator
    code --install-extension rid9.datetime
    code --install-extension tyriar.sort-lines
    code --install-extension waderyan.gitblame
    code --install-extension prisma.prisma
    code --install-extension graphql.vscode-graphql
    code --install-extension irongeek.vscode-env
    code --install-extension bradlc.vscode-tailwindcss
    code --install-extension bungcip.better-toml

    touch "$HOME/.vscode-remote/.extensions-installed"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Done installing VS Code extensions" >> $HOME/.dotfile-install-log
    clear
  fi
else
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] VS Code not installed, skipping setup" >> $HOME/.dotfile-install-log
fi

