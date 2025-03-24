# bat

[bat](https://github.com/sharkdp/bat) is a cat(1) clone with syntax
highlighting and Git integration.

## Themes

Currently using the theme [Catpuccino-machiato](https://github.com/catppuccin/bat.git).

### Setup

```
cd ~/.config/bat/themes
curl -o catppuccin-macchiato.tmTheme  https://raw.githubusercontent.com/catppuccin/bat/refs/heads/main/themes/Catppuccin%20Macchiato.tmTheme
bat cache --build
echo '--theme="catppuccin-macchiato"' >> ../config/bat/config
export BAT_THEME="catppuccin-macchiato"
bat --list-themes | grep Catppuccin
```
