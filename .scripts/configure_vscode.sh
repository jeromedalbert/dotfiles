# VS Code
ln -sf ~/.dotfiles/.scripts/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/.dotfiles/.scripts/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# Cursor
ln -sf ~/.dotfiles/.scripts/.vscode/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json
ln -sf ~/.dotfiles/.scripts/.vscode/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
rm -rf ~/.cursor/extensions
ln -s ~/.vscode/extensions ~/.cursor/extensions
